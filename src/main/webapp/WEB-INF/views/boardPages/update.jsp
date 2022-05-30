<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-30
  Time: 오전 10:28
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
    <h2 class="display-4 fw-normal">update.jsp</h2>
    <div class="py-5 text-center">
        <form action="/board/update" method="post" name="updateForm">
            id: <input class="form-control mb-2" type="text" name="id" value="${board.id}" readonly>
            boardWriter: <input class="form-control mb-2" type="text" name="boardWriter" value="${board.boardWriter}" readonly>
            boardTitle: <input class="form-control mb-2" type="text" name="boardTitle" value="${board.boardTitle}">
            boardContents: <textarea class="form-control" name="boardContents" cols="10" rows="5" >${board.boardContents}</textarea>
            <input class="btn btn-primary" type="button" onclick="update()" value="글수정">
        </form>
    </div>
</div>
</body>
<script>
    const update = () => {
        updateForm.submit();
    }
</script>
</html>
