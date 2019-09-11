<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <style>
        .row-selected {
            cursor: pointer;
        }
    </style>
    <title>index.jsp</title>
</head>

<body class="bg-secondary">
    <div class="container">
        <div class="jumbotron bg-white">
            <header class="container mb-3">
                <jsp:include page="../template/top.jsp"></jsp:include>
            </header>
            <section class="container mb-3">
                <div class="row">
                    <div class="left col-sm-3 mb-3">
                        <jsp:include page="../template/left.jsp"></jsp:include>
                    </div>
                    <div class="right col-sm">
                        <jsp:include page="${display}"></jsp:include>
                    </div>
                </div>
            </section>
            <footer class="container">
                <jsp:include page="../template/bottom.jsp"></jsp:include>
            </footer>
        </div>
    </div>
    <script src="../js/formValid.js"></script>
</body>

</html>