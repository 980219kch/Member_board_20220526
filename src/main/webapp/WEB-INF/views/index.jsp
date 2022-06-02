<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-26
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        const saveForm = () => {
            location.href = "/member/save";
        }
        const loginForm = () => {
            location.href = "/member/login";
        }
        const paging = () => {
            location.href = "/board/paging";
        }
        const logout = () => {
            location.href = "/member/logout"
        }
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <button class="btn btn-outline-success" onclick="saveForm()">회원가입</button>
    <c:choose>
        <c:when test="${sessionScope.loginMemberId == null}">
            <button class="btn btn-outline-success" onclick="loginForm()">로그인</button>
        </c:when>
        <c:otherwise>
            <button class="btn btn-outline-success" onclick="logout()">로그아웃</button>
        </c:otherwise>
    </c:choose>
    <button class="btn btn-outline-success" onclick="paging()">글목록</button>
</body>
</html>
