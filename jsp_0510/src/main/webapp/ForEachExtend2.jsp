<%@ page import="java.util.LinkedList" %>
<%@ page import="com.bitc.jsp_0510.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 12:22
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
<div class="container my-4">
  <h4>List 컬렉션 사용하기</h4>
  <%
    LinkedList<Person> lists = new LinkedList<Person>();
    lists.add(new Person("유다", 30));
    lists.add(new Person("노아", 21));
    lists.add(new Person("설노을", 18));
  %>

  <%-- jstl을 사용하여 리스트 객체를 page 영역에 변수 이름을 다시 정의하여 저장 --%>
  <c:set var="lists" value="<%=lists%>" />
  <c:forEach var="list" items="${ lists }">
    <li>
      이름 : ${ list.name }, 나이 : ${ list.age }
    </li>
  </c:forEach>

  <br><br>
  <h4>Map 컬렉션 사용하기</h4>
  <%
    Map<String, Person> maps = new HashMap<>();
    maps.put("1st", new Person("유다", 30));
    maps.put("2nd", new Person("노아", 21));
    maps.put("3rd", new Person("다정", 18));
  %>

  <c:set var="maps" value="<%= maps %>" />
  <c:forEach var="map" items="${ maps }">
    <li>
      Key => ${ map.key } <br>
      Value => 이름 : ${ map.value.name }, 나이 : ${ map.value.age }
    </li>
  </c:forEach>
</div>
</body>
</html>
