<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터베이스를 사용하기 때문에 DTO 클래스와 DAO 클래스를 모두 import --%>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%
  // 클라이언트에서 전달된 데이터 가져오기
  String userId = request.getParameter("user_id");
  String userPwd = request.getParameter("user_pw");

  // DB 객체 생성
  MemberDAO dao = new MemberDAO();
  dao.dbOpen(); // db 연결

  // 데이터베이스와 데이터를 주고 받을 DTO 클래스 타입의 객체 생성
  MemberDTO dto = dao.getMemberDTO(userId, userPwd);

  // dB연결 종료
  dao.dbClose();

  if (dto.getId() != null) {
    session.setAttribute("UserId", dto.getId());
    session.setAttribute("UserName", dto.getName());
    response.sendRedirect("./LoginForm.jsp");
  } else {
    request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
    request.getRequestDispatcher("./LoginForm.jsp").forward(request, response);
  }
%>

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

</body>
</html>
