<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <form action="/miniproject/board/boardWrite.do" method="POST" id="form-board">
        <div class="jumbotron">
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
            </div>
        </div>
    </form>
</div>
<script src="../js/board.js"></script>