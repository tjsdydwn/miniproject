<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container board_wrap">
    <table class="table table-hover table-striped">
        <thead class="text-center thead-dark">
            <tr>
                <th scope="col" width="5%">No.</th>
                <th scope="col">제목</th>
                <th scope="col" width="7%">작성자</th>
                <th scope="col" width="17%">작성일</th>
                <th scope="col" width="8%">조회</th>
                <th scope="col" width="8%">답글</th>
            </tr>
        </thead>
        <tbody class="text-center">
            <c:forEach var="row" items="${requestScope.list}">
                <tr class="row-selected">
                    <th scope="row">
                 	<c:if test="${ row.lev == 0 }">
                    	<span>${row.seq}</span>
                    </c:if>
                    <c:if test="${ row.lev != 0 }">
                    	<span class="invisible">${row.seq}</span>
                    </c:if>
                    </th>
                    <td class="text-left" style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:100px;overflow:hidden;">
	                    <c:if test="${ row.lev != 0 }">
	                    	<c:forEach var="i" begin="1" end="${row.lev}">
	                    	&nbsp;&nbsp;&nbsp;
	                    	</c:forEach>
	                    	<img src="../img/reply.png" width="25px">
	                    </c:if>
	                    ${row.subject}
                    </td>
                    <td>${row.id}</td>
                    <td>${row.logtime}</td>
                    <td>${row.hit}</td>
                    <td>${row.reply}</td>
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
  
    <c:if test="${sessionScope.memId != null}">
        <div class="text-center mb-3">
            <button id="btn-write" type="button" class="btn btn-secondary">작성하기</button>
        </div>
    </c:if>

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