<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오전 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="display-4 fw-normal">글작성</h2>
        <div class="py-5 text-center">
            <form action="/board/save" method="post" enctype="multipart/form-data">
                <input class="form-control mb-2" type="text" name="boardWriter" value="${sessionScope.loginMemberId}" readonly>
                <input class="form-control mb-2" type="text" name="boardTitle" placeholder="제목">
                <textarea class="form-control" name="boardContents" cols="10" rows="5" placeholder="내용"></textarea>
                첨부파일: <input type="file" name="boardFile">
                <input class="btn btn-primary" type="submit" value="글작성">
            </form>
        </div>
    </div>
</body>
</html>
