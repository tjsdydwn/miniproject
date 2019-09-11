<%@ page language = "java" contentType ="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 수정</title>
    <style>
        table {
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid gray;
        }

        tr:last-child>td {
            text-align: center;
        }
    </style>
</head>

<body>
    <h1>회원정보 수정</h1>
    <form action="/mvcmember/member/modify.do" name="modifyForm" method="POST">
        <table>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" id="name" value="${requestScope.memberDTO.name}"></td>
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id" id="id" value="${requestScope.memberDTO.id}" readonly></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pwd" id="pwd"></td>
            </tr>
            <tr>
                <th>재확인</th>
                <td><input type="password" name="repwd" id="repwd"></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <input type="radio" name="gender" id="male" value="0">
                    <label for="mail">남</label>
                    <input type="radio" name="gender" id="female" value="1">
                    <label for="female">여</label>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input name="email1" type="text" value="${requestScope.memberDTO.email1}">
                    <span>@</span>
                    <input name="email2" type="text" list="email-list" value="${requestScope.memberDTO.email2}">
                    <datalist id="email-list">
                        <option value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                    </datalist>
                </td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td>
                    <select name="tel1" id="tel1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                    </select>
                    <span>-</span>
                    <input type="text" name="tel2" id="tel2" value="${memberDTO.tel2}">
                    <span>-</span>
                    <input type="text" name="tel3" id="tel3" value="${memberDTO.tel3}">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="zipcode" id="zipcode" value="${memberDTO.zipcode}" readonly>
                    <button type="button" onclick="postCheck()">우편번호검색</button>
                    <br>
                    <input type="text" name="addr1" id="addr1" value="${memberDTO.addr1}">
                    <br>
                    <input type="text" name="addr2" id="addr2" value="${memberDTO.addr2}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="checkModify()">정보수정</button>
                    <button type="reset">다시작성</button>
                </td>
            </tr>
        </table>
    </form>
    <script src="../js/member.js"></script>
    <script>
        //라디오버튼
        let radioBtns = document.querySelectorAll('input[name=gender]');
        let gender = "${memberDTO.gender}";
        radioBtns[parseInt(gender)].checked = true;
        //전화번호
        document.querySelector('#tel1 [value = "${memberDTO.tel1}"]').selected = true;

        function checkModify() {
            if (!document.querySelector('#name').value) {
                alert('이름을 입력해주세요.');
                return;
            }

            if (!document.querySelector('#pwd').value) {
                alert('비밀번호를 입력해주세요.');
                return;
            }

            if (document.querySelector('#pwd').value != document.querySelector('#repwd').value) {
                alert('비밀번호가 같지 않습니다.');
                return;
            }

            document.modifyForm.submit();
        }    
    </script>
</body>

</html>