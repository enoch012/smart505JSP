<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>LifeCycle</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <script>
    function requestAction(frm, met){
        // 매개변수에 따라서 전송 방식 선택
        if (met == 1){
            frm.method = 'get';
        } else {
            frm.method = 'post';
        }
        // form의 submit 동작
        frm.submit();
    }
  </script>

<div class="container my-4">
  <h2>서블릿 수명주기(Life Cycle) 메서드</h2>
  <form action="./LifeCycle.do" class="my-3">
    <%-- 버튼에 클릭 이벤트로 자바스크립트 함수 requestAction()을 설정함 --%>
    <input type="button" value="Get 방식 요청하기" onclick="requestAction(this.form, 1)" class="btn btn-dark">
    <input type="button" value="Post 방식 요청하기" onclick="requestAction(this.form, 2)" class="btn btn-dark">
  </form>
</div>
</body>
</html>
