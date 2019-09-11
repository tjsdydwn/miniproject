<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="/miniproject/member/login.do" method="post" id="form-login" style="max-width:500px" class="mx-auto">
    <table class="table">
        <thead class="thead-dark text-center">
            <tr>
                <th colspan="2" scope="col">로그인</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">아이디</th>
                <td><input name="id" id="id" type="text" class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">비밀번호</th>
                <td><input name="pwd" id="pwd" type="password" class="form-control"></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <button id="btn-submit" type="button" class="btn btn-secondary">로그인</button>
                </td>
            </tr>
        </tbody>
    </table>
</form>