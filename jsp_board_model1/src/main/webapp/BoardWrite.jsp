<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--로그인 된 사람만 이용할 수 있도록 함--%>
<%@ include file="./IsLoggedIn.jsp"%>

<!DOCTYPE html>

<html>
<head>
  <title>글 작성 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="Header.jsp"%>
<main class="container my-4 p-0">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <form action="WriteProcess.jsp" name="writeFrm" method="post" onsubmit="">
        <div class="my-3">
          <label for="post-title" class="form-label">제목 </label>
          <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요">
        </div>
        <div class="my-3">
          <label for="post-content" class="form-label">내용 </label>
          <textarea type="text" class="form-control" id="post-content" name="postContent" rows="10" placeholder="내용을 입력하세요"></textarea>
        </div>
          <div class="my-3 d-grid gap-3">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-secondary" id="btn-reset">취소</button>
          </div>
      </form>
    </div>
  </div>
</main>
<%@ include file="Footer.jsp"%>
</body>
</html>
