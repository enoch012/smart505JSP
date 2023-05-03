<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%-- 데이터 조작용 --%>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="java.util.List" %>

<%
  // 로그인이 적용 되는지 세션 확인용
  String userId = (String) session.getAttribute("userId");
  String userName = (String) session.getAttribute("userName");

%>

<%
  BoardDao dao = new BoardDao();
  // DB 연결
  dao.dbOpen();
  int totalCount = dao.totalCount(); // 전체 게시물 수
  int pageSize = 5; // 한 페이지에 출력해줄 게시글 개수
  int blockPage = 5; // 블럭에서 표현할 페이지 수
  int totalPage = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수

  // 현재 페이지 수 기본값
  int pageNum = 1;
  // 게시물 페이지 번호를 요청 매개변수로 받음
  String pageTemp = request.getParameter("pageNum");

  // 현재 페이지 요청 시 클라이언트에서 전달 된 데이터 중 pageNum의 값이 null이 아니거나 비어있지 않을 경우
  // pageTemp의 값을 정수로 변경하여 pageNum 변수에 저장
  if (pageTemp != null && !pageTemp.equals("")){
    pageNum = Integer.parseInt(pageTemp);
  }
  // 첫번재 게시물 번호
  int start = (pageNum -1) * pageSize; // 역순으로 출력이라 +1 을 안해줘야 제일 마지막 글이 출력된다
  // 마지막 게시물 번호
  int end = pageNum * pageSize + 1;

  // 게시물 전체 리스트 가져오기
  List<BoardDto> boardList = dao.selectList(start, pageSize);


  // 연결 해제, 자원 회수
  dao.dbClose();


%>

<!DOCTYPE html>
<html>
<head>
  <title>model1 방식 게시판 만들기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <style>
    .click-on {
        cursor: pointer;
    }

    .table-title { width: 50%;}
  </style>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="container my-4 p-0">
  <table class="table table-hover text-center">
    <thead class="">
      <tr>
        <th>글번호</th>
        <th class="table-title">제목</th>
        <th>글쓴이</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <%
      /* 가져온 게시물의 크기 확인 */
      if (boardList.size() !=0){
        /* 게시물 리스트 출력용 향상된 for문 */
        for(BoardDto dto : boardList){
    %>

    <tr onclick="location.href='BoardRead.jsp?postNum=<%=dto.getPostNum()%>'" class="click-on">
      <%--<a href="BoardRead.jsp?postNum=<%=dto.getPostNum()%>" class="text-decoration-none">--%>
      <td><%=dto.getPostNum()%></td>
      <%-- 제목 표시 부분에 해당 글을 읽기 위한 링크를 설정--%>
      <td><%=dto.getPostTitle()%></td>
      <td><%=dto.getPostWriteUser()%></td>
      <td><%=dto.getPostDate()%></td>
      <td><%=dto.getPostVisitCount()%></td>
      <%--</a>--%>
    </tr>

    <%
        }
      } else {
        /* 게시물이 없으면 하단의 코드 출력하기 */
        %>
    <tr>
      <td colspan="5">게시물이 없습니다.</td>
    </tr>
    <%
        }
    %>
    </tbody>
  </table>
  <div class="my-3">
    <%-- 이전 페이지 버튼--%>
    <%
      String pagingStr = ""; // 화면에 페이징 번호를 출력하기 위한 문자열 생성 변수

      // pageNum : 현재 페이지 번호
      // blockPage : 현재 블록에서 표현할 페이지 수 (현재 5)
      // temp : 계산된 페이지 번호를 저장할 변수
      int temp = (((pageNum - 1) / blockPage) * blockPage) + 1;
      if (temp != 1){
        pagingStr += "<a href='BoardList.jsp?pageNum=" + (temp - 1) + "'> 이전 블록</a>";
      }
    %>

      <%-- 각 페이지 버튼--%>
    <%
      // blockCount : 현재 블록의 카운트 기본값
      // totalPage : 전체 페이지 수
      int blockCount = 1;
      while(blockCount <= blockPage && temp <= totalPage){
        // 현재 페이지와 계산된 페이지 값이 같으면
        if (temp == pageNum){
          // 현재 페이지 번호만 출력하고 링크는 사용하지 않음
          pagingStr += "&nbsp;" + temp + "&nbsp;";
        } else {
          // 계산된 페이지 번호에 링크를 적용
          pagingStr += "&nbsp;<a href='BoardList.jsp?pageNum=" + temp + "'>"+ temp +"</a>&nbsp;";
        }
        temp++;
        blockCount++;
      }
    %>

      <%-- 다음 페이지 버튼 --%>
    <%
      if (temp <= totalPage){
        pagingStr += "<a href='BoardList.jsp?pageNum="+ temp +"'> 다음블록 </a>";
      }

      out.println(pagingStr);
    %>
  </div>
  <% if(userId != null){ %>
  <div class="my-2 d-flex justify-content-end">
    <a href="BoardWrite.jsp" class="btn btn-primary">글쓰기</a>
  </div>
  <%
    }
  %>
</main>
<%@ include file="Footer.jsp"%>
</body>
</html>
