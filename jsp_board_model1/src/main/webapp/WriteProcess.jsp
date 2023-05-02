<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--게시글 작성 시 처리 페이지--%>

<%--데이터 베이스 사용을 위해 dto 클래스와, dao 클래스를 가져옴--%>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="java.io.PrintWriter" %>

<%--글쓰기 페이지에서 사용자가 입력한 내용 가져오기--%>
<%
  request.setCharacterEncoding("UTF-8");
  String postTitle = request.getParameter("postTitle");
  String postContent = request.getParameter("postContent");

  // 가져온 값을 데이터 베이스에 전송하기 위한 DTO 클래스 타입의 객체에 저장
  BoardDto dto = new BoardDto();
  dto.setPostTitle(postTitle);
  // 세션 정보에 저장된 userId를 불러와서 사용해야함
  dto.setPostWriteUser("testuser");  dto.setPostContent(postContent);



  // 데이터 베이스 이용을 위해서 DAO 클래스 타입의 객체 생성 및 DB 연결
  BoardDao dao = new BoardDao();
  dao.dbOpen();

  // DAO 객체에서 제공하는 insert 메소드를 사용하여 데이터 베이스에 글 등록
  int insertResult = dao.insertBoard(dto);
  dao.dbClose();

  // 글 등록 성공 및 실패에 따라 화면 이동
  if (insertResult == 1){
    response.sendRedirect("BoardList.jsp");
  } else {
    String script = "<script>";
    script += "alert('글쓰기 중 오류가 발생 했습니다.');";
    script += "history.back();";
    script += "</script>";

    out.println(script);
  }


%>