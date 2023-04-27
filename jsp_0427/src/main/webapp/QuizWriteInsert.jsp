<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect2" %>
<%@ page import="com.bitc.jsp_0427.DBConnPool" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>

<%
  // db 연결에 필요한 정보 얻어오기
  String driver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbURL");

  String opt1 = application.getInitParameter("dbUrl10pt1");
  String opt2 = application.getInitParameter("dbUrl10pt2");
  String opt3 = application.getInitParameter("dbUrl10pt3");

  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  // db 연결주소 합치기
  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

  // db 연결

  JDBConnect2 db = new JDBConnect2(driver, dbUrl, dbUserId, dbUserPw);
  /* 클라이언트에서 가져온 데이터 */
  request.setCharacterEncoding("UTF-8");

  String title = request.getParameter("title");
  String userId = request.getParameter("userId");
  String content = request.getParameter("content");

  try{
    db.open();
    // 클라이언트에서 전송된 데이터를 데이터 베이스에 저장
    int result = db.postWrite(title, userId, content);

    if (result != 0) {response.sendRedirect("./QuizBoardList.jsp");}
    else {
      System.out.println("게시글 삽입에 오류가 있습니다.");
    }
  }
  catch (Exception e){
    System.out.println("오류가 발생했습니다.");
    System.out.println("Exception : " + e.getMessage());
  }

  finally {
    try{
      db.close(); // 전체 자원 회수
    } catch (Exception e){}
  }

%>