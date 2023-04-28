<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<table class="table my-3">
  <tr>
    <td align="center">
      <%--로그인 여부에 따른 메뉴 변화--%>
      <% if(session.getAttribute("UserId") == null){
        %>
        <a href="./LoginForm.jsp">로그인</a>
        <%
      }
      else {
        %>
        <a href="./Logout.jsp">로그아웃</a>
        <%
      }%>
      &nbsp; &nbsp; &nbsp;
        <%--<a href="./List.jsp">게시판(페이징X)</a>
        &nbsp; &nbsp; &nbsp;
        <a href="./List.jsp">게시판(페이징O)</a>--%>
    </td>
  </tr>
</table>
