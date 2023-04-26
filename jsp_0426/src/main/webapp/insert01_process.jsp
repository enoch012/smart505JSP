<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Statement로 SQL문 실행하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <%
    Connection conn = null; // 연결을 위한 Connection 타입의 변수
    /*쿼리문을 번역하여 데이터베이스로 */
    Statement stmt = null; // 쿼리문 날리기 위한 stmt

    request.setCharacterEncoding("UTF-8");
    /* insert01.jsp로부터 전송된 데이터 받기 */
    String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      String userName = request.getParameter("userName");

    try {
      String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
      String dbUserId = "full505";
      String dbUserPw = "full505";

      Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 로딩
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw); // db 연결, 성공시 conn에 db객체 삽입

      /* Statement(정적 쿼리문) 에서 사용하는 SQL 문자열
      Statement 에서는 String 클래스 타입의 문자열로 SQL 문자열을 완성하고 해당 SQL 뭐리문을 완성함*/

      String sql = "INSERT INTO member(id, pass, name, regidate) "; // 쿼리문을 문자열 변수로 넣을 시 뒤에 한칸 띄워줄 것!
      sql += "VALUES ('" + userId +"', '"+ userPw +"', '"+ userName+ "', NOW())";

      /* connection 객체를 통해서 Statement 객체를 생성 */
      stmt = conn.createStatement();

      /* 데이터베이스로 SQL 쿼리문을 전달하여 실행 */
      int result = stmt.executeUpdate(sql); // 데이터 개수를 int 타입으로 반환함.
      out.println("테이블에 데이터 추가가 성공했습니다.");
      out.println(result + "개의 데이터 추가");
    }
    catch (SQLException e){
      out.println("데이터베이스 사용 시 오류가 발생했습니다.<br>");
      out.println("SQLException : " + e.getMessage());
    }

    finally {
      try {
        if (stmt !=null){stmt.close();}
        if (conn !=null){conn.close();}
      } catch (Exception e){}
    }

  %>
</div>
</body>
</html>
