const formBoard = document.querySelector('#form-board'),
	boardList = document.querySelector('.board_wrap');


if(formBoard) initBoard();
if(boardList) initBoardList();
	

function initBoardList(){
	const btnWrite = boardList.querySelector('#btn-write'),
		btnNext = boardList.querySelector('#next'),
		btnPrev = boardList.querySelector('#prev'),
		pageMovers = boardList.querySelectorAll('.page-move'),
		rowsSelected = boardList.querySelectorAll('.row-selected');
	
	const idx = window.location.href.indexOf('=') + 1,
	 	currPg = window.location.href.substring(idx),
	 	groupLimit = 3;
	
	btnWrite.addEventListener("click", function(e){
		location.href = "/miniproject/board/boardWriteForm.do";
	});
	
	for(let i = 0; i < rowsSelected.length; i++){
		let seq = parseInt(rowsSelected[i].firstElementChild.innerText);
		rowsSelected[i].addEventListener("click", function(e){
			location.href = `/miniproject/board/boardView.do?pg=${currPg}&seq=${seq}`;
		});
	}
	
	for(let i = 0; i < pageMovers.length; i++){
		let pg = pageMovers[i].innerText;
		pageMovers[i].setAttribute("href", "/miniproject/board/boardList.do?pg="+pg);
		if(currPg == pg) pageMovers[i].parentElement.classList.add('active');
	}
	
	let prevPg = parseInt(pageMovers[0].innerText) - 1;
	let nextPg = prevPg + (groupLimit + 1);

	btnPrev.setAttribute("href", "/miniproject/board/boardList.do?pg="+prevPg);
	btnNext.setAttribute("href", "/miniproject/board/boardList.do?pg="+nextPg);
	
	if(prevPg == 0) btnPrev.parentElement.classList.add('disabled');
	if(pageMovers.length !== groupLimit) btnNext.parentElement.classList.add('disabled');
}

function initBoard(){
	const subject = formBoard.querySelector('#subject'),
    content = formBoard.querySelector('#content'),
    btnSubmit = formBoard.querySelector('#btn-submit'),
    btnList = formBoard.querySelector('#btn-list');
	
	btnSubmit.addEventListener("click", function (e) {
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

	btnList.addEventListener("click", function(e){
		location.href= "/miniproject/board/boardList.do?pg=1";
	})

	subject.addEventListener("blur", function () {
	    if (this.value) {
	        validate(this);
	    }
	});

	content.addEventListener("blur", function () {
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