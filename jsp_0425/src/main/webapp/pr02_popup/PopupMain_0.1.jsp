<%@ page import="java.util.SplittableRandom" %>
<%@ page import="java.awt.font.FontRenderContext" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  String popupMode = "on";
%>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <style>
    div#popup{
        position: absolute;
        top: 100px;
        left: 50px;
        color: yellow;
        width: 270px;
        height: 100px;
        background-color: gray;
    }

    div#popup>div {
        position: relative;
        background-color: #fff;
        top:0;
        border: 1px solid gray;
        padding: 10px;
        color: black;
    }
  </style>
  <script>
    $(function (){
        $('#closeBtn').click(function (){ // 닫기 버튼을 두르면
            $('#popup').hide(); // 팝업창을 숨김 처리 합니다.
        });
    });
  </script>
</head>
<body>
  <h2>팝업 메인 페이지</h2>
  <%
    for (int i = 0; i <= 10; i++) {
      out.print("현재 팝업창은 " + popupMode + "상태입니다. <br>");
    }

    if (popupMode.equals("on")) { // 아래의 html 코드를 실행
  %>

  <div id="popup">
    <h2 align="center">공지사항 팝업입니다.</h2>
    <div align="right">
      <form action="" name="popFrm">
        <input type="checkbox" id="inactiveToday" value="1"> 하루동안 열지 않음
        <input type="button" value="닫기" id="closeBtn">
      </form>
    </div>
  </div>
  <%
    }
  %>
</body>
</html>
