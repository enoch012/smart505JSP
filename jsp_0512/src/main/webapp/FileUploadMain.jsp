<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-12
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>FileUpload</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <script>

  </script>
</head>
<body>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-5 mx-auto">
        <h3>파일 업로드</h3>
        <%--<span style="color: red;">${ errorMessage }</span>--%>
        <form action="UploadProcess.jsp" name="fileForm" method="post" enctype="multipart/form-data" onsubmit="">
          <label for="user-name" class="form-label">작성자</label>
          <input type="text" id="user-name" name="userName" value="머스트해브" class="form-control"><br>
          <label for="title" class="form-label">제목</label>
          <input type="text" id="title" name="title" placeholder="제목을 입력하세요." class="form-control"><br>
          <label for="cate" class="form-label">카테고리(선택사항)</label>
          <%-- chechbox 사용 시 name 속성의 값이 동일하면 서버에 배열로 전달 --%>
          <input type="checkbox" id="cate" name="cate" value="사진" checked> 사진
          <input type="checkbox" name="cate" value="과제"> 과제
          <input type="checkbox" name="cate" value="워드"> 워드
          <input type="checkbox" name="cate" value="음원"> 음원 <br>
          <label for="file" class="form-label">첨부파일</label>
          <input type="file" id="file" name="attachedFile" class="form-control"><br>
          <button type="submit" class="btn btn-dark">전송하기</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
