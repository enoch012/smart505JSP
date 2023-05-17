package com.bitc.jsp_0512.dao;

import java.sql.*;


public class JDBConnect {
  public Connection con;
  public Statement stmt;
  public PreparedStatement psmt;
  public ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  public JDBConnect(){
    dbDriver = "com.mysql.cj.jdbc.Driver";
    dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    dbUserId = "full505";
    dbUserPw = "full505";
  }

  public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw){
    this.dbDriver = dbDriver;
    this.dbUrl = dbUrl;
    this.dbUserId = dbUserId;
    this.dbUserPw = dbUserPw;
  }
  public void open(){
    try{
      //JDBC 드라이버 로드
      Class.forName(dbDriver);

      // DB에 연결
      con = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

      System.out.println("\n***DB Connect Success 성공했습니다.***\n");
    }
    catch (SQLException e){
      System.out.println("\n***데이터 베이스 연결 중 오류가 발생했습니다.***\n");
      System.out.println("SQLException : " + e.getMessage());
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
  }

  //자원 반납
  public void close(){
    try {
      if(rs != null) rs.close();
      if(stmt != null) stmt.close();
      if(psmt != null) psmt.close();
      if(con != null) con.close();

      System.out.println("\n***JDBC Close***\n");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
