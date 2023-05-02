package com.bitc.jsp_board_model1;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 실제 데이터 베이스와 연결해서 데이터를 CRUD 하기 위한 클래스
public class BoardDao extends JDBConnect{
  public BoardDao(){}

  /*public int selectCount(){}*/

  // 전체 게시글 목록 출력
  public List<BoardDto> selectList(){
    // 게시물의 목록을 저장할 빈 List 선언
    List<BoardDto> dataList = new ArrayList<BoardDto>();

    // 게시물 목록을 가져올 SQL 쿼리 생성
    String sql = "SELECT num, title, id, postdate, visitcount FROM board ";

    try{
      // SQL 쿼리 명령을 위해서 Statement 객체 생성
      stmt = conn.createStatement();

      // SQL 쿼리문 실행, 결과 받아오기
      rs = stmt.executeQuery(sql);

      // 가져온 결과물을 하나씩 출력
      while(rs.next()){
        // 게시물 1개의 정보를 저장할 수 있는 BoardDto 객체 생성
        BoardDto board = new BoardDto();

        // 게시물 정보 저장
        board.setPostNum(rs.getInt("num"));
        board.setPostTitle(rs.getString("title"));
        board.setPostWriteUser(rs.getString("id"));
        board.setPostDate(rs.getString("postdate"));
        board.setPostVisitCount(rs.getInt("visitcount"));

        // 게시물 불러오기
        // 게시물 전체 리스트를 저장하는 변수에 BoardDto 객체 추가
        dataList.add(board);
      }

    } catch (SQLException e){
      e.printStackTrace();
    }

    return dataList;
  }

  // 지정한 게시물 내용 출력
  public BoardDto selectBoard(int postNum){
    BoardDto board = new BoardDto();

    String sql = "SELECT num, title, content, id, postdate, visitcount ";
    sql += "FROM board ";
    sql += "WHERE num = " + postNum + " ";

    try{
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()){
        board.setPostNum(rs.getInt("num"));
        board.setPostWriteUser(rs.getString("id"));
        board.setPostTitle(rs.getString("title"));
        board.setPostContent(rs.getString("content"));
        board.setPostDate(rs.getString("postdate"));
        board.setPostVisitCount(rs.getInt("visitcount"));
      }
    } catch (SQLException e){
      System.out.println("게시글 조회시 오류가 발생 했습니다.");
      e.printStackTrace();
    }

    return board;
  }

  // 게시
  public int insertBoard(BoardDto board){
    int result = 0;

    // SQL 쿼리문 생성, PreparedStatement를 사용할 것이므로 데이터 입력 부분에 ?를 대신 사용
    String sql = "INSERT INTO board(title, content, id, postdate) ";
    sql += "VALUES (?, ?, ?, NOW()) ";
    try{
      // PreparedStatement 객체 생성
      pstmt = conn.prepareStatement(sql);

      // SQL 쿼리문의 ? 부분에 실제 데이터 입력
      pstmt.setString(1, board.getPostTitle());
      pstmt.setString(2, board.getPostContent());
      pstmt.setString(3, board.getPostWriteUser());

      // SQL 쿼리문을 데이터 베이스에 전송하여 실행 및 결과 가지고 오기
      result = pstmt.executeUpdate(); // 쿼리문 생성
    }
    catch (SQLException e){
      System.out.println("게시물 입력시 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

  // 게시물 정보 출력하기
  public int updateBoard(int postNum, String postTitle, String postContent){
    int result = 0;

    String sql = "UPDATE board SET title = ?, content = ? ";
    sql += "WHERE num = ? ";

    try{
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, postTitle);
      pstmt.setString(2, postContent);
      pstmt.setInt(3, postNum);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e){
      System.out.println("업데이트 중 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return result;
  }

  // 게시물 삭제하기
  public int deleteBoard(int postNum){
    int result = 0;

    //삭제용 쿼리문
    String sql = "DELETE FROM board WHERE num = ? ";

    try {
      // PrepareStatement 객체 생성
      pstmt = conn.prepareStatement(sql);

      // SQL 쿼리의 ? 에 실제 데이터 대입
      pstmt.setInt(1, postNum);

      // PreparedStatement를 사용하여 데이터 베이스에 DELETE 쿼리문 전송 및 실행
      result = pstmt.executeUpdate();

    } catch (SQLException e){
      System.out.println("게시물 삭제 시 오류가 발생 했습니다.");
      e.printStackTrace();
    }

    return result;
  }

  // 게시물 조회수 올리기
  public void updateVisitCount(int postNum){
    String sql = "UPDATE board SET visitcount = visitcount + 1 WHERE num = ? ";

    try{
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postNum);

      pstmt.executeUpdate();
    }
    catch (SQLException e){
      System.out.println("조회수 업데이트 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

}
