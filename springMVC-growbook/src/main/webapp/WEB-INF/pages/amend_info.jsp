<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-VA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>萌芽書屋</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootpag.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<!-- [if lt IE 9] -->
<script type="text/javascript" src="js/html5shiv.min.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<!-- [endif] -->
</head>
<body>
	<!-- navbar -->
	<jsp:include page="parts/header.jsp" />
	<!-- content -->
	<div class="container-fluid">
		<h1 class="title center">註冊</h1>
		<br />
		<div class="col-sm-offset-2 col-md-offset-2">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 col-md-2 control-label">帳號</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputUsername"
							placeholder="請輸入英文與數字" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 col-md-2 control-label">電子信箱</label>
					<div class="col-sm-6 col-md-6">
						<input type="email" class="form-control" id="inputEmail"
							placeholder="請輸入正確的電子信箱格式" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputNickname" class="col-sm-2 col-md-2 ocntrol-lebal">暱稱</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputNickname"
							placeholder="請輸入暱稱" />
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
					<label for="inputPhoneNumber"
						class="col-sm-2 col-md-2 ocntrol-lebal">手機號碼</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputPhoneNumber"
							placeholder="請輸入手機號碼" />
					</div>
				</div>
				<div class="form-group">
					<label for="gender" class="col-sm-2 col-md-2 ocntrol-lebal">性別</label>
					<div class="col-sm-6 col-md-6">
						<label class="radio-inline"> <input type="radio" id="man"
							value="option1">男
						</label> <label class="radio-inline"> <input type="radio" id="man"
							value="option2">女
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirthday" class="col-sm-2 col-md-2 ocntrol-lebal">出生日期</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputBirthday"
							placeholder="請輸入出生日期" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputPostcodes" class="col-sm-2 col-md-2 ocntrol-lebal">郵遞區號</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputPostcodes"
							placeholder="請輸入郵遞區號" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputAddress" class="col-sm-2 col-md-2 ocntrol-lebal">地址</label>
					<div class="col-sm-6 col-md-6">
						<input type="text" class="form-control" id="inputAddress"
							placeholder="請輸入寄送地址" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-md-6">
						<button class="btn btn-lg btn-primary btn-block" type="submit"
							onclick="startRegister()">註冊</button>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		function startRegister() {
			var loading = layer.load(0);
			var user = {};
			user.username = document.getElementById("inputUsername").value;
			user.email = document.getElementById("inputEmail").value;
			user.nickName = document.getElementById("inputNickName").value;
			user.password = document.getElementById("inputPassword").value;
			user.phoneNumber = document.getElementById("inputPhoneNumber").value;
			user.birthday = document.getElementById("inputBirthday").value;
			user.postNumber = document.getElementById("inputPostcodes").value;
			user.address = document.getElementById("inputAddress").value;
			user.gender = 0;
			if (document.getElementById("woman").checked) {
				user.gender = 1;
			}
			if (user.username == '') {
				layer.msg('帳號不能為空', {
					icon : 2
				});
				return;
			} else if (user.username.length >= 12) {
				layer.msg('帳號長度不能超過12個字', {
					icon : 2
				});
				return;
			} else if (user.nickName == '') {
				layer.msg('暱稱不能為空', {
					icon : 2
				});
				return;
			} else if (user.nickName.length >= 15) {
				layer.msg('暱稱長度不能超過15個字', {
					icon : 2
				});
				return;
			} else if (user.password == '') {
				layer.msg('密碼不能為空', {
					icon : 2
				});
				return;
			} else if (user.password.length >= 20) {
				layer.msg('密碼長度不能超過20個字', {
					icon : 2
				});
				return;
			}

			var registerResult = null;

			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/doRegister',
				data : user,
				dataType : 'json',
				success : function(result) {
					registerResult = result.result;
				},
				error : function(result) {
					layer.alert('搜尋用戶錯誤');
				}
			});
			if (registerResult == 'success') {
				layer.close(loading);
				layer.msg('註冊成功', {
					icon : 1
				});
				window.location.href = "${cp}/login";
			} else if (registerResult == 'nameExist') {
				layer.close(loading);
				layer.msg('這個帳號有人使用過了', {
					icon : 2
				});
			} else if (registerResult == 'emailExist') {
				layer.close(loading);
				layer.msg('這個信箱有人使用過了', {
					icon : 2
				});
			} else if (registerResult == 'fail') {
				layer.close(loading);
				layer.msg('伺服器異常', {
					icon : 2
				});
			}
		}
	</script>

</body>
</html>