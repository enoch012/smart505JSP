<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 클라이언트에서 user_id, user_pw, save_check 값을 얻음
  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");
  String save_check = request.getParameter("save_check");

  if ("must".equals(user_id) && "1234".equals(user_pw)){ // 사용자 인증
    // 로그인 성공시, 클라이언트에서 전송된 정보 중 saveCheck 값이 Y이면
    if (save_check != null && save_check.equals("Y")){
      CookieManager.makeCookie(response, "loginId", user_id, 86400); // 쿠키생성
    } else {
      CookieManager.deleteCookie(response, "loginId"); // 아니면 쿠키 삭제
    }

    JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
  } else {
    //로그인 실패
    JSFunction.alertBack("로그인에 실패했습니다.", out);
  }
%>
