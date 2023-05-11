<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <h4>로케일 설정</h4>
  <c:set var="today" value="<%= new java.util.Date() %>" />

  <%-- setLocale : value 속성에 언어 정보와 지역 정보를 함께 입력하여 설정 --%>
  <%-- 언어 약어(iso-639) https://ko.wikipedia.org/wiki/ISO_639 --%>
  <%-- 지역 약어(iso-3166) https://ko.wikipedia.org/wiki/ISO_3166-1_alpha-2 --%>
  <p>
    한글로 설정 : <fmt:setLocale value="ko_kr" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /><br>
  </p>
  <p>
    일어로 설정 : <fmt:setLocale value="ja_JP" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /><br>
  </p>
  <p>
    영어로 설정 : <fmt:setLocale value="en_US" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /> <br>
  </p>
</div>
</body>
</html>
