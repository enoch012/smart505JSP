<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Front Controller</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <h3>한 번의 매핑으로 여러 가지 요청 처리하기</h3>
  <%-- EL 언어를 사용하여 내용이 없을 경우 표시 안함--%>
  <%--원래 아래와 같이 써야하는데 EL 방식이 훨씬 간편하고 값이 없을 경우의 오류를 대비할 수 있다.--%>
  <%--<%= request.getAttribute("resultValue") %>--%>
  <div>${ resultValue }</div>
  <ol>
    <li>URI : ${ uri }</li>
    <li>요청명 : ${ commandStr }</li>
  </ol>
  <div>
    <h4>하나의 요청으로 여러 방식 처리</h4>
    <ul class="list-group">
      <%-- a태그를 사용한 페이지 이동은 get 방식 --%>
      <li class="list-group-item"><a href="/servlet/regist.one">회원가입</a></li>
      <li class="list-group-item"><a href="/servlet/login.one">로그인</a></li>
      <li class="list-group-item"><a href="/servlet/freeboard.one">자유게시판</a></li>
    </ul>
  </div>

  <div>
    <h4>여러가지 요청을 여러개의 servlet으로 처리 </h4>
    <ul>
      <li class="linst-group-item"><a href="/servlet/regist.two">회원 가입</a></li>
      <li class="linst-group-item"><a href="/servlet/login.two">로그인</a></li>
      <li class="linst-group-item"><a href="/servlet/freeboard.two">자유 게시판</a></li>

    </ul>
  </div>
</div>
</body>
</html>
