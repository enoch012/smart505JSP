<%@ page import="java.util.Spliterator" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  /* 요청 받은 페이지인 ParamMain.jsp에서 생성한 변수 */
  request.setCharacterEncoding("UTF-8");
  String pValue = "피아니스트"; // 이 페이지에서 사용 가능
%>
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
<%-- 액션 태그 UseBean으로 자바빈즈 생성, 생성한 자바빈즈의 데이터 영역을 request로 설정 --%>
<%-- 액션 태그의 include와 forward로 다시 요청한 페이지까지 데이터가 공유됨--%>
<%-- scope를 page로 하면 setProperty한 데이터가 포워드까지 사용되지 않음 --%>
  <jsp:useBean id="person" class="com.example.jsp_0428.Person" scope="request" />
<%--액션 태그 setProperty로 데이터 입력--%>
  <jsp:setProperty name="person" property="name" value="다정"></jsp:setProperty>
  <jsp:setProperty name="person" property="age" value="30"></jsp:setProperty>

<%--액션 태그 forward로 ParamForward.jsp로 데이터를 가지고 이동(주소는 고정됨) --%>
<%--이동 주소에 param1이라는 변수명으로 데이터를 추가하여 이동함 --%>
<%-- 액션 태그 param을 사용하여 매개변수를 추가로 전송함 --%>
  <jsp:forward page="ParamForward.jsp?param1=유다">
    <jsp:param name="param2" value="캐나다"/>
    <jsp:param name="param3" value="<%=pValue%>"/>
  </jsp:forward>
</body>
</html>
