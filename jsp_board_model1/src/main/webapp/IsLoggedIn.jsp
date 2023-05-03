<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--로그인 세션 확인용 페이지--%>

<%
  if(session.getAttribute("userId") == null){
    String errMsg = "<script>";
    errMsg += "alert('로그인 후 이용해주세요.');";
    errMsg += "location.href = './Login.jsp';";
    errMsg += "</script>";

    out.println(errMsg);
    return;
  }

  /*if(session.getAttribute("userId") == null){
    if(!(request.getRequestURI().equals("/Login.jsp") ||)) {
      //지정한 페이지를 제외한 페이지에서 로그인 체크를 진행
      String errMsg = "<script>";
      errMsg += "alert('로그인 후 이용해주세요.');";
      errMsg += "location.href = './Login.jsp';";
      errMsg += "</script>";

      out.println(errMsg);
      return;
    }
  }*/
%>
