<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-12
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>

<%

  // 파일이 저장된

  request.setCharacterEncoding("UTF-8");

  String saveDirectory = "C:\\upload";

  // 이전 페이지인 FileList.jsp에서 전달한 매개변수 (get 방식)
  String saveFilename = request.getParameter("sName");
  String originalFilename = request.getParameter("oName");

  try {
    // 지정한 경로 및 파일명으로 File 객체를 생성
    File file = new File(saveDirectory, saveFilename);

    // 자바에서 파일 쓰는 클래스 InputStream
    // 스트림을 사용하여 파일 정보를 가져옴
    InputStream inStream = new FileInputStream(file);

    // 클라이언트 정보 가져오기 (93p)
    String client = request.getHeader("User-Agent");
    // 한글 파일명 깨짐 방지
    if (client.indexOf("WOW64") == -1){
      originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
    } else {
      originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
    }

    /*response 응답 내장 객체에 파일 다운로드용 응답 헤더 정보 입력*/
    // 응답 헤더를 초기화
    response.reset();
    // 다운로드용 컨텐츠 타입 설정
    response.setContentType("application/octet-stream"); //
    // 웹 브라우저에서 다운로드 시 원본 이름이 출력되도록 설정
    response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
    response.setHeader("Content-Length", "" + file.length());

    // 출력 스트림 초기화
    out.clear();

    // response 내장 객체로부터 새로운 출력 스트림 생성
    OutputStream outStream = response.getOutputStream();

    // 출력 스트림에 파일 내용 출력
    // 실제 파일의 내용을 출력 스트림에 입력함
    // byte 타입의 배열을 서버에 저장된 파일의 크기로 생섬함.
    byte b[] = new byte[(int)file.length()];
    int readBuffer = 0;

    // 파일 내용을 읽어옴, 스트림에 저장된 크기 가져옴
    while((readBuffer = inStream.read(b))>0) {
      // 출력 스트림에 읽어온 파일 내용을 쓰기
      outStream.write(b, 0, readBuffer); // 0부터 readBuffer의 길이만큼
    }

    // file이라는 외부 리소스를 사용한 것이므로 반드시 직접 닫아줘야함.
    inStream.close();
    outStream.close();

  } catch (FileNotFoundException e){

    String script = "<script>";
    script += "alert('파일을 찾을 수 없습니다.');";
    script += "history.back();";
    script += "</script>";

    out.print(script);
  } catch (Exception e){

    String script = "<script>";
    script += "alert('예외가 발생했습니다.');";
    script += "history.back();";
    script += "</script>";

    out.print(script);
  }
%>
