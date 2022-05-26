<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-26
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveForm = () => {
            location.href = "/member/save";
        }
        const loginForm = () => {
            location.href = "/member/login";
        }
        const findAll = () => {
            location.href = "/board/findAll";
        }
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <button class="btn btn-outline-success" onclick="saveForm()">회원가입</button>
    <button class="btn btn-outline-success" onclick="loginForm()">로그인</button>
    <button class="btn btn-outline-success" onclick="findAll()">글목록</button>
</body>
</html>
