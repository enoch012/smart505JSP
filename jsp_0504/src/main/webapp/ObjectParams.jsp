<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<!DOCTYPE html>
<html>
<head>
  <title>표현 언어 - 객체 매개변수</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%-- 자바빈즈 클래스 규칙을 안 지키면 오류가 날 수 있다. --%>
<%-- 내장 객체 request에 데이터 저장 --%>
  <%
    request.setAttribute("personObj", new Person("정유다", 30));
    request.setAttribute("stringObj", "고양이는 너무 귀여워");
    request.setAttribute("integerObj", 99);
  %>
<%--forward--%>
  <jsp:forward page="ObjectResult.jsp">
    <jsp:param name="firstNum" value="10"/>
    <jsp:param name="secondNum" value="20"/>
  </jsp:forward>
</body>
</html>
