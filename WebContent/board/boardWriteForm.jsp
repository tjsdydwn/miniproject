<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <form action="/mvcboard/board/boardWrite.do" method="POST" id="form-board">
        <div class="jumbotron">
            <h1 class="display-4 text-center">게시글 작성</h1>
            <div class="container mb-lg-4">
                <div>
                    <div class="input-group input-group-lg mb-4">
                        <span class="input-group-text">제목</span>
                        <input type="text" name="subject" id="subject" class="form-control">
                        <div class="invalid-feedback">
                            제목을 입력해주세요
                        </div>
                    </div>
                    <div class="input-group input-group-lg mb-4">
                        <textarea name="content" id="content" class="form-control"></textarea>
                        <div class="invalid-feedback">
                            내용을 입력해주세요.
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button id="btn-submit" type="button" class="btn btn-secondary">작성하기</button>
                <button id="btn-list" type="button" class="btn btn-secondary">목록보기</button>
                <button type="reset" class="btn btn-secondary">다시작성</button>
            </div>
        </div>
    </form>
</div>
<script src="../js/board.js"></script>