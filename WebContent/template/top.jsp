<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="col-sm">
			<h1>MVC를 이용한 미니프로젝트</h1>
		</div>
		<div class="col-sm-1">
			<a href="/miniproject/main/index.do"><img width="80" src="../img/home.png" alt="메인"></a>
		</div>
	</div>
</div>
<div class="text-center">
	<div class="btn-group">
		<c:if test="${sessionScope.memId != null}">
	  		<a href="/miniproject/board/boardWriteForm.do" class="btn btn-secondary">글쓰기</a>
	  		<c:if test="${sessionScope.memId == 'admin'}">
	  		<a href="/miniproject/board/imageboardWriteForm.do" class="btn btn-secondary">이미지 등록</a>
	  		</c:if>
	    </c:if>
	  <a href="/miniproject/board/boardList.do?pg=1" class="btn btn-secondary">목록</a>
	</div>
</div>
