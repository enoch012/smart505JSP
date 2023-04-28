<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
  <div class="container my-4">
    <%
      SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 형식

      long  creationTime = session.getCreationTime();
      String creationTimeStr = dateFormat.format(new Date(creationTime)); // 최초 요청 (세션 생성) 시작

      long lastTime = session.getLastAccessedTime();
      String lastTimeStr = dateFormat.format(new Date(lastTime)); // 마지막 요청 시작
    %>

    <h2>Session 설정 확인</h2>
    <ul>
      <li>세션 유지 시간 : <%= session.getMaxInactiveInterval()%></li>
      <li>세션 아이디 : <%=session.getId()%></li>
      <li>최초 요청 시각 : <%=creationTimeStr%></li>
      <li>마지막 요청 시작 : <%=lastTimeStr%></li>
    </ul>
  </div>
</body>
</html>
