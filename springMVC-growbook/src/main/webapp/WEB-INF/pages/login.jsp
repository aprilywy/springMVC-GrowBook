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
<link rel="stylesheet" type="text/css" href="${cp}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${cp}/css/style.css" />
<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${cp}/js/bootpag.min.js"></script>
<script type="text/javascript" src="${cp}/js/layer.js"></script>
<!-- [if lt IE 9] -->
<script type="text/javascript" src="${cp}/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${cp}/js/respond.min.js"></script>
<!-- [endif] -->
</head>
<body>
	<!-- navbar -->
	<jsp:include page="parts/header.jsp" />
	<!-- content -->
	<div class="container-fluid"
		style="padding-top: 80px; padding-bottom: 80px">
		<h1 class="title center">會員登入</h1>
		<br />
		<div class="col-sm-offset-2 col-md-offset-2">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 col-md-2 control-label">帳號/電子信箱</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="xxxxx@xx.com" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 col-md-2 ocntrol-lebal">密碼</label>
					<div class="col-sm-6 col-md-6">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="請輸入密碼" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-md-6">
						<button class="btn btn-lg btn-primary btn-block" type="submit"
							onclick="startLogin()">登入</button>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		function startLogin() {
			var loading = layer.load(0);
			var user = {};
			var loginResult = "";
			user.usernameOrEmail = document.getElementById("inputEmail").value;
			user.password = document.getElementById("inputPassword").value;

			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/doLogin',
				data : user,
				dataType : 'json',
				success : function(result) {
					loginResult = result.result;
					layer.close(loading);
				},
				error : function(result) {
					layer.alert('搜尋用戶錯誤');
				}
			});
			if (loginResult == 'success') {
				layer.msg('登入成功', {
					icon : 1
				});
				window.location.href = "${cp}/index";
			} else if (loginResult == 'nameExist') {
				layer.msg('是不是帳號記錯了', {
					icon : 2
				});
			} else if (loginResult == 'wrong') {
				layer.msg('密碼不是這個唷', {
					icon : 2
				});
			} else if (loginResult == 'fail') {
				layer.msg('伺服器異常', {
					icon : 2
				});
			}
		}
	</script>

</body>
</html>