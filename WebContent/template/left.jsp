<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-group mb-3">
    <c:if test="${sessionScope.memId == null}">
        <li class="list-group-item text-center">Guest <span class="text-muted small">님 안녕하세요</span></li>
        <a href="/miniproject/member/loginForm.do" class="list-group-item list-group-item-action list-group-item-light">로그인</a>
        <a href="/miniproject/member/writeForm.do" class="list-group-item list-group-item-action list-group-item-light">회원가입</a>
    </c:if>
    <c:if test="${sessionScope.memId != null}">
        <li class="list-group-item list-group-item-dark text-center">${sessionScope.memName}<span class="text-muted small">(${sessionScope.memId})</span>님</li>
        <a href="/miniproject/member/logout.do" class="list-group-item list-group-item-action list-group-item-light">로그아웃</a>
        <a href="/miniproject/member/modifyForm.do" class="list-group-item list-group-item-action list-group-item-light">회원정보수정</a>
    </c:if>
</div>

<div class="list-group">
    <c:if test="${sessionScope.memId != null}">
        <a href="/miniproject/board/boardWriteForm.do" class="list-group-item list-group-item-action list-group-item-secondary">글쓰기</a>
    </c:if>
    <a href="/miniproject/board/boardList.do?pg=1" class="list-group-item list-group-item-action list-group-item-secondary">목록</a>
</div>