<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--1. 데이터 베이스 사용을 위한 사용자 정보용 DTO, DAO 클래스 import--%>
<%@ page import="com.bitc.jsp_board_model1.MemberDao" %>
<%@ page import="com.bitc.jsp_board_model1.MemberDto" %>

<%
  request.setCharacterEncoding("UTF-8");
  // 2. 클라이언트에서 전달한 데이터 가져오기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

  // 3. 데이터 베이스 연결
  MemberDao dao = new MemberDao();
  dao.dbOpen();

  // 4. 클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인
  // 조회 결과가 1이면 데이터 베이스에 정보가 있음, 아니면 오류가 발생
  int selectResult = dao.isMember(userId, userPw);
  if (selectResult == 1){
    // 사용자 정보를 데이터 베이스에서 가져옴
    MemberDto member = dao.selectMember(userId, userPw);

    // 5. 확인 여부에 따라 세션에 데이터 저장
    session.setAttribute("userId", member.getUserId());
    session.setAttribute("userName", member.getUserName());
    session.setMaxInactiveInterval(60); // 세션 유지 시간
    // 6. 첫화면으로 이동
    response.sendRedirect("BoardList.jsp");
  } else {
    // 아니면 오류 메세지 출력
    String errMsg = "<script>";
    errMsg += "alert('아이디나 비밀번호가 다릅니다');";
    errMsg += "history.back();"; // 이전 화면으로 이동
    errMsg += "</script>";
    out.println(errMsg);
  }

%>
