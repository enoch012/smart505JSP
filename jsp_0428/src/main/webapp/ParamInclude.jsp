<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<h2>인클루드된 페이지에서 매개변수 확인</h2>
<%= request.getParameter("loc1")%>에
<%=request.getParameter("loc2")%>이 있습니다.
