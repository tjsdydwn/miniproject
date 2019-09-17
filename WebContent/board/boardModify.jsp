<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.onload = function(){
		location.href = "/miniproject/board/boardList.do?pg=${requestScope.pg}";
	}
</script>