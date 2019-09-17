<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <form action="/miniproject/board/boardModify.do" method="POST" id="form-board">
        <div class="jumbotron">
            <div>
                <div class="input-group input-group-lg mb-4">
                    <input type="hidden" name="seq" value="${requestScope.seq}">
                   	<input type="hidden" name="pg" value="${requestScope.pg}">
                    <span class="input-group-text">제목</span>
                    <input type="text" name="subject" id="subject" class="form-control" value="${requestScope.subject}">
                    <div class="invalid-feedback">
                        제목을 입력해주세요
                    </div>
                </div>
                <div class="input-group input-group-lg mb-4">
                    <textarea name="content" id="content" class="form-control" style="height: 400px; resize: none;">${requestScope.content}</textarea>
                    <div class="invalid-feedback">
                        내용을 입력해주세요.
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button id="btn-submit" type="button" class="btn btn-secondary">수정</button>
            </div>
        </div>
    </form>
</div>
<script src="../js/board.js"></script>