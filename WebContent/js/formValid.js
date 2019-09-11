const formLogin = document.querySelector('#form-login'),
    formWrite = document.querySelector('#form-write'),
    formModify = document.querySelector('#form-modify');
if (formLogin) initFormLogin();
if (formWrite) initFormWrite();
if (formModify) initFormModify();

function initFormWrite() {
    const name = formWrite.querySelector('#name'),
        id = formWrite.querySelector('#id'),
        checkedId = formWrite.querySelector('#checkedId'),
        btnCheckId = formWrite.querySelector('#btnCheckId'),
        pwd = formWrite.querySelector('#pwd'),
        repwd = formWrite.querySelector('#repwd'),
        email1 = formWrite.querySelector('#email1'),
        email2 = formWrite.querySelector('#email2'),
        zipcode = formWrite.querySelector('#zipcode'),
        btnZipcode = formWrite.querySelector('#btn-zipcode'),
        addr1 = formWrite.querySelector('#addr1'),
        addr2 = formWrite.querySelector('#addr2'),
        btnSubmit = formWrite.querySelector('#btn-submit');

    name.addEventListener("input", function(e) {
        if (this.value) validate(this);
        else invalidate(this);
    });

    id.addEventListener("input", function(e) {
        if (checkedId.value === 'true') {
            invalidate(this);
            checkedId.value = 'false';
            btnCheckId.disabled = false;
            btnCheckId.innerText = 'ID확인';
        }
    });

    pwd.addEventListener("input", function(e) {
        if (this.value) validate(this);
        else invalidate(this);
    });

    repwd.addEventListener("input", function(e) {
        if (!repwd.value || pwd.value !== repwd.value) invalidate(this);
        else validate(this);
    });

    btnCheckId.addEventListener("click", function(e) {
        if (!id.value) {
            id.classList.add('is-invalid');
            return id.focus();
        } else {
            const host = location.host;
            const url = `http://${host}/miniproject/member/checkId.do?id=${id.value}`;
            window.open(url, '아이디 중복확인', 'width=500, height=500');
        }
    });

    btnSubmit.addEventListener("click", function(e) {
        if (!id.classList.contains('is-valid')) return id.focus();
        if (!pwd.classList.contains('is-valid')) return pwd.focus();
        if (!repwd.value || !repwd.value === pwd.value) {
            alert('동일한 비밀번호를 입력해주세요.');
            return repwd.focus();
        }
    });

    zipcode.addEventListener("click", function(e) {
        btnZipcode.click();
    })

    btnZipcode.addEventListener("click", function(e) {
        const host = location.host;
        const url = `http://${host}/miniproject/member/checkPost.do`;
        window.open(url, '우편번호 검색', 'width=700, height=500');
    });

    btnSubmit.addEventListener("click", function(e) {
        formWrite.submit();
    });
}

function initFormLogin() {
    const id = document.querySelector('#id'),
        pwd = document.querySelector('#pwd'),
        btnSubmit = document.querySelector('#btn-submit');

    btnSubmit.addEventListener("click", function(e) {
        if (!id.value) return alert('아이디를 입력해주세요.');
        if (!pwd.value) return alert('비밀번호를 입력해주세요.');
        formLogin.submit();
    });
}

function validate(el) {
    if (el.classList.contains('is-invalid')) el.classList.replace('is-invalid', 'is-valid');
    else el.classList.add('is-valid');
}

function invalidate(el) {
    if (el.classList.contains('is-valid')) el.classList.replace('is-valid', 'is-invalid');
    else el.classList.add('is-invalid');
}

const newId = document.querySelector('#new-id');

if (newId) {
    const btnClose = document.querySelector('#btn-close');
    btnClose.addEventListener("click", function(e) {
        const formWrite = opener.document.querySelector('#form-write'),
            id = formWrite.querySelector('#id'),
            checkedId = formWrite.querySelector('#checkedId'),
            btnCheckId = formWrite.querySelector('#btnCheckId');

        id.value = newId.innerText;
        validate(id);
        checkedId.value = 'true';
        window.close();

        formWrite.querySelector('#pwd').focus();
        btnCheckId.innerText = '확인완료';
        btnCheckId.disabled = true;
    });
}