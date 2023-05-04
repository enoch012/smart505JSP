<%@ page import="com.bitc.jsp_0504.MyElClass" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--368p tld 파일 불러오는 법, 옛날 방식--%>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%
  MyElClass myClass = new MyElClass();
  pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
  <title>표현 언어 - 메소드 호출</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <h3>영역에 저장 후 메소드 호출하기</h3>
  001225-3000000 => ${ myClass.getGender("001225-3000000")} <br>
  001225-2000000 => ${ myClass.getGender("001225-2000000")}

  <hr>

  <%-- 최신 EL 언어의 정적 메소드 호출 방식 --%>
  <%-- 기존 자바 문법에서의 정적 메소드 호출하는 것과 동일 --%>

  <h3>클래스명을 통해 정적 메소드 호출하기</h3>
  ${ MyElClass.showGugudan(7)}

  <hr>

  <%-- 옛날 방식, 현업에서 마주칠 수 있다 --%>
  <h3>TLD 파일 등록 후 정적 메소드 호출</h3>
  <ul>
    <li>mytag:isNumber("100") => ${mytag:isNumber("100")}</li>
    <li>mytag:isNumber("이백") => ${mytag:isNumber("이백")}</li>
  </ul>
</div>
</body>
</html>
