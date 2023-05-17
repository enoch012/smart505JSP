<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>
<%@ page import="com.bitc.jsp_0512.dto.MyfileDTO" %>
<%@ page import="com.bitc.jsp_0512.dao.MyfileDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-12
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");

  // 서버에서 파일을 저장할 폴더 설정
  String saveDirectory = "C:\\upload"; // 파일 저장할 디렉토리 경로
  int maxPostSize = 10 * 1024 * 1000; // 파일 최대 크기 (10MB)
  String encoding = "UTF-8";

  try{
    // cos.jar 을 사용하여 클라이언트에서 전달한 request 객체를 분석
    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

    // 클라이언트에서 전달한 input 태그 중 type 속성 값이 file인 태그 정보 가져오기, 파일명 가져오기
    String fileName = mr.getFilesystemName("attachedFile");
    // 파일의 확장자 명을 가져오기
    String ext = fileName.substring(fileName.lastIndexOf("."));
    // 현재 시간을 기준으로 사용자 입력 패턴 사용 마지막 대문자 S는 밀리초
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    // 현재 시간을 사용자 입력 패턴으로하여 문자열로 출력한 것을 확장자 부분과 합침, 현재 시간을 기준으로 새 파일명을 생성함
    String newFileName = now + ext; // 새로운 파일 이름 ("업로드일시.확장자")

    // 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName);
    File newFile = new File(saveDirectory + File.separator + newFileName);
    oldFile.renameTo(newFile);

    // 클라이언트에서 전달된 일반 input 태그 정보 가져오기 (나머지 폼값 받기)
    String name = mr.getParameter("userName");
    String title = mr.getParameter("title");
    // checkbox 정볼르 배열로 가져옴
    String[] cateArray = mr.getParameterValues("cate");

    /* StringBuffer(멀티스레드용)와 StringBuilder(싱글스레드용) : 문자열을 생성해줄 때 쓰는 것 (둘이 똑같음)
    * String 변수를 재정의해서 쓰는 것보다 메모리 사용에 효율적이다 */
    StringBuffer cateBuf = new StringBuffer(); // 빈문자열

    if(cateArray == null){
      cateBuf.append("선택 없음");
    } else {
      for (String str : cateArray){
        cateBuf.append(str + ",");
      }
    }

    // DB에 데이터를 전달하기 위한 DTO 객체 생성
    MyfileDTO dto = new MyfileDTO();
    dto.setName(name);
    dto.setTitle(title);
    // StringBuilder, StringBuffer 타입의 객체를 String 타입의 데이터로 변환
    dto.setCate(cateBuf.toString());
    // 원본 파일명
    dto.setOfile(fileName);
    // 서버에 저장된 파일명
    dto.setSfile(newFileName);

    // DAO를 통해 데이터 베이스에 반영
    MyfileDAO dao = new MyfileDAO();
    dao.open();
    // DB에 데이터 저장
    dao.insertFile(dto);
    dao.close();

    // 정상적으로 진행되었을 경우 파일목록 JSP로 리다이렉션
    response.sendRedirect("FileList.jsp");


  } catch (Exception e){
    // 오류 발생시 원래 페이지로 돌아감
    e.printStackTrace();
    request.setAttribute("errorMessage", "파일 업로드 오류");
    request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response); // 리퀘스트 영역에 메세지를 저장한 후 메인 파일로 포워드
  }


%>