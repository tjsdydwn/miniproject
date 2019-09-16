<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <form action="" method="POST" id="form-imageboard">
        <div class="jumbotron">
            <div>
                <div class="input-group input-group mb-2">
                    <span class="input-group-text">상품코드</span>
                    <input type="text" name="imageId" id="imageId" class="form-control">
                    <div class="invalid-feedback">
                        상품코드를 입력해주세요
                    </div>
                </div>
                <div class="input-group input-group mb-2">
                    <span class="input-group-text">상품명</span>
                    <input type="text" name="imageName" id="imageName" class="form-control">
                    <div class="invalid-feedback">
                        상품명을 입력해주세요
                    </div>
                </div>
                <div class="input-group input-group mb-2">
                    <span class="input-group-text">단가</span>
                    <input type="number" name="imagePrice" id="imagePrice" class="form-control">
                    <div class="invalid-feedback">
                        단가를 입력해주세요
                    </div>
                </div>
                <div class="input-group input-group mb-2">
                    <span class="input-group-text">개수</span>
                    <input type="number" name="imageQty" id="imageQty" class="form-control">
                    <div class="invalid-feedback">
                        개수를 입력해주세요
                    </div>
                </div>
                <div class="input-group input-group mb-2">
                    <textarea name="imageContent" id="imageContent" class="form-control" style="height: 250px; resize: none;"></textarea>
                    <div class="invalid-feedback">
                        내용을 입력해주세요.
                    </div>
                </div>
                <div class="input-group input-group mb-2">
                    <input type="file" name="image1" id="image1" class="">
                </div>
            </div>
            <div class="text-center">
                <button id="btn-submit" type="button" class="btn btn-secondary">이미지등록</button>
                <button type="reset" class="btn btn-secondary">다시작성</button>
            </div>
        </div>
    </form>
</div>
<script src="../js/board.js"></script>