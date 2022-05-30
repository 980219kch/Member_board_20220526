<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
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

    <c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
        <input class="btn btn-primary" type="button" onclick="boardUpdate()" value="글수정">
        <input class="btn btn-primary" type="button" onclick="boardDelete()" value="글삭제">
    </c:if>
</body>
<script>
    const boardUpdate = () => {
        location.href = "/board/update?id=${board.id}";
    }
    const boardDelete = () => {
        location.href = "/board/delete?id=${board.id}";
    }
</script>
</html>
