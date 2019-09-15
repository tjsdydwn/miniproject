<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <form id="form-view" class="jumbotron" action="/miniproject/board/boardModifyForm.do" method="POST">
        <div class="wrap">
            <div class="input-group mb-md-3">
                <label class="input-group-text input-group-prepend">제목</label>
                <div class="form-control text-center">${requestScope.boardDTO.subject}</div>
            </div>

            <div class="input-group mb-md-3">
            	<input type="hidden" name="seq" value="${requestScope.boardDTO.seq}">
            	<input type="hidden" name="pg" value="${requestScope.pg}">
                <label class="input-group-text">글번호</label>
                <div class="form-control text-center">${requestScope.boardDTO.seq}</div>
                <label class="input-group-text">작성자</label>
                <div class="form-control text-center" data-id="${sessionScope.memId}">${requestScope.boardDTO.id}</div>
                <label class="input-group-text">조회수</label>
                <div class="form-control text-center">${requestScope.boardDTO.hit}</div>
            </div>

            <div class="form-control textarea-size p-3 mb-md-3" style="height:500px;">${requestScope.boardDTO.content}</div>

			<c:if test="${sessionScope.memId != null}">
            <div class="text-center">
                <button type="button" id="btn-update" class="btn btn-secondary">수정</button>
                <button type="button" id="btn-delete" class="btn btn-secondary">삭제</button>
            </div>
            </c:if>
        </div>
    </form>
</div>
<script src="../js/board.js"></script>