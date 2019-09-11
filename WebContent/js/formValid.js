const formLogin = document.querySelector('#form-login'),
    formWrite = document.querySelector('#form-write');
if (formLogin) initFormLogin();
if (formWrite) initFormWrite();

function initFormWrite() {
    const name = formWrite.querySelector('#name'),
        id = formWrite.querySelector('#id'),
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
        if (this.value) validate(this);
        else invalidate(this);
    });

    pwd.addEventListener("input", function(e) {
        if (this.value) validate(this);
        else invalidate(this);
    });

    repwd.addEventListener("input", function(e) {
        if (repwd && pwd === repwd) validate(this);
        else invalidate(this);
    });

    btnCheckId.addEventListener("click", function(e) {
        if (!id.value) {
            id.classList.add('is-invalid');
            return id.focus();
        } else {
            console.log('통과... 여기서 모달 레이어 띄울 예정')
        }
    });

    btnSubmit.addEventListener("click", function(e) {
        if (!id.classList.contains('is-valid')) return id.focus();
        if (!pwd.classList.contains('is-valid')) return pwd.focus();
        if (!repwd.value || repwd.value === pwd.value) {
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
        console.log("클릭!");
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