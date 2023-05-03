<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오후 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%

  session.removeAttribute("userId");
  session.removeAttribute("userName");
  session.removeAttribute("userPw");

  session.invalidate(); // 세션에 있는 모든 속성 삭제

  String msg = "<script>";
  msg += "alert('로그아웃이 완료되었습니다.');";
  msg += "location.href = 'BoardList.jsp';";
  msg += "</script>";

  out.println(msg);

  /*response.sendRedirect("BoardList.jsp");*/ // 삭제 후 페이지 이동 이거 하니까 알림 안뜨고 바로 보내버림 ㅋㅋ
%>
