<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" scope="page" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-VA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>萌芽書屋</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<!--[if lt IE 9]-->
<script type="text/javascript" src="js/html5shiv.min.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<!-- [endif]-->

</head>
<body>
	<div id="title">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<ul class="nav nav-pills justify-content-end">
				<c:if test="${not empty currentUser}">
					<li class="nav-item">
						<div class="p-2 text-dark">${currentUser.nickName}</div>
					</li>
				</c:if>
				<li class="nav-item">
					<div class="p-2 text-dark">歡迎光臨</div>
				</li>
				<li class="nav-item"><a class="p-2" href="${cp}/index">所有商品</a></li>
				<c:if test="${empty currentUser}">
					<li class="nav-item"><a class="p-2" href="${cp}/register"
						method="post">會員註冊</a></li>
					<li class="nav-item"><a class="p-2" href="${cp}/login"
						method="post">會員登入</a></li>
				</c:if>
				<c:if test="${not empty currentUser}">
					<c:if test="${currentUser.role ==1}">
						<li class="nav-item"><a class="p-2" href="${cp}control"
							method="post">控制台</a></li>
					</c:if>
					<li class="nav-item"><a class="p-2" href="${cp}/cart">購物車</a>
					</li>
					<li class="nav-item"><a class="p-2" href="${cp}/order">訂單列表</a>
					</li>
					<c:if test="${currentUser.role == 1}">
						<li class="nav-item"><a class="p-2"
							href="${cp}/shopping_handle">處理訂單</a>
					</c:if>
					<li role="separator" class="divider"></li>
					<li class="nav-item"><a class="p-2" href="${cp}/amend_info">會員資料修改</a>
					</li>
					<li class="nav-item"><a class="p-2" href="${cp}/doLogout">登出</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>