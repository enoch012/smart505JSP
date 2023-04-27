<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오전 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="java.sql.*" %>

<%
  /*JDBConnect jdbc1 = new JDBConnect();
   jdbc1.open();
   jdbc1.close();*/

  String driver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbURL");

  String opt1 = application.getInitParameter("dbUrl10pt1");
  String opt2 = application.getInitParameter("dbUrl10pt2");
  String opt3 = application.getInitParameter("dbUrl10pt3");

  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

  JDBConnect jdbc2 = new JDBConnect(driver, dbUrl, dbUserId, dbUserPw);

%>
<!DOCTYPE html>
<html>
<head>
  <title>JDBC</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container my-4">
    <h2>JDBC 테스트</h2>
    <%
      try{
        jdbc2.open();

        String sql = "SELECT num, title, content, id, postdate, visitcount FROM board";
        jdbc2.psmt = jdbc2.con.prepareStatement(sql);
        jdbc2.rs = jdbc2.psmt.executeQuery();

    %>

    <%--문제 1) JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터 베이스 정보를 가져오는 프로그램을 작성하세요 --%>
    <%-- board 테이블의 정보를 가져와서 화면에 table 태그로 출력 --%>

    <table class="table table-hover text-center">
      <thead>
      <tr>
        <th>글 번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>아이디</th>
        <th>게시 날짜</th>
        <th>조회수</th>
      </tr>
      </thead>
      <tbody>
        <%
          while (jdbc2.rs.next()){
            int postNum = jdbc2.rs.getInt("num");
            String postTitle = jdbc2.rs.getString("title");
            String postContent = jdbc2.rs.getString("content");
            String postId = jdbc2.rs.getString("id");
            String postDate = jdbc2.rs.getString("postdate");
            int visitCount = jdbc2.rs.getInt("visitcount");
        %>
        <tr>
          <td><%=postNum%></td>
          <td><%=postTitle%></td>
          <td><%=postContent%></td>
          <td><%=postId%></td>
          <td><%=postDate%></td>
          <td><%=visitCount%></td>
        </tr>
      <%

          }
        }
        catch (SQLException e){
          System.out.println("데이터 베이스 사용 중 오류가 발생했습니다.");
          System.out.println("SQLException : " + e.getMessage());
        }
        finally {
          try {
            jdbc2.close();
          }
          catch (Exception e){}
        }
      %>
      </tbody>
    </table>
  </div>
</body>
</html>
