<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오전 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="/member/login" method="post">
        <input type="text" name="memberId" placeholder="아이디"> <br>
        <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
