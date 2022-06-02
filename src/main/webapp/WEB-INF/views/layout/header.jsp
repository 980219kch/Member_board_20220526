<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
    <header>
        <a href="/">Home</a> &nbsp;
        <a href="" id="boardSave" onclick="boardSave()">글쓰기</a> &nbsp;
        <c:if test="${sessionScope.loginMemberId != null}">
            <a href="/member/update">마이페이지</a> &nbsp;
        </c:if>
        <c:if test="${sessionScope.loginMemberId != null}">
            <a href="/member/logout">로그아웃</a> &nbsp;
        </c:if>

        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <a href="/member/admin">관리자페이지</a>
        </c:if> &nbsp;
        <c:if test="${sessionScope.loginMemberId != null}">
            현재 로그인 중인 아이디: ${sessionScope.loginMemberId}
        </c:if> &nbsp;
    </header>
</body>
<script>
    const boardSave = () => {
        const id = '${sessionScope.loginMemberId}';
        console.log(id);
        if(id.length == 0) {
            alert("먼저 로그인 하세요.");
            document.getElementById("boardSave").href = "/";
        } else {
            document.getElementById("boardSave").href = "/board/save";
        }
    }
</script>
</html>
