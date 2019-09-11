<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <form id="form-view" class="jumbotron" action="boardModifyForm.jsp" method="POST">
        <div class="wrap">
            <div class="input-group mb-md-3">
                <label class="input-group-text input-group-prepend">제목</label>
                <div class="form-control text-center">${requestScope.boardDTO.subject}</div>
            </div>

            <div class="input-group mb-md-3">
                <label class="input-group-text">글번호</label>
                <div class="form-control text-center">${requestScope.boardDTO.seq}</div>
                <label class="input-group-text">작성자</label>
                <div class="form-control text-center">${requestScope.boardDTO.id}</div>
                <label class="input-group-text">조회수</label>
                <div class="form-control text-center">${requestScope.boardDTO.hit}</div>
            </div>

            <div class="form-control textarea-size p-3 mb-md-3">${requestScope.boardDTO.content}</div>

            <div class="text-center">
                <button type="button" id="btn-update" class="btn btn-secondary">수정</button>
                <button type="button" id="btn-delete" class="btn btn-secondary">삭제</button>
                <button type="button" id="btn-back" class="btn btn-secondary">돌아가기</button>
            </div>
        </div>
    </form>
</div>
<script>
    const formView = document.querySelector('#form-view');
    if (formView) initBoardView();

    function initBoardView() {
        const _url = window.location.href;
        const btnUpdate = formView.querySelector('#btn-update'),
            btnDelete = formView.querySelector('#btn-delete'),
            btnBack = formView.querySelector('#btn-back');

        const pgString = 'pg=',
            seqString = 'seq=',
            pgIdx = _url.indexOf(pgString),
            seqIdx = _url.indexOf(seqString),
            andIdx = _url.indexOf('&'),
            pg = _url.substring(pgIdx + pgString.length, andIdx),
            seq = _url.substring(seqIdx + seqString.length);

        btnUpdate.addEventListener("click", function(e) {

        });

        btnDelete.addEventListener("click", function(e) {
            return false;
        });

        btnBack.addEventListener("click", function(e) {
            location.href = `/miniproject/board/boardList.do?pg=${pg}`
        });
    }
</script>