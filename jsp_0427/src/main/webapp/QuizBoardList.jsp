<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_0427.JDBConnect2" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%

  // db 연결에 필요한 정보 얻어오기
  String driver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbURL");

  String opt1 = application.getInitParameter("dbUrl10pt1");
  String opt2 = application.getInitParameter("dbUrl10pt2");
  String opt3 = application.getInitParameter("dbUrl10pt3");

  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  // db 연결주소 합치기
  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

  List<Map<String, String>> dataList = null;

  JDBConnect2 db = new JDBConnect2(driver, dbUrl, dbUserId, dbUserPw);
  // 데이터베이스 연결
  db.open();
  dataList = db.postList();

  // 데이터베이스 연결 해제
  db.close();

  // 출력 테스트
  for (Map<String, String> data : dataList){
    String postNum = data.get("postNum");
    String postTitle = data.get("postTitle");
    String postUser = data.get("postUser");
    String postContent= data.get("postContent");
    String postDate = data.get("postDate");
    String postVisit = data.get("postVisit");
    System.out.println(postTitle + " "+ postUser);
  }

%>

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
<div class="container">
  <table class="table table-hover my-4">
    <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성자</th>
      <th>게시일</th>
      <th>조회수</th>
    </tr>
    </thead>
    <tbody>
      <%
      for (Map<String, String> data : dataList){
        String postNum = data.get("postNum");
        String postTitle = data.get("postTitle");
        String postUser = data.get("postUser");
        String postContent= data.get("postContent");
        String postDate = data.get("postDate");
        String postVisit = data.get("postVisit");

      %>
      <tr>
        <td><%=postNum%></td>
        <td><%=postTitle%></td>
        <td><%=postUser%></td>
        <td><%=postContent%></td>
        <td><%=postDate%></td>
        <td><%=postVisit%></td>
      </tr>
      <%
        }
      %>
    </tbody>
  </table>
  <div class="d-flex justify-content-end">
    <a href="./QuizWrite.jsp" class="btn btn-primary my-2">글쓰기</a>
  </div>
</div>
</body>
</html>
