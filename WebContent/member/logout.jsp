<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<script>
		window.onload = function() {
			alert("로그아웃");
			location.href = "/mvcmember/member/loginForm.do";
		}
	</script>
</body>
</html>