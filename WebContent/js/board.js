"use strict"

window.onload = function() {
    const formBoard = document.querySelector('#form-board'),
        formView = document.querySelector('#form-view'),
        formImageboard = document.querySelector('#form-imageboard'),
        boardList = document.querySelector('.board_wrap'),
        imageboardList = document.querySelector('.imageboard_wrap');

    if (formBoard) initBoard();
    if (boardList) initBoardList();
    if (formView) initBoardView();
    if (formImageboard) initImageboard();
    if (imageboardList) initImageboardList();

    function initImageboardList() {
        const btnNext = imageboardList.querySelector('#next'),
            btnPrev = imageboardList.querySelector('#prev'),
            pageMovers = imageboardList.querySelectorAll('.page-move'),
            totalGroup = imageboardList.querySelector('#totalGroup'),
            rowsSelected = imageboardList.querySelectorAll('.row-selected'),
            btnDelete = imageboardList.querySelector('#btn-delete'),
            selectors = imageboardList.querySelectorAll('.selector'),
            selector = imageboardList.querySelector('.main-selector');

        const qs = getQueryString(),
            groupLimit = 3;

        btnDelete.addEventListener("click", function(e) {
            let cnt = 0;
            selectors.forEach(sel => {
                if(sel.checked) cnt++;
            });

            if(!cnt) return alert('항목을 선택 하세요.')
            else {
                if(confirm('정말로 삭제하시겠습니까?')) document.querySelector('#list-form').submit();
            }
        });

        selector.addEventListener("change", function(e) {
            if (this.checked) {
                selectors.forEach(sel => {
                    sel.checked = true;
                });
            } else {
                selectors.forEach(sel => {
                    sel.checked = false;
                });
            }
        });

        for (let i = 0; i < rowsSelected.length; i++) {
            let seq = rowsSelected[i].parentElement.parentElement.firstElementChild.innerText.trim();
            rowsSelected[i].addEventListener("click", function(e) {
                location.href = `/miniproject/imageboard/imageboardView.do?pg=${qs.pg}&seq=${seq}`;
            });
        }

        if (Object.keys(qs).length > 1) {
            for (let i = 0; i < pageMovers.length; i++) {
                let pg = pageMovers[i].innerText;
                pageMovers[i].setAttribute("href", `/miniproject/board/boardSearch.do?pg=${pg}&category=${qs.category}&keyword=${qs.keyword}`);
                if (qs.pg == pg) pageMovers[i].parentElement.classList.add('active');
            }
        } else {
            for (let i = 0; i < pageMovers.length; i++) {
                let pg = pageMovers[i].innerText;
                pageMovers[i].setAttribute("href", `/miniproject/imageboard/imageboardList.do?pg=${pg}`);
                if (qs.pg == pg) pageMovers[i].parentElement.classList.add('active');
            }
        }

        let prevPg = parseInt(pageMovers[0].innerText) - 1;
        let nextPg = prevPg + (groupLimit + 1);

        if (Object.keys(qs).length > 1) {
            btnPrev.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${prevPg}&category=${qs.category}&keyword=${qs.keyword}`);
            btnNext.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${nextPg}&category=${qs.category}&keyword=${qs.keyword}`);
        } else {
            btnPrev.setAttribute("href", `/miniproject/imageboard/imageboardList.do?pg="${prevPg}`);
            btnNext.setAttribute("href", `/miniproject/imageboard/imageboardList.do?pg="${nextPg}`);
        }

        if (prevPg == 0) btnPrev.parentElement.classList.add('disabled');
        if (pageMovers.length !== groupLimit || pageMovers[pageMovers.length - 1].innerText == totalGroup.value) btnNext.parentElement.classList.add('disabled');
    }

    function initImageboard() {
        const imageId = formImageboard.querySelector('#imageId'),
            imageName = formImageboard.querySelector('#imageName'),
            imagePrice = formImageboard.querySelector('#imagePrice'),
            imageQty = formImageboard.querySelector('#imageQty'),
            imageContent = formImageboard.querySelector('#imageContent'),
            image1 = formImageboard.querySelector('#image1'),
            btnSubmit = formImageboard.querySelector('#btn-submit');

        btnSubmit.addEventListener('click', function(e) {
            if (!imageId.value) {
                invalidate(imageId);
                imageId.focus();
                return;
            }

            if (!imageName.value) {
                invalidate(imageName);
                imageName.focus();
                return;
            }

            if (!imagePrice.value) {
                invalidate(imagePrice);
                imagePrice.focus();
                return;
            }

            if (!imageQty.value) {
                invalidate(imageQty);
                imageQty.focus();
                return;
            }

            if (!imageContent.value) {
                invalidate(imageContent);
                imageContent.focus();
                return;
            }

            if (!image1.value) {
                invalidate(image1);
                image1.focus();
                return;
            }

            formImageboard.submit();
        });

        imageId.addEventListener("blur", function(e) {
            if (this.value) validate(this);
        });

        imageName.addEventListener("blur", function(e) {
            if (this.value) validate(this);
        });

        imagePrice.addEventListener("blur", function(e) {
            if (this.value) validate(this);
        });

        imageQty.addEventListener("blur", function(e) {
            if (this.value) validate(this);
        })

        imageContent.addEventListener("blur", function(e) {
            if (this.value) validate(this);
        });

        image1.addEventListener("change", function(e) {
            const label = formImageboard.querySelector('#image1 + label');
            if (this.value) {
                label.innerText = this.files[0].name;
                validate(this);
            } else {
                label.innerText = '파일을 선택해주세요';
                invalidate(this);
            }
        })

    }

    function initBoardView() {
        const btnUpdate = formView.querySelector('#btn-update'),
            btnDelete = formView.querySelector('#btn-delete'),
            btnReply = formView.querySelector('#btn-reply'),
            idArea = formView.querySelector('div[data-id]');

        const writer = idArea.innerText,
            sid = idArea.getAttribute("data-id"),
            qs = getQueryString();

        btnReply.addEventListener("click", function(e) {
            location.href = `/miniproject/board/boardReplyForm.do?pg=${qs.pg}&pseq=${qs.seq}`;
        });

        if (btnUpdate)
            btnUpdate.addEventListener("click", function(e) {
                if (writer === sid) {
                    formView.submit();
                } else return false;
            });

        if (btnDelete)
            btnDelete.addEventListener("click", function(e) {
                location.href = `/miniproject/board/boardDelete.do?seq=${qs.seq}`;
            });
    }

    function initBoardList() {
        const btnWrite = boardList.querySelector('#btn-write'),
            btnNext = boardList.querySelector('#next'),
            btnPrev = boardList.querySelector('#prev'),
            pageMovers = boardList.querySelectorAll('.page-move'),
            totalGroup = boardList.querySelector('#totalGroup'),
            rowsSelected = boardList.querySelectorAll('.row-selected'),
            category = boardList.querySelector('#category'),
            keyword = boardList.querySelector('#keyword'),
            btnSearch = boardList.querySelector('#btn-search');

        const qs = getQueryString(),
            groupLimit = 3;


        if (btnWrite)
            btnWrite.addEventListener("click", function(e) {
                location.href = "/miniproject/board/boardWriteForm.do";
            });

        for (let i = 0; i < rowsSelected.length; i++) {
            let seq = parseInt(rowsSelected[i].firstElementChild.firstElementChild.textContent);
            rowsSelected[i].addEventListener("click", function(e) {
                location.href = `/miniproject/board/boardView.do?pg=${qs.pg}&seq=${seq}`;
            });
        }

        if (Object.keys(qs).length > 1) {
            for (let i = 0; i < pageMovers.length; i++) {
                let pg = pageMovers[i].innerText;
                pageMovers[i].setAttribute("href", `/miniproject/board/boardSearch.do?pg=${pg}&category=${qs.category}&keyword=${qs.keyword}`);
                if (qs.pg == pg) pageMovers[i].parentElement.classList.add('active');
            }
        } else {
            for (let i = 0; i < pageMovers.length; i++) {
                let pg = pageMovers[i].innerText;
                pageMovers[i].setAttribute("href", `/miniproject/board/boardList.do?pg=${pg}`);
                if (qs.pg == pg) pageMovers[i].parentElement.classList.add('active');
            }
        }

        let prevPg = parseInt(pageMovers[0].innerText) - 1;
        let nextPg = prevPg + (groupLimit + 1);

        if (Object.keys(qs).length > 1) {
            btnPrev.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${prevPg}&category=${qs.category}&keyword=${qs.keyword}`);
            btnNext.setAttribute("href", `/miniproject/board/boardSearch.do?pg=${nextPg}&category=${qs.category}&keyword=${qs.keyword}`);
        } else {
            btnPrev.setAttribute("href", `/miniproject/board/boardList.do?pg=${prevPg}`);
            btnNext.setAttribute("href", `/miniproject/board/boardList.do?pg=${nextPg}`);
        }

        if (prevPg == 0) btnPrev.parentElement.classList.add('disabled');
        if (pageMovers.length !== groupLimit || pageMovers[pageMovers.length - 1].innerText == totalGroup.value) btnNext.parentElement.classList.add('disabled');


        btnSearch.addEventListener("click", function(e) {
            if (!keyword.value.trim()) return false;
            location.href = `/miniproject/board/boardSearch.do?pg=1&category=${category.value}&keyword=${keyword.value}`;
        });


    }

    function initBoard() {
        const subject = formBoard.querySelector('#subject'),
            content = formBoard.querySelector('#content'),
            btnSubmit = formBoard.querySelector('#btn-submit');

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

    function getQueryString() {
        const strings = location.search.slice(1).split('&');
        let result = {};
        strings.forEach(string => {
            string = string.split('=');
            result[string[0]] = decodeURIComponent(string[1] || '');
        });

        return JSON.parse(JSON.stringify(result));
    }
}