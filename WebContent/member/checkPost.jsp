<%@ page language = "java" contentType ="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        table {
            border-collapse: collapse;
        }

        td {
            border: 1px solid #000;
            padding: 5px;
            text-align: center;
        }

        .t-title {
            font-weight: bold;
            text-align: center;
        }

        #addressA:link {
            color: red;
        }

        #addressA:visited {
            color: blue;
        }

        #addressA:hover {
            color: purple;
        }

        #addressA:active {
            color: aqua;
        }
    </style>
    <title>주소검색</title>
</head>

<body>
    <form action="/miniproject/member/checkPost.do" method="post">
        <table>
            <tr>
                <td class="t-title">시도</td>
                <td>
                    <select name="sido" id="sido"></select>
                </td>
                <td class="t-title">시, 군, 구</td>
                <td>
                    <input type="text" name="sigungu" id="sigungu">
                </td>
            </tr>
            <tr>
                <td class="t-title">도로명</td>
                <td colspan="3">
                    <input type="text" name="roadname" id="roadname">
                    <button type="submit">검색</button>
                </td>
            </tr>
            <tr>
                <td class="t-title">우편번호</td>
                <td>
                    <input type="text" name="zipcode" id="zipcode">
                </td>
                <td class="t-title">주소</td>
                <td>
                    <input type="text" name="addr2" id="addr2">
                </td>
            </tr>
            <c:forEach var="zipcode" items="${ requestScope.list }">
            <tr>
            	<td>
            		${ zipcode.zipcode }
            	</td>
            	<td colspan="3">
            		<a onclick="checkPostClose('${zipcode.zipcode}', '${zipcode.adress}')"
                        id="addressA" href="">${zipcode.adress}
                    </a>
            	</td>
            </tr>
            </c:forEach>
        </table>
    </form>
    <script src="../js/member.js?ver=2"></script>
    <script>
        let sidos = ['서울', '인천', '대전', '대구', '울산', '세종', '광주', '경기', '강원', '전남', '전북', '경남', '경북', '충남', '충북', '부산',
            '제주'
        ];
        let selSido = document.querySelector('select#sido');
        for (let i = 0; i < sidos.length; i++) {
            let optSido = document.createElement('option');
            optSido.text = sidos[i]
            optSido.value = sidos[i];
            selSido.add(optSido);
        }
    </script>
</body>

</html>