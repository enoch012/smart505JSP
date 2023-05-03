<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // uri에 따라 페이지를 확인해서 h1을 다르게 출력해보기.
  String uri = request.getRequestURI();
  String title;

  /*// 로그인이 적용 되는지 세션 확인용
  String userId = (String) session.getAttribute("userId");
  String userName = (String) session.getAttribute("userName");*/

  switch (uri){

    case "/BoardWrite.jsp" :
      title = "Model1 방식 게시판 글 작성 페이지";
      break;

    case "/BoardRead.jsp" :
      title = "Model1 방식 게시판 글 확인 페이지";
      break;

    case "/BoardUpdate.jsp" :
      title = "Model1 방식 게시판 글 수정 페이지";
      break;

    case "/Login.jsp" :
      title = "Model1 방식 게시판 회원 로그인 페이지";
      break;

    default:
      title = "Model1 방식 게시판 목록 페이지";
      break;
  }
%>
<header class="mb-4">
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <ul class="navbar-nav container">
      <li class="nav-link"><a href="BoardList.jsp" class="nav-link text-white">목록</a></li>
        <%
          if (session.getAttribute("userId") == null){
        %>
        <%--로그인 정보가 없을 경우--%>
        <a href="Login.jsp" class="btn btn-outline-light"><li>로그인</li></a>
        <%
          } else {%>
            <li style="color:#fff;">
              <span class="me-2"><%=session.getAttribute("userId").toString()%>님 환영합니다.</span>
              <a href="Logout.jsp" class="btn btn-outline-light">로그아웃</a>
            </li>
        <% } %>
    </ul>
  </nav>
  <div class="container my-4 py-5 bg-secondary bg-opacity-25">
    <h1 class="text-center"><%=title%></h1>
  </div>
</header>
