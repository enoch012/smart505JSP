<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
  // 클라이언트에서 전송한 데이터를 가져옴
  String chkVal = request.getParameter("inactiveToday"); // 통신으로 체크박스 값을 받음

  if (chkVal != null && chkVal.equals("1")){ // 값이 1이라면 쿠키 추가
    Cookie cookie = new Cookie("PopupClose", "off"); //이름과 값 설정
    cookie.setPath(request.getContextPath()); // 경로 설정
    cookie.setMaxAge(60*60*24);
    response.addCookie(cookie);
    // PopupMain.jsp 의 비동기 함수로 콜백됨 (새로고침 되면서 출력)
    // 클라이언트로 내용 전송
    out.println("쿠키 : 하루동안 열지 않음");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>쿠키를 생성해 응답 객체에 추가</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>

</body>
</html>
