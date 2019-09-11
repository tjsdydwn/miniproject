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
    <form action="/mvcmember/member/checkId.do" method="GET">
        해당 ID는 이미 사용중입니다.
        <br><br>
        아이디 <input type="text" name="id">
        <button type="submit">중복체크</button>
    </form>
</body>

</html>