<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>

<%
  // 이전 페이지에서 전달한 현재 글번호 가져오기

int postNum = Integer.parseInt(request.getParameter("postNum"));
BoardDao dao = new BoardDao();

dao.dbOpen();

//현재 글 내용 불러오기
BoardDto board = dao.selectBoard(postNum);


// 연결 해제
  dao.dbClose();
%>

<!DOCTYPE html>
<html>
<head>
  <title>글 수정 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<header class="mb-4">
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <ul class="navbar-nav">
      <li class="nav-link"><a href="#" class="nav-link">메뉴1</a></li>
    </ul>
  </nav>
  <div class="container my-4 py-5 bg-secondary bg-opacity-25">
    <h1 class="text-center">Model1 방식 게시판 글 수정</h1>
  </div>
</header>
<main class="container my-4 p-0">
  <form action="UpdateProcess.jsp" method="post">
    <%--글 번호--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-num" class="form-label">글 번호 : </label>
        <%-- disabled를 하니까 값을 못 넘겨준다 readonly로 할 것 --%>
        <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" readonly>
      </div>
    </div>
    <%--글 제목(수정가능)--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-title" class="form-label" >글 제목 : </label>
        <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
      </div>
    </div>
    <%--글쓴이--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-write-user" class="form-label" >작성자 : </label>
        <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%=board.getPostWriteUser()%>" readonly>
      </div>
    </div>
    <%--글 내용(수정가능)--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-content" class="form-label">글 내용 : </label>
        <textarea type="text" class="form-control" id="post-content" name="postContent" rows="10"  value="<%=board.getPostContent()%>"placeholder="내용을 입력해주세요."></textarea>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto d-flex justify-content-end">
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="reset" class="btn btn-secondary ms-2" id="btn-cancel">취소</button>
      </div>
    </div>
  </form>
</main>
<footer class="container-fluid my-5 p-5 border-top">
  <p class="lead text-muted text-center">made by fullstack505</p>
</footer>
</body>
</html>
