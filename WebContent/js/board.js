"use strict"

const formBoard = document.querySelector('#form-board'),
    boardList = document.querySelector('.board_wrap'),
    formView = document.querySelector('#form-view');

if (formBoard) initBoard();
if (boardList) initBoardList();
if (formView) initBoardView();

function initBoardView() {
    const _url = window.location.href;
    const btnUpdate = formView.querySelector('#btn-update'),
        btnDelete = formView.querySelector('#btn-delete'),
        idArea = formView.querySelector('div[data-id]');

    const pgString = 'pg=',
        seqString = 'seq=',
        pgIdx = _url.indexOf(pgString),
        seqIdx = _url.indexOf(seqString),
        andIdx = _url.indexOf('&'),
        pg = _url.substring(pgIdx + pgString.length, andIdx),
        seq = _url.substring(seqIdx + seqString.length),
        writer = idArea.innerText,
        sid = idArea.getAttribute("data-id");

    if (btnUpdate)
        btnUpdate.addEventListener("click", function(e) {
            if (writer === sid) {
                formView.submit();
            } else return false;
        });

    if (btnDelete)
        btnDelete.addEventListener("click", function(e) {
            return false;
        });
}


function initBoardList() {
    const btnWrite = boardList.querySelector('#btn-write'),
        btnNext = boardList.querySelector('#next'),
        btnPrev = boardList.querySelector('#prev'),
        pageMovers = boardList.querySelectorAll('.page-move'),
        rowsSelected = boardList.querySelectorAll('.row-selected'),
        category = boardList.querySelector('#category'),
        keyword = boardList.querySelector('#keyword'),
        btnSearch = boardList.querySelector('#btn-search');

    const queryIdx = location.href.indexOf('?') + 1,
        queryStr = location.href.substr(queryIdx),
        params = queryStr.split('&'),
        paramValues = [], //pg, category, keyword 순.
        groupLimit = 3;

    for (let i = 0; i < params.length; i++) {
        paramValues.push(params[i].substr(params[i].indexOf('=') + 1));
    }

    if (btnWrite)
        btnWrite.addEventListener("click", function(e) {
            location.href = "/miniproject/board/boardWriteForm.do";
        });

    for (let i = 0; i < rowsSelected.length; i++) {
        let seq = parseInt(rowsSelected[i].firstElementChild.innerText);
        rowsSelected[i].addEventListener("click", function(e) {
            location.href = `/miniproject/board/boardView.do?pg=${paramValues[0]}&seq=${seq}`;
        });
    }

    if (paramValues.length > 1) {
        for (let i = 0; i < pageMovers.length; i++) {
            let pg = pageMovers[i].innerText;
            pageMovers[i].setAttribute("href", `/miniproject/board/boardSearch.do?pg=${pg}&category=${paramValues[1]}&keyword=${paramValues[2]}`);
            if (paramValues[0] == pg) pageMovers[i].parentElement.classList.add('active');
        }
    } else {
        for (let i = 0; i < pageMovers.length; i++) {
            let pg = pageMovers[i].innerText;
            pageMovers[i].setAttribute("href", "/miniproject/board/boardList.do?pg=" + pg);
            if (paramValues[0] == pg) pageMovers[i].parentElement.classList.add('active');
        }
    }

    let prevPg = parseInt(pageMovers[0].innerText) - 1;
    let nextPg = prevPg + (groupLimit + 1);

    if (paramValues.length > 1) {
        // boardSearch.do?pg=1&category=id&keyword=tjs
        btnPrev.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${prevPg}&category=${paramValues[1]}&keyword=${paramValues[2]}`);
        btnNext.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${nextPg}&category=${paramValues[1]}&keyword=${paramValues[2]}`);
    } else {
        btnPrev.setAttribute("href", "/miniproject/board/boardList.do?pg=" + prevPg);
        btnNext.setAttribute("href", "/miniproject/board/boardList.do?pg=" + nextPg);
    }

    if (prevPg == 0) btnPrev.parentElement.classList.add('disabled');
    if (pageMovers.length !== groupLimit) btnNext.parentElement.classList.add('disabled');
    console.log(pageMovers.length);
    console.log(groupLimit);

    btnSearch.addEventListener("click", function(e) {
        if (!keyword.value.trim()) return false;
        location.href = `/miniproject/board/boardSearch.do?pg=1&category=${category.value}&keyword=${keyword.value}`;
    });
}

function initBoard() {
    const subject = formBoard.querySelector('#subject'),
        content = formBoard.querySelector('#content'),
        btnSubmit = formBoard.querySelector('#btn-submit'),
        btnList = formBoard.querySelector('#btn-list');

    btnSubmit.addEventListener("click", function(e) {
        if (!subject.value) {
            invalidate(subject);
            subject.focus();
            return;
        }

        if (!content.value) {
            invalidate(content);
            content.focus();
            return;
        }

        formBoard.submit();
    });

    subject.addEventListener("blur", function() {
        if (this.value) {
            validate(this);
        }
    });

    content.addEventListener("blur", function() {
        if (this.value) {
            validate(this);
        }
    });
}

function validate(el) {
    if (el.classList.contains('is-invalid')) {
        el.classList.remove('is-invalid');
    }
}

function invalidate(el) {
    if (!el.classList.contains('is-invalid')) {
        el.classList.add('is-invalid');
    }
}