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
		<h1 class="title center">修改個人資料</h1>
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
						<label class="radio-inline"> <input type="radio" name="gender" id="man"
							value="man">男
						</label> <label class="radio-inline"> <input type="radio" name="gender" id="woman"
							value="woman">女
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
							onclick="startUpdate()">確認修改</button>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		initData();
		function initData() {
			var userId = ${currentUser.id};
			var user = getUserById(userId);
			var userDetail = getUserDetailById(userId);
			document.getElementById("inputUsername").value = user.username;
			document.getElementById("inputEmail").value = user.email;
			document.getElementById("inputNickname").value = user.nickName;
			document.getElementById("inputPassword").value = userDetail.password;
			document.getElementById("inputPhoneNumber").value = userDetail.phoneNumber;
			document.getElementById("inputBirthday").value = userDetail.birthday;
			document.getElementById("inputPostcodes").value = userDetail.postNumber;
			document.getElementById("inputAddress").value = userDetail.address;
			if (userDetail.gender == 0) {
				document.getElementById("man").checked = true;
			} else {
				document.getElementById("woman").checked = true;
			}
		}

		function startUpdate() {
			var loading = layer.load(0);
			var user = {};
			user.username = document.getElementById("inputUsername").value;
			user.email = document.getElementById("inputEmail").value;
			user.nickName = document.getElementById("inputNickname").value;
			user.password = document.getElementById("inputPassword").value;
			user.phoneNumber = document.getElementById("inputPhoneNumber").value;
			user.birthday = document.getElementById("inputBirthday").value;
			user.postNumber = document.getElementById("inputPostcodes").value;
			user.address = document.getElementById("inputAddress").value;
			user.gender = 0;
			if (document.getElementById("woman").checked) {
				user.gender = 1;
			} else {
				user.gender =0;
				}
			if (user.username == '') {
				layer.msg('用戶名稱不能為空', {
					icon : 2
				});
				return;
			} else if (user.username.length >= 12) {
				layer.msg('用戶名稱不能超過12個字母', {
					icon : 2
				});
				return;
			}
			if (user.nickName == '') {
				layer.msg('暱稱不能為空', {
					icon : 2
				});
				return;
			} else if (user.nickName.length >= 15) {
				layer.msg('暱稱不能超過15個字', {
					icon : 2
				});
				return;
			} else if (user.password == '') {
				layer.msg('密碼不能為空', {
					icon : 2
				});
				return;
			} else if (user.password.length >= 20) {
				layer.msg('密碼長度不能超過20個字母', {
					icon : 2
				});
				return;
			}
			var registerResult = null;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/doUpdate',
				data : user,
				dataType : 'json',
				success : function(result) {
					registerResult = result.result;
				},
				error : function(result) {
					layer.alert('修改功能錯誤');
				}
			});
			if (registerResult == 'success') {
				layer.close(loading);
				layer.msg('修改成功', {
					icon : 1
				});
				window.location.href = "${cp}/index";
			} else if (registerResult == 'fail') {
				layer.msg('伺服器異常', {
					icon : 2
				});
			}
		}

		function getUserById(id) {
			var userResult = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getUserById',
				data : user,
				dataType : 'json',
				success : function(result) {
					userResult = result.result;
				},
				error : function(result) {
					layer.alert('userId查詢錯誤');
				}
			});
			userResult = JSON.parse(userResult);
			return userResult;
		}

		function getUserDetailById(id) {
			var userDetailResult = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getUserDetailById',
				data : user,
				dataType : 'json',
				success : function(result) {
					userDetailResult = result.result;
				},
				error : function(result) {
					layer.alert('userDetail查詢錯誤');
				}
			});
			userDetailResult = JSON.parse(userDetailResult);
			return userDetailResult;
		}
	</script>

</body>
</html>