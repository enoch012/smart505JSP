package com.bitc.jsp_0427;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class JDBConnect2 {
  public Connection con;
  public Statement stmt;
  public PreparedStatement psmt;
  public ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  public JDBConnect2(){
    dbDriver = "com.mysql.cj.jdbc.Driver";
    dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    dbUserId = "full505";
    dbUserPw = "full505";
  }

  public JDBConnect2(String dbDriver, String dbUrl, String dbUserId, String dbUserPw){
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

  public int postWrite(String title, String userId, String content){
    String sql = "INSERT INTO board (title, content, id, postdate) ";

    sql += "VALUES (?, ?, ?, NOW()) ";
    int result = 0; // 몇 개의 데이터가 들어갔는지 확인용

    try{
      // 생성된 SQL과 함께 PreparedStatement 객체를 생성
      psmt = con.prepareStatement(sql);
      // 인파라미터에 실제 데이터를 추가
      psmt.setString(1, title);
      psmt.setString(2, content);
      psmt.setString(3, userId);

      // insert 쿼리문 실행
      result = psmt.executeUpdate();

      System.out.println("게시글이 등록 되었습니다!");
    }
    catch (SQLException e){
      e.printStackTrace();
    }
    return result;
  };

  public List<Map<String, String>> postList(){
    String sql = "SELECT num, title, id, content, postdate, visitcount FROM board ";

    // 가져온 결과값을 저장할 ArrayList
    List<Map<String, String >> dataList = new ArrayList<>();

    try{
      psmt = con.prepareStatement(sql);
      rs = psmt.executeQuery();

      while (rs.next()){
        int postNum = rs.getInt("num");
        String postTitle = rs.getString("title");
        String postUser = rs.getString("id");
        String postContent = rs.getString("content");
        String postDate = rs.getString("postdate");
        String postVisit = rs.getString("visitcount");

        // HashMap 타입에 저장
        Map<String, String> data = new HashMap<>();
        data.put("postNum", String.valueOf(postNum));
        data.put("postTitle", postTitle);
        data.put("postUser", postUser);
        data.put("postContent", postContent);
        data.put("postDate", postDate);
        data.put("postVisit", postVisit);

        // ArrayList에 게시물 1개(해시맵 객체 1개)에 대한 정보를 추가함
        dataList.add(data);
      }
    }
    catch (SQLException e){
      e.printStackTrace();
    }

    // 만들어진 데이터 리스트를 반환
    return dataList;
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
