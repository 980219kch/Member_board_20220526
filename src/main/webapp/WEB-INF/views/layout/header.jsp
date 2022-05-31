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

</head>
<body>
    <header>
        <a href="/">Home</a> &nbsp;
        <a href="/board/save">글쓰기</a> &nbsp;
        <c:if test="${sessionScope.loginMemberId != null}">
            <a href="/member/my-page">마이페이지</a> &nbsp;
        </c:if>
        <c:choose>
            <c:when test="${sessionScope.loginMemberId != null}">
                <a href="/member/logout">로그아웃</a>
            </c:when>
            <c:otherwise>
                <a href="/member/login">로그인</a>
            </c:otherwise>
        </c:choose> &nbsp;
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <a href="/member/admin">관리자페이지</a>
        </c:if> &nbsp;
        <c:if test="${sessionScope.loginMemberId != null}">
            현재 로그인 중인 아이디: ${sessionScope.loginMemberId}
        </c:if> &nbsp;
    </header>
</body>
</html>
