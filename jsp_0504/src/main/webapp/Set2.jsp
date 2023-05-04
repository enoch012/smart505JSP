<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSTL - set2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%
  ArrayList<Person> pList = new ArrayList<Person>();
  pList.add(new Person("노아", 21));
  pList.add(new Person("유다", 30));

  Map<String, Person> pMap = new HashMap<>();
  pMap.put("personArgs1", new Person("노을", 18));
  pMap.put("personArgs2", new Person("다정", 18));
%>

<h4>List 컬렉션 이용하기</h4>
<%-- 리스트를 변수명에 저장 --%>
<c:set var="personList" value="<%=pList%>" scope="request" />
<ul>
  <%-- 속성값을 읽어오는 명령어 다음 리스트 요소를 불러올 수 있다 --%>
  <li>이름 : ${ requestScope.personList[0].name }</li>
    <%-- 다른 영역에 똑같은 이름으로 저장한 속성이 없으므로 requestScope는 생략할 수 있다 --%>
  <li>나이 : ${ personList[0].age }</li>
</ul>
<hr>
<h4>Map 컬렉션 이용하기</h4>

<c:set var="personMap" value="<%=pMap%>" scope="request" />
<ul>
  <li>이름 : ${ requestScope.personMap.personArgs2.name }</li>
  <li>나이 : ${ personMap.personArgs2.age }</li>
</ul>
</body>
</html>
