<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container imageboard_wrap">
    <table class="table table-hover">
        <thead class="text-center thead-dark">
            <tr>
                <th scope="col">No.</th>
                <th scope="col">이미지</th>
                <th scope="col">상품명</th>
                <th scope="col">단가</th>
                <th scope="col">개수</th>
                <th scope="col">합계</th>
            </tr>
        </thead>
        <tbody class="text-center">
            <c:forEach var="row" items="${requestScope.list}">
                <tr class="row-selected">
                    <th scope="row" class="align-middle">${row.seq}</th>
                    <td class="align-middle"><img src="../storage/${row.image1}" alt="" class="img-thumbnail" width="200" height="200"></td>
                    <td class="align-middle">${row.imageName}</td>
                    <td class="align-middle">${String.format("%,d", row.imagePrice)}</td>
                    <td class="align-middle">${row.imageQty}</td>
                    <td class="align-middle">${String.format("%,d", row.imagePrice * row.imageQty)}원</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="input-group input-group-sm justify-content-end mb-2">
        <select name="category" id="category" class="custom-select col-md-2">
            <option selected value="subject">제목</option>
            <option value="content">내용</option>
            <option value="id">아이디</option>
        </select>
        <input type="text" id="keyword" name="keyword" class="form-control">
        <div class="input-group-append">
            <button id="btn-search" class="btn btn-secondary" type="button">검색</button>
        </div>
    </div>

    <nav>
        <input type="hidden" id="totalGroup" value="${requestScope.totalGroup}">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" id="prev" href="#">이전</a>
            </li>
            <c:forEach var="i" begin="${requestScope.startGroup}" end="${requestScope.endGroup}">
                <li class="page-item"><a class="page-link page-move" href="">${i}</a></li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" id="next" href="#">다음</a>
            </li>
        </ul>
    </nav>
</div>
<script src="../js/board.js"></script>