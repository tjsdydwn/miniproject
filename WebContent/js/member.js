const writeForm = document.querySelector('.form-join');

if (writeForm) initWrite();

function initWrite() {
    const inputName = writeForm.querySelector('#name'),
        inputID = writeForm.querySelector('#id'),
        btnCheckId = writeForm.querySelector('#btnCheckId'),
        inputPwd = writeForm.querySelector('#pwd'),
        inputRepwd = writeForm.querySelector('#repwd'),
        selectEmail = writeForm.querySelector('select.email2'),
        inputEmail = writeForm.querySelector('input.email2'),
        btnJoin = writeForm.querySelector('#btn-join'),
        inputZipcode = writeForm.querySelector('#zipcode'),
        inputAddr1 = writeForm.querySelector('#addr1'),
        inputAddr2 = writeForm.querySelector('#addr2');

    inputName.addEventListener("blur", function(e) {
        if (!this.value) {
            this.parentElement.querySelector('span[data-placeholder]').classList.add("show");
            this.focus();
        } else {
            this.parentElement.querySelector('span[data-placeholder]').classList.remove("show");
        }
    });

    inputID.addEventListener("blur", function(e) {
        if (!this.value) {
            this.parentElement.querySelector('span[data-placeholder]').classList.add("show");
            this.focus();
        } else {
            this.parentElement.querySelector('span[data-placeholder]').classList.remove("show");

        }
    });

    btnCheckId.addEventListener("click", function(e) {
        if (!inputID.value) {
            inputID.parentElement.querySelector('span[data-placeholder]').classList.add("show");
            inputID.focus();
        } else {
            let host = window.location.host;
            let url = `http://${host}/mvcmember/member/checkId.do?id=${inputID.value}`
            //            let url = "http://localhost:8080/mvcmember/member/checkId.do?id=" + inputID.value;
            window.open(url, '아이디 중복확인', 'width=500, height=500');
        }
    });

    inputID.addEventListener("click", function(e) {
        document.querySelector('#checkedId').value = 'false';
    });

    inputPwd.addEventListener("blur", function(e) {
        if (this.value == "") {
            this.parentElement.querySelector('span[data-placeholder]').classList.add("show");
            this.focus();
        } else {
            this.parentElement.querySelector('span[data-placeholder]').classList.remove("show");
        }
    });

    inputRepwd.addEventListener("blur", function(e) {
        if (this.value != inputPwd.value) {
            this.parentElement.querySelector('span[data-placeholder]').classList.add("show");
            this.value = "";
        } else {
            this.parentElement.querySelector('span[data-placeholder]').classList.remove("show");
        }
    });

    selectEmail.addEventListener("click", function(e) {
        if (this.value == "direct") {
            this.classList.add("hide");
            inputEmail.classList.remove("hide");
            inputEmail.focus();
        }
    });

    inputEmail.addEventListener("click", function(e) {
        this.classList.add("hide");
        selectEmail.classList.remove("hide");
        selectEmail.getElementsByTagName('option')[0].selected = "selected";
    });

    btnJoin.addEventListener("click", function(e) {
        if (isValidation(inputName))
            if (isValidation(inputID))
                if (isValidation(inputPwd))
                    if (isValidation(inputRepwd))
                        if (isValidation(selectEmail))
                            document.writeForm.submit();
    });
}

function isValidation(el) {
    if (!el.value) {
        if (el.parentElement.querySelector('span[data-placeholder]')) {
            el.parentElement.querySelector('span[data-placeholder]').classList.add("show");
        } else {
            el.parentElement.parentElement.querySelector('span[data-placeholder]').classList.add("show");
        }
        el.focus();
        return false;
    } else {
        return true;
    }
}

function checkPostClose(zipcode, addr1) {
    opener.document.forms[0].zipcode.value = zipcode;
    opener.document.forms[0].addr1.value = addr1;
    window.close();
    opener.document.forms[0].addr2.focus();
}

function postCheck() {
    let host = window.location.host;
    let url = `http://${host}/mvcmember/member/checkPost.do`;
    window.open(url, "우편번호 확인", "width=600 height=500 scrollbars=yes");
}

function checkIdClose(id) {
    opener.writeForm.id.value = id;
    opener.writeForm.checkedId.value = 'true';
    window.close();
    opner.writeForm.pwd.focus();
}