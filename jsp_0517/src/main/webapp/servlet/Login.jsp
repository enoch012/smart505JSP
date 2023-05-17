<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <div class="row">
    <div class="col-sm-4 mx-auto border rounded p-3 px-4">
      <form action="/servlet/LoginProcess.do" method="post">
        <div class="my-2">
          <label for="user-id" class="form-label">아이디</label>
          <input type="text" id="user-id" name="userId" class="form-control" placeholder="아이디를 입력하세요.">
        </div>
        <div class="my-2">
          <label for="user-pw" class="form-label">비밀번호</label>
          <input type="password" id="user-pw" name="userPw" class="form-control" placeholder="비밀번호를 입력하세요.">
        </div>
        <div class="d-grid gap-3">
        <input type="submit" class="btn btn-dark my-3" value="로그인">
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
