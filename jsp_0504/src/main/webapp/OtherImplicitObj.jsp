<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  response.setCharacterEncoding("UTF-8"); // 이거 넣으니까 쿠키 response 됨,,
  /*CookieManager.makeCookie(response, "ELCookie", "고양이 좋아요", 10);*/
  Cookie cookie = new Cookie("ELCookie", "쿠키되니"); // 쿠키값에 한글을 입력하니까 안됐다 우째서,,
  cookie.setHttpOnly(false);
  cookie.setPath("/");
  cookie.setMaxAge(10);
  response.addCookie(cookie);

%>
<!DOCTYPE html>
<html>
<head>
  <title>표현 언어 - 그 외 내장 객체</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h3>쿠키값 읽기</h3>
    <li>ELCookie값 : ${ cookie.ELCookie.value }</li>
    <br>
    <h3>HTTP 헤더 읽기</h3>
    <ul>
      <li>host : ${ header.host }</li>
      <li>user-agent : ${ header['user-agent']}</li>
      <li>cookie : ${ header.cookie }</li>
    </ul>
    <br>
    <h3>컨텍스트 초기화 매개변수 읽기</h3>
    <li>MySQLDriver : ${initParam.MySqlDriver}</li>
    <br>
    <h3>컨텍스트 루트 경로 읽기</h3>
    <li>${ pageContext.request.contextPath }</li>
  </div>
</body>
</html>
