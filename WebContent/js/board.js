function checkBoardWrite() {
    if (!hasSubject()) {
        alert("제목을 입력해주세요...");
        document.querySelector('#subject').focus();
        return false;
    }
    if (!hasContent()) {
        alert("내용을 입력해주세요...");
        document.querySelector('#content').focus();
        return false;
    }
    document.querySelector('#form-board-write').submit();
}

function checkBoardModify() {
    if (!hasSubject()) {
        alert("제목을 입력해주세요...");
        document.querySelector('#subject').focus();
        return false;
    }

    if (!hasContent()) {
        alert("내용을 입력해주세요...");
        document.querySelector('#content').focus();
        return false;
    }

    document.querySelector('#form-board-modify').submit();
}

function hasSubject() {
    if (document.querySelector('#subject').value.trim()) {
        return true;
    }
    return false;
}

function hasContent() {
    if (document.querySelector('#content').value) {
        return true;
    }
    return false;
}