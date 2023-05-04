<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h2>ImplicitObjMain 페이지</h2>
    <h3>각 영역에 저장 된 속성 읽기</h3>
    <ul>
      <%-- 페이지가 이동 되었으므로 페이지 영역의 속성은 삭제 됨 --%>
      <li>페이지 영역 : ${pageScope.scopeValue}</li>
        <%--하나의 요청에서 이동 된 페이지이므로 --%>
      <li>리퀘 영역 : ${requestScope.scopeValue}</li>
      <li>세션 영역 : ${sessionScope.scopeValue}</li>
      <li>앱 영역 : ${applicationScope.paascopeValue}</li>
    </ul>
    <h3>영역 지정 없이 속성 읽기</h3>
    <%--이동된 페이지에서 영역 지정 없이 속성을 읽으면 리퀘스트 영역의 데이터를 출력--%>
    <ul>
      <li>${scopeValue}</li>
    </ul>
  </div>
</body>
</html>
