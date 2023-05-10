<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSTL - forEach2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h4>향상된 for문 형태의 forEach 태그</h4>
    <%
      /* 스크립틀릿을 사용하여 배열 생성 */
    String[] rgba = {"Red", "Green", "Blue", "Black"};
    %>

    <%-- jstl의 forEach로 향상된 for문 구현 --%>
    <%-- 배열을 내장 객체에 저장한 것이 아니어서 jsp 표현식으로 변수 표현--%>
    <c:forEach items="<%=rgba%>" var="color">
      <span style="color:${ color };">${ color }</span>
    </c:forEach>

    <h4>varStatus 속성 살펴보기</h4>
    <table class="table border">
      <%-- 향상된 for문을 쓰면 index와 current가 달라진다 --%>
      <c:forEach items="<%=rgba%>" var="c" varStatus="loop">
        <tr>
          <td>count : ${ loop.count }</td>
          <td>index : ${ loop.index }</td>
          <td>current : ${ loop.current }</td>
          <td>first : ${ loop.first }</td>
          <td>last : ${ loop.last }</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
