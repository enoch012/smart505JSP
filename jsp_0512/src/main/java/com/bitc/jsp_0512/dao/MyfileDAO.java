package com.bitc.jsp_0512.dao;

import com.bitc.jsp_0512.dto.MyfileDTO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class MyfileDAO extends JDBConnect{
  public int insertFile(MyfileDTO dto){
    // 새로운 게시물 입력
    int applyResult = 0;

    try {

      String query = "INSERT INTO myfile";
      query += " (name, title, cate, ofile, sfile, postdate) ";
      query += "VALUES (?, ?, ?, ?, ?, NOW()) ";

      psmt = con.prepareStatement(query);
      psmt.setString(1, dto.getName());
      psmt.setString(2, dto.getTitle());
      psmt.setString(3, dto.getCate());
      psmt.setString(4, dto.getOfile());
      psmt.setString(5, dto.getSfile());

      applyResult = psmt.executeUpdate();

    } catch (SQLException e){
      System.out.println("insert 중 예외 발생");
      e.printStackTrace();
    }

    return applyResult;
  }

  public List<MyfileDTO> myFileList(){
    List<MyfileDTO> fileList = new ArrayList<MyfileDTO>();

    // 전체 데이터를 불러오는 SQL문
    String query = "SELECT * FROM myfile ORDER BY idx DESC ";

    try {
      psmt = con.prepareStatement(query);
      // 데이터 베이스에 SQL 쿼리를 전달하여 실행하고 결과값 받아오기
      rs = psmt.executeQuery();

      while (rs.next()){
        // 각각의 데이터를 저장하기 위해 MyfileDTO 타입의 객체 생성
        MyfileDTO dto = new MyfileDTO();

        // ResultSet에 저장된 정보를 MyfileDTO 타입의 객체에 저장
        dto.setIdx(rs.getString(1));
        dto.setName(rs.getString(2));
        dto.setTitle(rs.getString(3));
        dto.setCate(rs.getString(4));
        dto.setOfile(rs.getString(5));
        dto.setSfile(rs.getString(6));
        dto.setPostdate(rs.getString(7));

        // 저장된 정보를 List에 추가
        fileList.add(dto);
      }
    }
    catch (SQLException e){
      System.out.println("*** SELECT 시 오류 발생 ***");
      e.printStackTrace();
    }

    // 저장된 List를 반환
    return fileList;
  }

}
