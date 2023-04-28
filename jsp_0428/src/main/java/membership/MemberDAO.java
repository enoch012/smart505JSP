package membership;

import java.lang.reflect.Member;
import java.sql.*;

// 자바에서 데이터 베이스에 접근하고 데이터를 CRUD하기 위해 사용하는 클래스
// View 부분과 데이터 처리 부분을 분리하여 관리하기 위함

public class MemberDAO {
  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;

  String dbUrl ;
  String dbUserId ;
  String dbUserPw ;

  public MemberDAO(){
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC" ;
      dbUserId = "full505";
      dbUserPw = "full505";
    }
    catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
  }

  // 데이터 베이스 연결
  public void dbOpen(){
    try{
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("데이터베이스 연결 성공");
    }
    catch (SQLException e){
      e.printStackTrace();
      System.out.println("데이터베이스 연결 실패");
    }
  }

  public void dbClose(){
    try{
      if(rs != null){ rs.close(); }
      if(stmt != null){ stmt.close(); }
      if(pstmt != null){ pstmt.close(); }
      if(conn != null){ conn.close(); }
    }
    catch (SQLException e){
      e.printStackTrace();
    }
  }

  // 데이터 베이스에서 사용자 목록 가져오기
  public MemberDTO getMemberDTO(String uid, String upass){
    MemberDTO dto = new MemberDTO(); // 회원정보 DTO 객체 생성

    String query = "SELECT * FROM member WHERE id=? AND pass=? ";

    try {
      // PrepareStatement 객체 생성
      pstmt = conn.prepareStatement(query);
      // SQL 쿼리문에 있는 ?를 실제 데이터로 변환
      pstmt.setString(1, uid);
      pstmt.setString(2, upass);

      rs = pstmt.executeQuery(); // 쿼리문 실행, 결과값 가져오기

      if (rs.next()){
        // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
        // ResultSet에 저장된 데이터 중 컬럼명을 통하여 데이터 가져오기
        dto.setId(rs.getString("id"));
        dto.setPass(rs.getString("pass"));

        // ResultSet에 저장된 데이터 중 index 번호로 데이터 가져오기
        dto.setName(rs.getString(3));
        dto.setRegidate(rs.getString(4));
      }

    }catch (Exception e){
      e.printStackTrace();
    }
    return dto;
  }
}
