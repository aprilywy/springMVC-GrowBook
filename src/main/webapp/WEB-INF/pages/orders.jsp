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
<title>萌芽書屋訂購列表</title>
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
	<div class="container-fluid bigHead">
		<div class="row">
			<div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
				<div class="jumbotron">
					<h1>歡迎來到訂單頁面</h1>
					<p>您目前所有的訂單狀態如下</p>
				</div>
			</div>
			<div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
				<div class="row">
					<ul class="nav nav-tabs list-group-diy" role="tablist">
						<li role="presentation" class="active list-group-item-diy"><a
							href="#unHandle" aria-controls="unHandle" role="tab"
							data-toggle="tab">待發貨訂單&nbsp;<span class="badge"
								id="unHandleCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#transport" aria-controls="transport" role="tab"
							data-toggle="tab">運輸中訂單&nbsp;<span class="badge"
								id="transportCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#receive" aria-controls="receive" role="tab"
							data-toggle="tab">已收貨訂單&nbsp;<span class="badge"
								id="receiveCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a
							href="#all" aria-controls="all" role="tab" data-toggle="tab">全部訂單&nbsp;<span
								class="badge" id="allCount">0</span></a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="unHandle">
							<table class="table table-hover center" id="unHandleTable"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="transport">
							<table class="table table-hover center" id="transportTable"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="receive">
							<table class="table table-hover center" id="receiveTable"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="all">
							<table class="table table-hover center" id="allTable"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		var loading = layer.load(0);
		updateOrders();

		function updateOrders() {
			var orderArray = new Array;
			orderArray[0] = "未出貨";
			orderArray[1] = "配送中";
			orderArray[2] = "已收貨";
			var unHandleTable = document.getElementById("unHandleTable");
			var transportTable = document.getElementById("transportTable");
			var receiveTable = document.getElementById("receiveTable");
			var allTable = document.getElementById("allTable");

			var unHandleCount = document.getElementById("unHandleCount");
			var transportCount = document.getElementById("transportCount");
			var receiveCount = document.getElementById("receiveCount");
			var allCount = document.getElementById("allCount");

			var unHandleCounts = parseInt(unHandleCount.innerHTML);
			var transportCounts = parseInt(transportCount.innerHTML);
			var receiveCounts = parseInt(receiveCount.innerHTML);
			var allCounts = parseInt(allCount.innerHTML);

			var allOrders = getAllOrders();
			unHandleTable.innerHTML = "";
			transportTable.innerHTML = "";
			receiveTable.innerHTML = "";
			allTable.innerHTML = "";
			var unHandleHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>付款金額</th>' + '<th>訂單狀態</th>' + '</tr>';
			var transportHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>付款金額</th>' + '<th>配送地址</th>' + '<th>聯絡電話</th>'
					+ '<th>訂單狀態</th>' + '<th>確認收貨</th>' + '</tr>';
			var receiveHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>付款金額</th>' + '<th>訂單狀態</th>' + '<th>評價</th>'
					+ '</tr>';
			var allHTML = '<tr>' + '<th>商品名稱</th>' + '<th>購買數量</th>'
					+ '<th>付款金額</th>' + '<th>訂單狀態</th>' + '</tr>';
			var unHandleHTMLTemp = "";
			var transportHTMLTemp = "";
			var receiveHTMLTemp = "";
			var allHTMLTemp = "";

			for (var i = 0; i < allOrders.length; i++) {
				var product = getProductById(allOrders[i].productId);
				allHTMLTemp += '<tr>' + '<td>' + prodcut.name + '</td>'
						+ '<td>' + allOrders[i].counts + '</td>' + '<td>'
						+ allOrders[i].productPrice + '</td>' + '<td>'
						+ orderArray[allOrders[i].orderStatus] + '</td>'
						+ '</tr>';
				allCounts++;
				if (allOrders[i].orderStatus == 0) {
					unHandleHTMLTemp += '<tr>' + '<td>' + prodcut.name
							+ '</td>' + '<td>' + allOrders[i].counts + '</td>'
							+ '<td>' + allOrders[i].productPrice + '</td>'
							+ '<td>' + orderArray[allOrders[i].orderStatus]
							+ '</td>' + '</tr>';
					unHandleCounts++;
				} else if (allOrders[i].orderStatus == 1) {
					var address = getUserAddress(allOrders[i].userId);
					var phoneNumber = getUserPhoneNumber(allOrders[i].userId)
					transportHTMLTemp += '<tr>' + '<td>'
							+ prodcut.name
							+ '</td>'
							+ '<td>'
							+ allOrders[i].counts
							+ '</td>'
							+ '<td>'
							+ allOrders[i].productPrice
							+ '</td>'
							+ '<td>'
							+ address
							+ '</td>'
							+ '<td>'
							+ phoneNumber
							+ '</td>'
							+ '<td>'
							+ orderArray[allOrders[i].orderStatus]
							+ '</td>'
							+ '<td>'
							+ '<button class="btn btn=primary btn-sm" onclick="receiveProducts('
							+ allOrders[i].userId + ','
							+ allOrders[i].productId + '.\''
							+ allOrders[i].time + '\')">確認收貨</button>'
							+ '</td>' + '</tr>';
					transportCounts++;
				} else if (allOrders[i].orderStatus == 2) {
					receiveHTMLTemp += '<tr>'
							+ '<td>'
							+ prodcut.name
							+ '</td>'
							+ '<td>'
							+ allOrders[i].counts
							+ '</td>'
							+ '<td>'
							+ allOrders[i].productPrice
							+ '</td>'
							+ '<td>'
							+ orderArray[allOrders[i].orderStatus]
							+ '</td>'
							+ '<td>'
							+ '<button class="btn btn=primary btn-sm" onclick="productDetail('
							+ allOrders[i].productId + ')">評價</button>'
							+ '</td>' + '</tr>';
					receiveCounts++;
				}
			}
			if (unHandleHTMLTemp == "") {
				unHandleHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有相關訂單</h2>' + '</div>' + '</div>';
			} else {
				unHandleHTML += unHandleHTMLTemp;
			}
			if (transportHTMLTemp == "") {
				transportHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有相關訂單</h2>' + '</div>' + '</div>';
			} else {
				transportHTML += transportHTMLTemp;
			}
			if (receiveHTMLTemp == "") {
				recieveHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有相關訂單</h2>' + '</div>' + '</div>';
			} else {
				receiveHTML += receiveHTMLTemp;
			}
			if (allHTMLTemp == "") {
				allHTML = '<div class="row">'
						+ '<div class="col-sm-3 col-md-3 col-lg-3"></div> '
						+ '<div class="col-sm-6 col-md-6 col-lg-6">'
						+ '<h2>沒有相關訂單</h2>' + '</div>' + '</div>';
			} else {
				allHTML += allHTMLTemp;
			}

			unHandleCount.innerHTML = unHandleCounts;
			transportCount.innerHTML = transportCOunts;
			receiveCount.innerHTML = receiveCounts;
			allCount.innerHTML = allCounts;

			unHandleTable.innerHTML += unHandleHTML;
			transportTable.innerHTML += transportHTML;
			receiveTable.innerHTML += receiveHTML;
			allTable.innerHTML += allHTML;
			layer.close(loading);
		}

		function getOrders() {
			judgeIsLogin();
			var orderProducts = "";
			var user = {};
			user.userId = $
			{
				currentUser.id
			}
			;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getOrders',
				data : user,
				dataType : 'json',
				success : function(result) {
					orderProducts = result.result;
				},
				error : function(result) {
					layer.alert('訂單查詢錯誤')
				}
			});
			orderProducts = eval("(" + orderProducts + ")");
			return orderProducts;
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
				daatType : 'json',
				success : function(result) {
					productResult = result.result;
				},
				error : function(result) {
					layer.alert('商品id查詢錯誤')
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
					layer.alert('地址查詢錯誤');
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
					phoneNumber = result.phoneNumber;
				},
				error : function(result) {
					layer.alert('手機查詢錯誤');
				}
			});
			return phoneNumber;
		}

		function judgeIsLogin() {
			if ("${currentUser.id}" == null || "${currentUser.id}" == undefined
					|| "${currentUser.id}" == "") {
				window.location.href = "${cp}/login";
			}
		}

		function receiveProducts(userId, productId, time) {
			var receiveResult = "";
			var order = {};
			order.userId = userId;
			order.productId = productId;
			order.time = time;
			order.orderStatus = 2;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/changeOrder',
				data : order,
				dataType : 'json',
				success : function(result) {
					receiveResult = result.result;
				},
				error : function(result) {
					layer.alert('已收貨商品查詢錯誤')
				}
			});
			if (receiveResult = "success") {
				window.location.href = "${cp}/order";
			}
		}

		function productDetail(id) {
			var product = {};
			var jumpResult = '';
			product.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/product',
				data : product,
				dataType : 'json',
				success : function(result) {
					jumpResult = result.result;
				},
				error : function(result) {
					layer.alert('商品查詢錯誤');
				}
			});

			if (jumpResult == "success") {
				window.location.href = "${cp}/product";
			}
		}
	</script>

</body>
</html>