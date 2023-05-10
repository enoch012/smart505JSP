<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSTL - forEach 1</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container my-4">
    <h4>일반 for문 형태의 forEach 태그</h4>
    <c:forEach var="i" begin="1" end="3" step="1">
      <p>반복  ${i} 입니다</p>
    </c:forEach>

    <br>
    <h4>varStatus 속성 살펴보기</h4>
    <table class="table border">
      <c:forEach begin="3" end="5" var="i" varStatus="loop">
        <tr>
          <td>count : ${ loop.count }</td>
          <td>index : ${ loop.index }</td>
          <td>current : ${ loop.current }</td>
          <td>first : ${ loop.first }</td>
          <td>last : ${ loop.last }</td>
        </tr>
      </c:forEach>
    </table>

    <br>
    <h4>1에서 100까지 정수 중 홀수의 합</h4>

    <c:forEach begin="1" end="100" var="j">
      <c:if test="${j mod 2 ne 0}">
        <c:set var="sum" value="${ sum + j }" />
      </c:if>
    </c:forEach>
    1~100사이의 정수 중 홀수의 합은? ${sum}
  </div>
</body>
</html>
