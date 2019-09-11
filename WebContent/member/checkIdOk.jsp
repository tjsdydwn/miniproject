<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아이디 중복체크</title>
</head>

<body>
    <div class="container">
        <span id="new-id">${ param.id }</span>는 사용할 수 있는 아이디입니다.
        <br><br>
        <button id="btn-close" type="button">사용하기</button>
    </div>
    <script src="../js/formValid.js"></script>
</body>

</html>