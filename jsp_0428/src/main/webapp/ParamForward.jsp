<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>액션 태그 - param</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <%-- jsp:useBean로 자바빈즈 객체 생성, 데이터 범위가 request로 설정 --%>
    <%-- 이전 페이지인 ParamMain.jsp에서 생성한 자바빈즈의 내용이 그대로 존재함 --%>
    <jsp:useBean id="person" class="com.example.jsp_0428.Person" scope="request" />
    <h2>포워드된 페이지에서 매개변수 확인</h2>
    <ul>
      <%-- 데이터를 설정하지 않았는데도 액션 태그 getProperty로 자바빈즈의 데이터 가져옴 --%>
      <li><jsp:getProperty name="person" property="name"/></li>
      <li>나이 : <jsp:getProperty name="person" property="age"/></li>
      <li>본명 : <%=request.getParameter("param1")%></li>
      <li>출생 : <%=request.getParameter("param2")%></li>
      <li>특징 : <%=request.getParameter("param3")%></li>
    </ul>
      <%--액션 태그 include로 ParamInclude.jsp 페이지 호출--%>
      <%--액션 태그 param을 통해서 전송된 매개변수.--%>
    <jsp:include page="ParamInclude.jsp">
      <jsp:param name="loc1" value="토론토"/>
      <jsp:param name="loc2" value="주택"/>
    </jsp:include>
  </div>
</body>
</html>
