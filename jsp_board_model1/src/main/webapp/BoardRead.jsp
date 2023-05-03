<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>

<%
  // BoardList에서 넘겨준 글 번호 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));

  // 데이터 베이스 연결을 위해 BoardDao 객체 생성
  BoardDao dao = new BoardDao();
  dao.dbOpen();
  dao.updateVisitCount(postNum);

  // 글 번호를 매개변수로 하여 게시글의 해당 글 내용을 가져오기(BoardDto 타입의 객체에 저장)
  BoardDto board = dao.selectBoard(postNum);

  dao.dbClose();

  // 로그인이 적용 되는지 세션 확인용
  String userId = (String) session.getAttribute("userId");
  String userName = (String) session.getAttribute("userName");

  String writerUser = board.getPostWriteUser(); // 작성자
%>
<!DOCTYPE html>
<html>
<head>
  <title>글 목록 확인하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <script>
    $(document).ready(function () {
       $("#btn-list").on("click", function () {
           history.back();
       });

       $("#btn-delete").on("click", function () {
           let confirmed = confirm("정말로 삭제하시겠습니까?");
           if(confirmed){
               /* 단순 링크를 사용하여 DeleteProcess.jsp로 이동하여 삭제 */
               const postNum = $("#post-num").val();
               let url = "DeleteProcess.jsp?postNum" + postNum;
               location.href = url;
           }
       });

       $("#btn-edit").on("click", function () {
           // id 값이 post-num 인 html 태그의 value 값을 가져오기
           const postNum = $("#post-num").val();
           // 이동하려고 하는 URL 만들기
           const url = "BoardUpdate.jsp?postNum=" + postNum; // 문자열 뒤에 공백 남기면 안됨, 정수 변경할 때 정수 변경이 안됨
           // 자바스크립트의 페이지 이동 명령을 사용하여 해당 페이지로 이동
           location.href = url;
       });
    });
  </script>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="container my-4 p-0">
  <%--글 번호, 글 제목--%>
  <div class="row my-3">
    <div class="col-sm-2">
      <label for="post-num" class="form-label">글 번호 </label>
      <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" disabled>
    </div>
    <div class="col-sm">
      <label for="post-title" class="form-label">글 제목 </label>
      <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
    </div>
  </div>
    <%--글쓴이, 등록시간 조회수--%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-write-user" class="form-label">글쓴이</label>
      <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%=writerUser%>" readonly>
    </div>
    <div class="col-sm">
      <label for="post-date" class="form-label">등록시간</label>
      <input type="text" class="form-control" id="post-date" name="postDate" value="<%=board.getPostDate()%>" readonly>
    </div>
    <div class="col-sm-2">
      <label for="post-visit-count" class="form-label">조회수</label>
      <input type="text" class="form-control" id="post-visit-count" name="postVisitCount" value="<%=board.getPostVisitCount()%>" disabled>
    </div>
  </div>
    <%--글 내용--%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-content" class="form-label">글내용</label>
      <textarea name="postContent" id="post-content" class="form-control" rows="10" ><%=board.getPostContent()%></textarea>
    </div>
  </div>
  <%--버튼(목록, 수정, 삭제)--%>
  <%-- float 방법, 요즘은 float를 안 쓰려고 하는 추세이다 --%>
  <%--<div class="row clearfix">
    <div class="col-sm clearfix">
      <button type="button" id="btn-list" class="btn btn-secondary float-start">목록</button>
      <button type="button" id="btn-edit" class="btn btn-primary float-end ms-2">수정</button>
      <button type="button" id="btn-delete" class="btn btn-danger float-end">삭제</button>
    </div>
  </div>--%>
  <%-- flexbox 방법--%>
  <div class="row">
    <div class="col-sm d-flex justify-content-start">
      <button type="button" id="btn-list" class="btn btn-secondary float-start">목록</button>
    </div>

    <div class="col-sm d-flex justify-content-end">
      <%
        if (writerUser.equals(userId) == true){
      %>
      <%-- 1. a 태그를 사용하여 BoardUpdate.jsp로 이동 --%>
        <%--<a href="BoardUpdate.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-primary">수정</a>--%>
      <%--2. 자바스크립트를 사용하여 BoardUpdate.jsp로 이동---%>
      <button type="button" id="btn-edit" class="btn btn-primary float-end me-2">수정</button>

      <%-- 1. form 사용 방식
      <%-- form을 사용시 form 태그의 자식 태그로 포함되어 있는 input 태그의 데이터만 서버로 전송 --%>
      <%--<form action="DeleteProcess.jsp" method="get">
        <input type="hidden" name="postNum" value="<%=board.getPostNum()%>">
        <button type="submit" id="btn-delete" class="btn btn-danger float-end" >삭제(방법 1번)</button>
      </form>--%>

      <%-- 2. a태그를 사용해 직접 이동--%>
      <%--<a href="DeleteProcess.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-danger">삭제(방법 2번)</a>--%>

      <%-- 3. javascript 사용 방식(제일 깔끔함)--%>
      <button type="button" id="btn-delete" class="btn btn-danger float-end" >삭제</button>
      <%
        } else {
      %>
      <div></div>
      <%
        }
      %>
    </div>

  </div>
</main>
<%@ include file="Footer.jsp"%>
</body>
</html>
