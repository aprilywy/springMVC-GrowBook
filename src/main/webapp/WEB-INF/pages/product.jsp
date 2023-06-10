<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="page" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-VA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>萌芽書屋商品資訊</title>
<link rel="stylesheet" type="text/css"
	href="${cp}/css/bootstrap.min.css" />
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1 col-md-1"></div>
			<div class="col-sm-10 col-md-10">
				<h1>${productDetail.name}</h1>
				<hr />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1 col-md-1"></div>
			<div class="col-sm-5 col-md-5">
				<img class="detail-img" src="${cp}/img/p${productDetail.id}.jpg">
			</div>
			<div class="col-sm-5 col-md-5 detail-x">
				<table class="table table-striped">
					<tr>
						<th>商品名稱</th>
						<th>${productDetail.name}</th>
					</tr>
					<tr>
						<th>商品價格</th>
						<th>${productDetail.price}</th>
					</tr>
					<tr>
						<th>作者名稱</th>
						<th>${productDetail.author}</th>
					</tr>
					<tr>
						<th>商品描述</th>
						<th>${productDetail.description}</th>
					</tr>
					<tr>
						<th>商品類別</th>
						<th>${productDetail.type}</th>
					</tr>
					<tr>
						<th>商品庫存</th>
						<th>${productDetail.counts}</th>
					</tr>
					<tr>
						<th>商品數量</th>
						<td>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default"
									onclick="subCounts()">-</button>
								<button id="productCounts" type="button" class="btn btn-default">1</button>
								<button type="button" class="btn btn-default"
									onclick="addCounts(1)">+</button>
							</div>
						</td>
					</tr>
				</table>
				<div class="row">
					<div class="col-sm-1 col-md-1 col-lg-1"></div>
					<button class="btn btn-danger btn-lg col-sm-4 col-lg-4"
						onclick="addToCart(${productDetail.id})">添加購物車</button>
					<div class="col-sm-2 col-md-1 col-lg-2"></div>
					<button class="btn btn-danger btn-lg col-sm-4 col-lg-4"
						onclick="buyConfirm(${productDetail.id})">購買</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1 col-md-1 col-lg-1"></div>
			<div class="col-sm-10 col-md-10 col-lg-10">
				<hr class="division" />
				<table class="table evaluationTable" border="0" id="evaluation">
				</table>
				<hr />
				<div id="inputArea"></div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		listEvaluations();

		function addToCart(productId) {
			judgeIsLogin();
			var productCounts = document.getElementById("productCounts");
			var counts = parseInt(productCounts.innerHTML);
			var cart = {};
			cart.userId = "${currentUser.id}";
			cart.productId = productId;
			cart.counts = counts;
			var addResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/addCart',
				data : cart,
				dataType : 'json',
				success : function(result) {
					addResult = result.result;
					},
					error : function(result) {
						layer.alert('查詢用戶錯誤');
						}
				});
				if (addResult == "success") {
					layer.confirm('前往購物車？', {icon: 1, title:'添加成功',btn:['前往購物車','繼續瀏覽']},
							function(){
								window.location.href = "${cp}/cart";
							},
							function(index){
								layer.close(index);
							}
					);
				}
			}

		function judgeIsLogin() {
			if("${currentUser.id}" == null || "${currentUser.id}" === undefined || "${currentUser.id}" ===""){
				window.location.href = "${cp}/login";
				}
			}

		function subCounts() {
			var productCounts = document.getElementById("productCounts");
			var counts = parseInt(productCounts.innerHTML);
			if (counts >= 2) {
				counts--;
				}
			productCounts.innerHTML = counts;
			}

		function addCounts() {
			var productCounts = document.getElementById("productCounts");
			var counts = parseInt(productCounts.innerHTML);
			if(counts < ${productDetail.counts}){
				counts++;
				}
			productCounts.innerHTML = counts;
			}

		function buyConfirm(productId) {
			judgeIsLogin();
			var address = getUserAddress("${currentUser.id}");
			var phoneNumber = getUserPhoneNumber("${currentUser.id}");
			var productCounts = document.getElementById("productCounts");
			var counts = parseInt(productCounts.innerHTML);
			var product = getProductById(productId);
			var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>' +
					'<div class="col-sm-10 col-md-10 col-lg-10">' +
					'<table class="table confirm-margin">' +
					'<tr>' +
					'<th>商品名稱：</th>' +
					'<td>'+product.name+'</td>' +
					'</tr>' +
					'<tr>' +
					'<th>商品單價：</th>' +
					'<th>'+product.price+'</td>' +
					'</tr>' +
					'<tr>' +
					'<th>購買數量：</th>' +
					'<th>'+counts+'</td>' +
					'</tr>' +
					'<tr>' +
					'<th>總金額：</th>' +
					'<th>'+counts*product.price+'</td>' +
					'</tr>' +
					'<tr>' +
					'<th>收貨地址：</th>' +
					'<th>'+address+'</td>' +
					'</tr>' +
					'<tr>' +
					'<th>聯絡電話：</th>' +
					'<th>'+phoneNumber+'</td>' +
					'</tr>' +
					'</table>' +
					'<div class="row">' +
					'<div class="col-sm-4 col-md-4 col-lg-4"></div>' +
					'<button class="btn btn-danger col-sm-4 col-lg-4" onclick="addToOrders('+productId+')">確認購買</button>' +
					'</div>' +
					'</div>';
			layer.open({
				type:1,
				title:'請確認訂單訊息：',
				content:html,
				area:['650px', '350px'],
				});
			}

		function getProductById(id) {
			var productResult = "";
			var product = {};
			product.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getProductById',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
					},
					error : function(result) {
						layer.alert('商品id查詢錯誤');
						}
				});
			productResult = JSON.parse(productResult);
			return productResult;
			}

		function getUserAddress(id) {
			var address = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getUserAddressAndPhoneNumber',
				data : user,
				dataType : 'json',
				success : function(result) {
					address = result.address;
					},
					error : function(result) {
						layer.alert('address查詢錯誤');
						}
				});
			return address;
			}

		function getUserPhoneNumber(id) {
			var phoneNumber = "";
			var user = {};
			user.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getUserAddressAndPhoneNumber',
				data : user,
				dataType : 'json',
				success : function(result) {
					address = result.phoneNumber;
					},
					error : function(result) {
						layer.alert('phoneNumber查詢錯誤');
						}
				});
			return phoneNumber;
			}

		function addToOrders(productId) {
			var productCounts = document.getElementById("productCounts");
			var counts = parseInt(productCounts.innerHTML);
			var order = {};
			order.userId = "${currentUser.id}";
			order.productId = productId;
			order.counts = counts;
			var buyResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/addOrder',
				data : order,
				dataType : 'json',
				success : function(result) {
					buyResult = result.result;
				},
				error : function(result) {
					layer.alert('添加至訂單錯誤');
					}
			});
			if (buyResult === "success") {
				layer.confirm('前往訂單頁面？', {icon: 1, title:'購買成功',btn:['前往訂單','繼續購買']},
						function() {
							window.location.href = "${cp}/order";
							},
							function(index) {
								layer.close(index);
								}
						);
				}
			else if (buyResult === "unEnough") {
				layer.alert("庫存不足，購買失敗")
				}
			}

		function listEvaluations() {
			var evaluations = getEvaluations();
			var evaluationTable = document.getElementById("evaluation");
			var html = "";
			for(var i = 0; i < evaluations.length; i++) {
				var user = getUserById(evaluations[i].userId);
				html +='<tr>' +
						'<th>'+user.nickName+'</th>'+
						'<td>'+evaluations[i].content+'</td>'+
						'</tr>';
				}
			evaluationTable.innerHTML += html;

			if("${currentUser}" !== "" && getUserProductRecord() === "true") {
				var inputArea = document.getElementById("inputArea");
				html= '<div class="col-sm-12 col-md-12 col-lg-12">' +
						'<textarea class="form-control" rows="4" id="evaluationText"></textarea>' +
						'</div>' +
						'<div class="col-sm-12 col-md-12 col-lg-12">' +
						'<div class="col-sm-4 col-md-4 col-lg-4"></div>' +
						'<button class="btn btn-primary btn-lg evaluationButton col-sm-4 col-md-4 col-lg-4" onclick="addToEvaluation()">評價</button>' +
						'</div>';
				inputArea.innerHTML += html;
				}
			}

		function getUserProductRecord() {
			var result = "";
			var product = {};
			product.userId = ${currentUser.id};
			product.productId = ${productDetail.id};
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getUserProductRecord',
				data : product,
				dataType : 'json',
				success : function(result) {
					results = result.result;
					},
					error : function(result) {
						layer.alert('查詢訂單記錄錯誤')
						}
				});
			return results;
			}

		function getEvaluations() {
			var evaluations = "";
			var product = {};
			product.productId = "${productDetail.id}";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getShoppingEvaluation',
				data : product,
				dataType : 'json',
				success : function(result) {
					evaluations = result.result;
					},
				error : function(result) {
					layer.alert('evaluation查詢錯誤');
					}
				});
			evaluations = eval("("+evaluations+")");
			return evaluations;
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
					layer.alert('UserId查詢錯誤')
					}
				});
			userResult = JSON.parse(userResult);
			return userResult;
			}

		function addToEvaluation() {
			var inputText = document.getElementById("evaluationText").value;
			var evaluation = {};
			evaluation.userId = "${currentUser.id}";
			evaluation.productId = "${productDetail.id}";
			evaluation.content = inputText;
			var addResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/addShoppingEvaluation',
				data : evaluation,
				dataType : 'json',
				success : function(result) {
					addResult = result.result;
					},
				error : function(result) {
					layer.alert('查詢用戶錯誤');
					}
				});
			if (addResult = "success") {
				layer.msg("評價成功",{icon:1});
				window.location.href = "${cp}/order"
				}
			}
	
	</script>
</body>
</html>