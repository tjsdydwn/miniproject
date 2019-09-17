<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <style>
        #image1 + label::after{
            content : "찾기";
        }
    </style>
    <form action="/miniproject/imageboard/imageboardWrite.do" method="POST" id="form-imageboard" enctype="multipart/form-data">
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
                    <div class="custom-file">
                        <input type="file" name="image1" id="image1" class="custom-file-input">
                        <label class="custom-file-label" for="image1">파일을 선택해주세요</label>
                    </div>
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