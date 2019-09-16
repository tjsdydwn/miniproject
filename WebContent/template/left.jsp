<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.memId == null}">
	<div class="list-group mb-3">
        <li class="list-group-item text-center">Guest <span class="text-muted small">님 안녕하세요</span></li>
	</div>
	<jsp:include page="../member/loginForm.jsp"></jsp:include>
	<c:if test="${requestScope.loginFail}">
		아이디 또는 비밀번호가 맞지 않습니다.
	</c:if>
</c:if>

<c:if test="${sessionScope.memId != null}">
	<div class="list-group mb-3">
		<li class="list-group-item list-group-item-dark text-center">${sessionScope.memName}<span class="text-muted small">(${sessionScope.memId})</span>님</li>
        <a href="/miniproject/member/logout.do" class="list-group-item list-group-item-action list-group-item-light">로그아웃</a>
        <a href="/miniproject/member/modifyForm.do" class="list-group-item list-group-item-action list-group-item-light">회원정보수정</a>
	</div>
</c:if>