<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  pageContext.setAttribute("scopeValue", "페이지 영역");
  request.setAttribute("scopeValue", "리퀘스트 영역");
  session.setAttribute("scopeValue", "세션 영역");
  application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<!DOCTYPE html>
<html>
<head>
  <title>표현 언어 - 내장 객체</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <h2>ImplicitObjMain 페이지</h2>
  <h3>각 영역에 저장된 속성 읽기</h3>
  <%-- JSP 표현 언어로 내장 객체 접근 시 Scope라는 단어가 추가됨 --%>
  <ul>
    <li>페이지 영역 : ${pageScope.scopeValue}</li>
    <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li>세션 영역 : ${sessionScope["scopeValue"]}</li> <%--대괄호 형식도 가능--%>
    <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
  </ul>

  <h3>영역 지정 없이 속성 읽기</h3>
  <ul>
    <%--영역 지정 없이 읽어오면 기본 값으로 페이지 영역이 뜬다--%>
    <li>${ scopeValue }</li>
  </ul>
  <%--포워드 하여 지정한 페이지로 이동
      페이지 영역은 나오지 않음 기본 속성 노출이 request 영역으로 값을 던져줌 --%>
  <%-- 서버 접속 후 지정한 페이지로 클라이언트의 요청 서버 내에서 이동 --%>
  <%--<jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>--%>
</div>
</body>
</html>
