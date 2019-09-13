const formLogin = document.querySelector('#form-login'),
    formWrite = document.querySelector('#form-write'),
    formModify = document.querySelector('#form-modify');
if (formLogin) initFormLogin();
if (formWrite) initFormWrite();
if (formModify) initFormModify();

function initFormModify() {
    //라디오버튼
    const radioBtns = formModify.querySelectorAll('input[name=gender]'),
        gender = formModify.querySelector('#gender'),
        tel1 = formModify.querySelector('#tel1'),
        btnSubmit = formModify.querySelector('#btn-submit'),
        name = formModify.querySelector('#name'),
        pwd = formModify.querySelector('#pwd'),
        repwd = formModify.querySelector('#repwd'),
        zipcode = formModify.querySelector('#zipcode'),
        addr1 = formModify.querySelector('#addr1'),
        addr2 = formModify.querySelector('#addr2'),
        btnZipcode = formModify.querySelector('#btn-zipcode');

    radioBtns[parseInt(gender.value)].checked = true;

    //전화번호
    tel1.value = tel1.getAttribute('data-default');

    name.addEventListener("input", function(e) {
        if (this.value) validate(this);
        else invalidate(this);
    });

    pwd.addEventListener("input", function(e) {
        if (this.value) validate(this);
        else invalidate(this);

        if (repwd.value && pwd.value !== repwd.value) {
            invalidate(repwd);
        }
    });

    repwd.addEventListener("input", function(e) {
        if (!repwd.value || pwd.value !== repwd.value) invalidate(this);
        else validate(this);
    });

    zipcode.addEventListener("click", function(e) {
        btnZipcode.click();
    });

    btnZipcode.addEventListener("click", function(e) {
        execSearchZipcode(zipcode, addr1, addr2);
    });

    btnSubmit.addEventListener("click", function(e) {
        if (!isValid(name)) {
            invalidate(name);
            return name.focus();
        }

        if (!isValid(pwd)) {
            invalidate(pwd);
            return pwd.focus();
        }

        if (!isValid(repwd)) {
            invalidate(repwd);
            return repwd.focus();
        }

        formModify.submit();
    });
}

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

        if (repwd.value && pwd.value !== repwd.value) {
            invalidate(repwd);
        }
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

    zipcode.addEventListener("click", function(e) {
        btnZipcode.click();
    })

    btnZipcode.addEventListener("click", function(e) {
        execSearchZipcode(zipcode, addr1, addr2);
    });

    // btnZipcode.addEventListener("click", function(e) {
    //     const host = location.host;
    //     const url = `http://${host}/miniproject/member/checkPost.do`;
    //     window.open(url, '우편번호 검색', 'width=700, height=500');
    // });

    btnSubmit.addEventListener("click", function(e) {
        if (!isValid(name)) {
            invalidate(name);
            return name.focus();
        }

        if (checkedId.value === 'false') {
            invalidate(id);
            return id.focus();
        }

        if (!isValid(pwd)) {
            invalidate(pwd);
            return pwd.focus();
        }

        if (!isValid(repwd)) {
            invalidate(repwd);
            return repwd.focus();
        }
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

function isValid(el) {
    if (!el.value) return false;
    if (el.classList.contains('is-invalid')) return false;
    return true;
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

function execSearchZipcode(zipcode, addr1, addr2) {
    new daum.Postcode({
        oncomplete: function(data) {
            let addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            zipcode.value = data.zonecode;
            addr1.value = addr;
            // 커서를 상세주소 필드로 이동한다.
            addr2.focus();
        }
    }).open();
}