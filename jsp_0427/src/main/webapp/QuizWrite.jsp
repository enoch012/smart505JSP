<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect2" %>
<%@ page import="com.bitc.jsp_0427.DBConnPool" %>

<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%-- 문제 2) JDBConnect2 클래스에 게시판의 글을 등록하는 postWrite, 리스트를 확인하는 postList 메소드를 추가하고, 해당 메소드를 사용하여 게시판의 글 목록을 확인하는 프로그램을 작성하세요 --%>
<%-- 해당 클래스의 필드의 접근 제한자를 모두 private으로 수정 --%>
<%-- postWrite, postList 메소드는 해당 실행 결과만 받아와서 출력--%>
<%-- postWrite를 적용할 글 등록 페이지 --%>
<%-- postList를 적용할 글 목록 페이지 --%>

  <div class="container my-4">
    <div class="row">
      <div class="col-sm-6 mx-auto">
        <form action="QuizWriteInsert.jsp" method="post">
          <div class="my-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
          </div>
          <div class="my-3">
            <label for="user-id" class="form-label">작성자</label>
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="ID를 입력해주세요.">
          </div>
          <div class="my-3">
            <label for="content" class="form-label">내용</label>
            <textarea type="text" class="form-control" name="content" id="content" rows="10"></textarea>
          </div>
          <div class="my-3 d-flex justify-content-end">
            <button type="submit" class="btn btn-primary me-2">게시하기</button>
            <button type="reset" class="btn btn-secondary me-2">취소</button>
            <a href="./QuizBoardList.jsp" class="btn btn-primary">목록</a>
          </div>
        </form>
        <div class="my-3 d-flex justify-content-start">

        </div>
      </div>
    </div>
  </div>
</body>
</html>
