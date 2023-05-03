<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>model1 방식 게시판 만들기 - 로그인 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="container">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="LoginProcess.jsp" method="post">
        <div class="my-3 form-floating">
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="ID를 입력하세요.">
          <label for="user-id">User ID</label>
        </div>
        <div class="my-3 form-floating">
          <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="Password를 입력하세요">
          <label for="user-pw">User PW</label>
        </div>
        <div class="my-3 d-grid gap-3 form-floating">
          <button type="submit" class="btn btn-primary">로그인</button>
          <button type="button" class="btn btn-secondary">취소</button>
        </div>
      </form>
    </div>
  </div>
</main>
<%@ include file="Footer.jsp"%>
</body>
</html>
