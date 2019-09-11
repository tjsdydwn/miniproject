<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-group mb-3">
    <c:if test="${sessionScope.memName == null}">
        <a href="/miniproject/member/writeForm.do" class="list-group-item list-group-item-action list-group-item-dark text-white">회원가입</a>
        <a href="/miniproject/member/loginForm.do" class="list-group-item list-group-item-action list-group-item-dark text-white">로그인</a>
    </c:if>
    <c:if test="${sessionScope.memName != null}">
        <a href="/miniproject/member/logout.do" class="list-group-item list-group-item-action list-group-item-dark text-white">로그아웃</a>
        <a href="/miniproject/member/modifyForm.do" class="list-group-item list-group-item-action list-group-item-dark text-white">회원정보수정</a>
    </c:if>
    
</div>

<div class="list-group">
	<c:if test="${sessionScope.memName != null}">
		<a href="/miniproject/board/boardWriteForm.do" class="list-group-item list-group-item-action list-group-item-light">글쓰기</a>
	</c:if>
    	<a href="/miniproject/board/boardList.do?pg=1" class="list-group-item list-group-item-action list-group-item-light">목록</a>
</div>