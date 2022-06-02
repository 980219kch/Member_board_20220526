<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-30
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
    <h2>회원 목록</h2>
    <div class="container">
        <table class="table">
            <tr>
                <th>id</th>
                <th>memberId</th>
                <th>memberPassword</th>
                <th>memberName</th>
                <th>memberEmail</th>
                <th>memberMobile</th>
                <th></th>

            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberId}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberMobile}</td>
                    <td><a href="/member/delete?id=${member.id}">회원삭제</a></td>

                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
