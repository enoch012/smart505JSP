package com.bitc.jsp_0427;

import javax.sound.midi.Soundbank;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collection;


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

      System.out.println("DB Connect Success 성공했습니다.");
    }
    catch (Exception e){
      e.printStackTrace();
    }
  }

  //자원 반납
  public void close(){
    try {
      if(rs != null) rs.close();
      if(stmt != null) stmt.close();
      if(psmt != null) psmt.close();
      if(con != null) con.close();

      System.out.println("JDBC Close");
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
