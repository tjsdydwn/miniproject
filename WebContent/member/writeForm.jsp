<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="/miniproject/member/write.do" method="post" id="form-write">
    <input type="hidden" name="checkedId" id="checkedId" value="false">
    <table class="table">
        <thead class="thead-dark text-center">
            <tr>
                <th colspan="2" scope="col">회원가입</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">이름<span class="text-muted small">(필수)</span></th>
                <td>
                    <div class="input-group">
                        <input type="text" id="name" name="name" class="form-control">
                        <div class="invalid-tooltip">이름을 입력해주세요.</div>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">아이디<span class="text-muted small">(필수)</span></th>
                <td>
                    <div class="input-group">
                        <input type="text" name="id" id="id" class="form-control">
                        <div class="invalid-tooltip">ID입력 및 확인을 진행해주세요.</div>
                        <button type="button" id="btnCheckId" class="btn btn-secondary input-group-append">ID확인</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">비밀번호<span class="text-muted small">(필수)</span></th>
                <td>
                    <div class="input-group">
                        <input type="password" name="pwd" id="pwd" class="form-control">
                        <div class="invalid-tooltip">비밀번호를 입력해주세요.</div>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">비밀번호 재확인<span class="text-muted small">(필수)</span></th>
                <td class="input-group">
                    <div class="input-group">
                        <input type="password" name="repwd" id="repwd" class="form-control">
                        <div class="invalid-tooltip">동일한 비밀번호를 입력해주세요.</div>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">성별<span class="text-muted small">(필수)</span></th>
                <td>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="0" class="form-check-input" checked>
                        <label class="form-check-label">남</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="1" class="form-check-input">
                        <label class="form-check-label">여</label>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">이메일</th>
                <td>
                    <div class="input-group">
                        <input type="text" id="email1" name="email1" class="form-control">
                        <label class="form-text ml-2 mr-2">@</label>
                        <input type="text" id="email2" name="email2" class="form-control" list="email-list">
                        <datalist id="email-list">
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                        </datalist>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">휴대폰</th>
                <td>
                    <div class="input-group">
                        <select name="tel1" id="tel1" class="form-control">
                            <option value="010">010</option>
                            <option value="011">011</option>
                        </select> <input type="text" name="tel2" id="tel2" class="form-control">
                        <input type="text" name="tel3" id="tel3" class="form-control">
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">우편번호</th>
                <td>
                    <div class="input-group">
                        <input type="text" name="zipcode" id="zipcode" readonly class="form-control">
                        <button id="btn-zipcode" type="button" class="btn btn-secondary input-group-append">우편번호검색</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td>
                    <div class="input-group">
                        <input type="text" placeholder="주소" name="addr1" class="form-control" id="addr1">
                    </div>
                    <div class="input-group">
                        <input type="text" placeholder="상세주소" name="addr2" class="form-control" id="addr2">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <button id="btn-submit" type="button" class="btn btn-secondary">회원가입</button>
                    <button type="reset" class="btn btn-secondary">다시 작성</button>
                </td>
            </tr>
        </tbody>
    </table>
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>