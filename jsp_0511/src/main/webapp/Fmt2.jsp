<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSTL - fmt2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container my-4">
    <%-- jstl을 사용하여 Date 클래스의 객체를 생성 후 page 영역의 변수 today에 저장 --%>
    <%-- 현재 시간을 기준으로 날짜 및 시간 정보를 저장 --%>
    <c:set var="today" value="<%= new java.util.Date() %>" />

    <h4>날짜 포맷</h4>
      <%--jstl을 사용하여 page 영역에 저장된 날자 정보를 불러와서 화면에 출력--%>
      <%--type 속성을 date로 설정하여 날짜 정보만 출력--%>
    full : <fmt:formatDate value="${ today }" type="date" dateStyle="full" /><br>
    short : <fmt:formatDate value="${ today }" type="date" dateStyle="short" /><br>
    long : <fmt:formatDate value="${ today }" type="date" dateStyle="long" /><br>
    default : <fmt:formatDate value="${ today }" type="date" dateStyle="default" /><br>

    <h4>시간 포맷</h4>
      <%-- type 속성을 time으로 설정하여 시간 정보만 출력 --%>
    full : <fmt:formatDate value="${ today }" type="time" timeStyle="full" /><br>
    short : <fmt:formatDate value="${ today }" type="time" timeStyle="short" /><br>
    long : <fmt:formatDate value="${ today }" type="time" timeStyle="long" /><br>
    default : <fmt:formatDate value="${ today }" type="time" timeStyle="default" /><br>

    <h4>날짜 / 시간 표시</h4>
      <%-- type 속성을 both로 설정하여 날짜, 시간 정보 모두 출력 --%>
    <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
    <br>
      <%-- 출력 패턴을 사용자가 직접 지정한 방식 --%>
      <%-- 출력 패턴 알파벳 참고 : https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/text/SimpleDateFormat.html --%>
    <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd a hh:mm:ss" />

    <h4>타임존 설정</h4>
    <fmt:timeZone value="GMT">
      <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
      <br>
    </fmt:timeZone>
    <fmt:timeZone value="America/Chicago">
      <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
    </fmt:timeZone>
      <br>
      <fmt:timeZone value="Asia/Seoul">
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
      </fmt:timeZone>
  </div>
</body>
</html>
