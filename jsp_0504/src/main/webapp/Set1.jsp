
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--JSTL을 사용하기 위한 태그 라이브러리 등록--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--자바빈즈 사용을 위해서 클래스 가져오기--%>
<%@ page import="java.util.Date" %>
<%@ page import="com.bitc.jsp_0504.Person" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSTL - set 1</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <%
    /*원래 이렇게 표현했어야 함*/
    /*pageContext.setAttribute("directvar", 100);*/
  %>

  <%--jstl을 사용하여 기본 내장 객체인 page에 저장--%>
  <%--jstl을 사용하여 변수 directVar을 선언하고 정수 100을 저장--%>
  <c:set var="directVar" value="100" />
  <%--jstl을 사용하여 변수 elVar을 선언하고 el언어를 사용하여 기존에 생성한 변수 directVar을 가져와서 연산 후 저장 --%>
  <c:set var="elVar" value="${ directVar mod 5}" />
  <%--jstl을 사용하여 변수 expVar을 선언하고 jsp의 표현식을 사용하여 객체 생성 및 저장--%>
  <c:set var="expVar" value="<%= new Date()%>" />
  <%--jstl을 사용하여 변수 betweenVar을 선언하고 시작 태그와 끝 태그 사이에 데이터를 입력하여 저장--%>
  <c:set var="betweenVar">변수값 설정 메인쿤 귀여워</c:set>

  <h4>EL을 이용해 변수 출력</h4>
  <ul>
    <%--jstl을 사용하여 내장 객체(page)에 저장된 변수 값을 출력--%>
    <li>directVar : ${ pageScope.directVar }</li>
      <%--jstl을 사용하여 내장 객체(page)에 저장된 변수 값을 출력, 영역 지정이 없으면 기본 영역의 변수 출력--%>
    <li>elVar : ${elVar}</li>
    <li>expVar : ${expVar}</li>
    <li>betweenVar : ${betweenVar}</li>
  </ul>

  <h4>자바빈즈 생성 1 - 생성자 사용</h4>
  <%--jstl을 사용하여 자바 빈즈 타입의 변수 생성, value 속성에서 jsp 표현식으로 자바 객체를 생성, request 내장 객체에 저장--%>
  <c:set var="personVar1" value='<%= new Person("유다", 30)%>' scope="request"/>
  <ul>
    <%--jstl을 사용하여 생성한 자바빈즈 personVar1의 필드 name과 age 출력--%>
    <li>이름 : ${ requestScope.personVar1.name }</li>
    <li>나이 : ${ personVar1.age }</li>
  </ul>

  <h4>자바빈즈 생성 2 - target, property 사용</h4>
  <%--jstl을 사용하여 자바빈즈 변수 생성--%>
  <%--자바빈즈 규칙에 의하여 빈 생성자가 무조건 있기 때문에 데이터 없는 방식의 선언이 가능--%>
  <c:set var="personVar2" value="<%=new Person()%>" scope="request" />
  <%--jstl을 사용하여 생성된 자바빈즈를 target 속성으로 설정하고, property, value로 데이터를 입력(자바빈즈에 getter, setter가 있어서 가능)--%>
  <c:set target="${ personVar2 }" property="name" value="노아" />
  <c:set target="${ personVar2 }" property="age" value="21" />
  <ul>
    <li>이름 : ${ personVar2.name }</li>
    <li>나이 : ${ requestScope.personVar2.age }</li>
  </ul>
</div>
</body>
</html>
