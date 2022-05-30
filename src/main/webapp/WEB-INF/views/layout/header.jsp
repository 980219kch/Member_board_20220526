<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

</head>
<body>
    <header>
        <a href="/">Home</a> &nbsp;
        <a href="/board/save">글쓰기</a> &nbsp;
        <a href="/member/my-page">마이페이지</a>&nbsp;
        <a href="/member/logout">로그아웃</a> &nbsp;&nbsp;
        현재 로그인 중인 아이디: ${sessionScope.loginMemberId}
    </header>
</body>
</html>
