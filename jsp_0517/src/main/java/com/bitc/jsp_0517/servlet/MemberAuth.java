package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDao;
import com.bitc.jsp_0517.database.MemberDto;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {

  // 회원정보를 데이터 베이스에서 제어하는 DAO 클래스
  private MemberDao dao;
  @Override
  public void init() throws ServletException {
    // application 내장 객체 얻기
    dao = new MemberDao();
    // 데이터 베이스 연결
    dao.dbOpen();
  }

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // 서블릿 초기화 매개변수에서 관리자 ID 받기
    String admin_id = "yudah01";

    // 데이터베이스에서 해당 사용자 정보 가져오기
    String id = req.getParameter("id");
    String pass = req.getParameter("pass");

    // 회원 테이블에서 인증 요청한 id/패스워드에 해당하는 회원 찾기
    // 데이터 베이스의 정보 중 id, pw가 일치하지 않으면 null을 반환
    MemberDto member = dao.selectMember(id, pass);

    String memberId = member.getUserId();

    if(memberId != null){
      // request 영역에 데이터 추가
      req.setAttribute("authMessage", memberId + " 회원님 반가워요!");
    }
    else { // 일치하지 않는 회원
      if (admin_id.equals(id)){
        req.setAttribute("authMessage", admin_id + "는 관리자입니다.");
      } else {
        req.setAttribute("authMessage", "회원정보가 일치하지 않습니다.");
      }
    }
    // 화면 출력을 위한 view 역할을 하는 jsp 페이지로 이동
    req.getRequestDispatcher("/servlet/MemberAuth.jsp").forward(req, resp);
  }

  @Override
  public void destroy(){ dao.dbClose(); }
}
