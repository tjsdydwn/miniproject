<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container imageboard_wrap">
    <form id="list-form" action="/miniproject/imageboard/imageboardDelete.do">
        <table class="table table-hover">
            <thead class="text-center thead-dark">
                <tr>
                    <th scope="col"><input class="main-selector" type="checkbox">No.</th>
                    <th scope="col">이미지</th>
                    <th scope="col">상품명</th>
                    <th scope="col">단가</th>
                    <th scope="col">개수</th>
                    <th scope="col">합계</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <c:forEach var="row" items="${requestScope.list}">
                    <tr>
                        <th scope="row" class="align-middle"><input name="checkedSeq" value="${row.seq}" class="selector" type="checkbox">${row.seq}</th>
                        <td class="align-middle"><img src="../storage/${row.image1}" alt="" class="img-thumbnail row-selected" width="200" height="200"></td>
                        <td class="align-middle">${row.imageName}</td>
                        <td class="align-middle">${String.format("%,d", row.imagePrice)}</td>
                        <td class="align-middle">${row.imageQty}</td>
                        <td class="align-middle">${String.format("%,d", row.imagePrice * row.imageQty)}원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-center mb-2">
            <button type="button" id="btn-delete" class="btn btn-secondary">선택삭제</button>
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
    </form>
</div>
<script src="../js/board.js"></script>