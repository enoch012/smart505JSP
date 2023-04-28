<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Session - 로그인 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <style>
    .red {
        color: red;
        font-size: 1.2em;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 mx-auto">
        <%-- 7장 액션태그, 뒤에 슬래쉬 안 붙이면 오류남 --%>
        <jsp:include page="./Link.jsp" />
        <h2>로그인 페이지</h2>
        <span class="red">
          <%-- request 내장 객체에 로그인 에러 메세지가 있는지 확인 후 내용 출력 --%>
          <%-- 내장 객체에 저장된 정보가 없으면 빈 문자열, 없으면 입력된 에러메시지 출력 --%>
          <%-- jsp 표현식 --%>
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
        </span>

        <%
          /* 내장 객체 session에 저장된 정보 중 UserId 라는 이름의 데이터가 있는지 확인 */
          if(session.getAttribute("UserId") == null){ // 로그인 상태 확인
            // 로그아웃 상태
        %>
          <%-- 자바스크립트로 input 태그에 데이터가 있는지 없는지 확인 --%>
        <script>
            function validateForm(form){
                if (!form.user_id.value){
                    alert("아이디를 입력하세요");
                    return false;
                }
                if(form.user_pw.value == ""){
                    alert("패스워드를 입력하세요");
                    return false;
                }
            }
        </script>
          <%--사용자 입력 데이터를 LoginProcess.jsp로 전달 submit 버튼 클릭시 자바스크립트로 데이터 검증 함수 실행 --%>
        <form action="LoginProcess.jsp" method="post" name="loginFrm" class="" onsubmit="return validateForm(this);">
          <div class="my-3">
            <label for="user-id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="user-id" name="user_id">
          </div>
          <div class="my-3">
            <label for="user-pw" class="form-label">비밀번호</label>
            <input type="text" class="form-control" id="user-pw" name="user_pw">
          </div>
          <div class="my-3">
            <input type="submit" value="로그인하기" class="btn btn-primary">
          </div>

        </form>
      </div>
      <%
        } else { // 로그인된 상태
            /* 내장 객체 session에 UserId라는 이름의 데이터가 존재 시*/
      %>
      <%-- 내장 객체 session에서 UserName이라는 이름의 데이터를 출력 --%>
      <%=session.getAttribute("UserName")%> 회원님, 로그인 하셨습니다. <br>
      <a href="Logout.jsp" class="btn btn-primary">로그아웃</a>
        <%
        }
      %>
    </div>
  </div>

</body>
</html>
