<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="">
    <div class="row mb-2">
        <div class="col-md-3 text-center">
            <img src="../storage/${imageboardDTO.image1}" alt="" class="img-thumbnail" width="200" height="200">
        </div>
        <div class="col-md">
            <div class="input-group mb-1">
                <span class="input-group-text">상품명</span>
                <div class="form-control">${imageboardDTO.imageName}</div>
            </div>
            <div class="input-group mb-1">
                <span class="input-group-text">단가</span>
                <div class="form-control">${String.format("%,d", imageboardDTO.imagePrice)}</div>
            </div>
            <div class="input-group mb-1">
                <span class="input-group-text">개수</span>
                <div class="form-control">${String.format("%,d", imageboardDTO.imageQty)}</div>
            </div>
            <div class="input-group">
                <span class="input-group-text">합계</span>
                <div class="form-control">${String.format("%,d", imageboardDTO.imagePrice * imageboardDTO.imageQty)}원</div>
            </div>
        </div>
    </div>

    <div class="row mb-2">
        <div class="textarea form-control p-2" style="height:200px;">${imageboardDTO.imageContent}</div>
    </div>

    <div class="text-center">
        <a href="/miniproject/imageboard/imageboardList.do?pg=${pg}" class="btn btn-secondary">목록</a>
    </div>
</form>
<script src="../js/board.js"></script>