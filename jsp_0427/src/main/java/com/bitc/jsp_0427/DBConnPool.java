package com.bitc.jsp_0427;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {
  public Connection conn;
  public Statement stmt;
  public PreparedStatement psmt;
  public ResultSet rs;

  public DBConnPool(){
    try {
      // 커넥션 풀(DataSource) 얻기
      Context initCtx = new InitialContext(); // JNDI에서 이름과 실제 객체를 연결해주는 개념이 Context 네이밍 서비스를 이용하기 위한 시작점
      Context ctx = (Context) initCtx.lookup("java:comp/env"); // java:comp/env 현재 웹 애플리케이션의 루트 디렉터를 인수로 Context객체 얻기
      DataSource source = (DataSource) ctx.lookup("dbcp_mysql"); // context.xml 에서 설정한 이름으로 할 것 // java:comp/env 아래에 있는 설정했던 커넥션 풀 이름 찾아오기

      // 커넥션 풀을 통해 연결 얻기
      conn = source.getConnection(); // 얻은 연결 객체를 멤버 변수에 저장

      System.out.println("DB 커넥션 풀 연결 성공");

    } catch (Exception e){
      System.out.println("DB 커넥션 풀 연결 실패");
      e.printStackTrace();
    }
  }

  // 연결 해제(자원 반납)
  public void close(){
    try{
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (psmt != null) psmt.close();
      if (conn != null) conn.close(); // 자동으로 커넥션 풀로 반납됨

      System.out.println("DB 커넥션 풀 자원 반납");
    }
    catch (Exception e){
      e.printStackTrace();
    }
  }
}
