<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>detail.jsp</h2>
    글번호: ${board.id} <br>
    작성자: ${board.boardWriter} <br>
    제목: ${board.boardTitle} <br>
    내용: ${board.boardContents} <br>
    작성일자: ${board.boardCreatedDate} <br>
    조회수: ${board.boardHits} <br>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="100" width="100">
</body>
</html>
