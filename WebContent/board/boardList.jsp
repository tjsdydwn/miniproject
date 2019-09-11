<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="board_wrap">
    <div class="container mt-5">
        <table class="table table-hover table-dark">
            <thead class="text-center">
	            <tr>
	                <th scope="col">No.</th>
	                <th scope="col">제목</th>
	                <th scope="col">작성자</th>
	                <th scope="col">작성일</th>
	                <th scope="col">조회수</th>
	                <th scope="col">답글수</th>
	            </tr>
            </thead>
            <tbody class="text-center">
                <c:forEach var="row" items="${requestScope.list}">
                    <tr class="row-selected">
                        <th scope="row">${ row.seq }</th>
                        <td class="text-left">${ row.subject }</td>
                        <td>${ row.id }</td>
                        <td>${ row.logtime }</td>
                        <td>${ row.hit }</td>
                        <td>${ row.reply }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="text-center mb-5">
        <button id="btn-write" type="button" class="btn btn-secondary">작성하기</button>
    </div>
    <nav>
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
    <script src="../js/board.js"></script>
</div>