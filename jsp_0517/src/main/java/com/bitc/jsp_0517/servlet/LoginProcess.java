package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDao;
import com.bitc.jsp_0517.database.MemberDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

// 주소 매핑
@WebServlet ("/servlet/LoginProcess.do")
public class LoginProcess extends HttpServlet {

  private MemberDao dao;

  // login.jsp에서 post 방식으로 전달함
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    // 한글 깨지는 거 대비
    req.setCharacterEncoding("UTF-8");

    String userId = req.getParameter("userId");
    String userPw = req.getParameter("userPw");

    try{
      // 데이터베이스 접속을 위한 db 생성
      dao = new MemberDao();
      dao.dbOpen();

      // 클라이언트에서 전달한 사용자 정보가 데이터 베이스에 있는지 확인
      if (dao.isMember(userId, userPw) == 1){ // 데이터가 있으면 1이 뜸

        // 사용자 정보를 가져옴
        MemberDto member = dao.selectMember(userId, userPw);

        // 관리자인지 아닌지 확인
        if (member.getUserGrade() == 1) {
          // 관리자 정보를 request 객체에 저장
          req.setAttribute("userId","관리자");
        }

        // 사용자 정보를 request 객체에 저장
        req.setAttribute("userId", member.getUserId());
        req.setAttribute("userPw", member.getUserPw());

        // 지정한 페이지로 이동
        req.getRequestDispatcher("/servlet/LoginResult.jsp").forward(req, resp);

      } else {
        // 로그인 오류 메시지를 request 객체에 저장
        req.setAttribute("errMsg", "회원 정보가 없습니다.");
        req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
      }
    }
    catch (Exception e){
      System.out.println("*** 로그인 시 오류가 발생했습니다 ***");
      req.setAttribute("errMsg", "로그인 시 오류가 발생했습니다.");
      req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);

      e.printStackTrace();
    }
    finally {
      dao.dbClose();
    }



  }
}
