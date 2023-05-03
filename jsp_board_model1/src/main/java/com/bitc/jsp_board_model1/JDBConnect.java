package com.bitc.jsp_board_model1;

import javax.servlet.ServletContext;
import java.sql.*;

public class JDBConnect {
  protected Connection conn;
  protected Statement stmt;
  protected PreparedStatement pstmt;
  protected ResultSet rs;

  String dbUrl;
  String dbUserId;
  String dbUserPw;

  public JDBConnect(){
    try{
      dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
      dbUserId = "full505";
      dbUserPw = "full505";
    }
    catch (Exception e){
      e.printStackTrace();
    }
  }

  public void dbOpen(){
    try{
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("데이터 베이스에 연결되었습니다.");
    }
    catch (Exception e){
      e.printStackTrace();
    }
  }
  public void dbClose(){
    try{
      if(rs != null) { rs.close();}
      if(pstmt != null) { pstmt.close();}
      if(stmt != null) { stmt.close();}
      if(conn != null) { conn.close();}
      System.out.println("데이터 베이스가 해제되었습니다.");
    }
    catch (Exception e){}
  }
}
