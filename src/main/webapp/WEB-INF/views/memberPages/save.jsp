<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-05-26
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
    <div class="container">
        <h2 class="display-4 fw-normal">회원가입</h2>
        <div class="py-5 text-center">
            <form action="/member/save" method="post" enctype="multipart/form-data">
                <input class="form-control mb-2" type="text" id="memberId" onblur="duplicateCheck()" name="memberId" placeholder="아이디">
                <span id="dup-check-result"></span>
                <input class="form-control mb-2" type="text" id="password" name="memberPassword" placeholder="비밀번호" onblur="pwCheck()">
                <span id="pw-check-result"></span>
                <input class="form-control mb-2" type="text" name="memberName" placeholder="이름">
                <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일">
                <input class="form-control mb-2" type="text" id="mobile" name="memberMobile" placeholder="전화번호" onblur="mobileCheck()">
                <span id="mobile-check-result"></span>
                <input type="file" name="memberProfile">
                <input class="btn btn-primary" type="submit" value="회원가입">
            </form>
        </div>
    </div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post",
            url: "duplicate-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function(result) {
                if(result == "ok") {
                    checkResult.innerHTML = "사용 가능한 아이디입니다.";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerHTML = "이미 사용중인 아이디입니다.";
                    checkResult.style.color = "red";
                }
            },error: function() {
                alert("오타체크");
            }

        });
    }

    const pwCheck = () => {
        const pw = document.getElementById("password").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!@#])[a-z\d-_!@#]{5,10}$/;
        const checkResult = document.getElementById("pw-check-result");
        if(pw.match(exp)) {
            checkResult.innerHTML = "사용 가능한 비밀번호 입니다."
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "영소문자,숫자,특수문자 -_!@#를 포함한 5~10자리로 작성하세요.";
            checkResult.style.color = "red";
        }
    }

    const mobileCheck = () => {
        const mobile = document.getElementById("mobile").value;
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        const checkResult = document.getElementById("mobile-check-result");
        if (!(mobile.match(exp))) {
            checkResult.innerHTML = "옳지 않은 전화번호 형식입니다."
            checkResult.style.color = "red";
        }
    }
</script>
</html>
