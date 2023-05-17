package com.bitc.jsp_0512;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet2 extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // request 영역에 message 라는 이름으로 데이터를 추가
    req.setAttribute("message", "Hello Servlet!!");
    // 지정한 페이지로 완전히(forward) 이동 (forward라서 서버 내에서 request 데이터를 들고 바로 이동)
    // HelloServlet.do 파일에서 HelloServlet2.jsp를 뷰로 사용하고 있는 것
    // JSP는 뷰용도 Servlet은 연산 용도로 분리시켜 씀 
    req.getRequestDispatcher("/HelloServlet2.jsp").forward(req, resp);
  }
}
