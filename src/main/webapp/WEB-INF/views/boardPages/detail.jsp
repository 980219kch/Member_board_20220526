<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <input class="btn btn-primary" type="button" onclick="boardDelete()" value="글삭제">
    </c:if>

    <div class="container mt-5">
        <div id="comment-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}" readonly>
                <label for="commentWriter">작성자</label>
            </div>
            <div class="form-floating">
                <input type="text" id="commentContents" class="form-control" placeholder="내용">
                <label for="commentContents">내용</label>
            </div>
            <button onclick="commentWrite()" class="btn btn-primary">댓글작성</button>
        </div>

        <div id="comment-list">
            <table class="table">
                <tr>
                    <th>댓글번호</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.id}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td><fmt:formatDate value="${comment.commentCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
<script>
    const boardUpdate = () => {
        location.href = "/board/update?id=${board.id}";
    }
    const boardDelete = () => {
        location.href = "/board/delete?id=${board.id}";
    }

    const commentWrite = () => {
        const boardId = `${board.id}`;
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "boardId": boardId,
                "commentWriter": commentWriter,
                "commentContents": commentContents
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value='';
            },
            error: function() {
                alert("오류");
            }
        });
    }

</script>
</html>
