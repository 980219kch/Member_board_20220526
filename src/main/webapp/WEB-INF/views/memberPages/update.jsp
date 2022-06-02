<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-27
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="display-4 fw-normal">myPage</h2>
        <div class="py-5">
            <form action="/member/update" method="post" name="updateForm">
                아이디: <input class="form-control mb-2" type="text" name="memberId" value="${updateMember.memberId}" readonly>
                비밀번호: <input class="form-control mb-2" type="text" id="pwCheck" name="memberPassword" placeholder="비밀번호를 확인하세요.">
                이름: <input class="form-control mb-2" type="text" name="memberName" value="${updateMember.memberName}">
                이메일: <input class="form-control mb-2" type="text" name="memberEmail" value="${updateMember.memberEmail}">
                전화번호: <input class="form-control mb-2" type="text" name="memberMobile" value="${updateMember.memberMobile}">
                <input class="btn btn-primary" type="button" onclick="update()" value="회원정보 수정">
            </form>
        </div>
    </div>
</body>
<script>
    const update = () => {
        const pwCheck = document.getElementById("pwCheck").value;
        const pwDB = `${updateMember.memberPassword}`;
        if(pwCheck == pwDB) {
            updateForm.submit();
        } else {
            alert("비밀번호 불일치!!");
        }

    }
</script>
</html>
