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

<title>萌芽書屋購物車</title>
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
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
				<div class="jumbotron">
					<h1>歡迎來到購物車</h1>
					<p>您的購物車清單為</p>
				</div>
			</div>
			<div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
				<table class="table table-havor center" id="cartTable"></table>
				<hr />
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4"></div>
					<button type="button"
						class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4"
						onclick="confirmPre()">確認購買</button>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		updateCarts();

		function updateCarts() {
			var cartTable = document.getElementById("cartTable");
			var allCarts = getCarts();
			cartTable.innerHTML = "";
			var html = '<tr>'+
						'<th>是否購買</th>'+
						'<th>商品名稱</th>'+
						'<th>商品單價</th>'+
						'<th>商品數量</th>'+
						'</tr>';
			for (var i = 0; i < allCarts.length; i++) {
				var product = getProductById(allCarts[i].productId);
				html += '<tr>'+
						'<td>'+
						'<div class="checkbox">'+
						'<label>'+
						'<input type="checkbox" id="checkbox'+allCarts[i].productId+'" value="option1">'+
						'</label>'+
						'</div>'+
						'</td>'+
						'<td>'+product.name+'</td>'+
						'<td>'+product.price+'</td>'+
						'<td>'+allCarts[i].counts+'</td>'+
						'</tr>';
				}
			cartTable.innerHTML += html;
			}

		function getCarts() {
			judgeIsLogin();
			var cartProducts = "";
			var user = {};
			user.userId = ${currentUser.id};
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getCarts',
				data : user,
				dataType : 'json',
				success : function(result) {
					cartProducts = result.result;
					},
				error : function(result) {
					layer.alert('購物車查詢錯誤')
					}
				});
			cartProducts = eval("("+cartProducts+")");
			return cartProducts;
			}

		function confirmPre() {
			var allCarts = getCarts();
			var buyProducts = new Array;
			var buyProductsCounts = new Array;
			var buyCounts = 0;
			for (var i = 0; i < allCarts.length; i++) {
				var checkBox = document.getElementById("checkbox"+allCarts[i].productId);
				if (checkBox.checked) {
					buyProducts[buyCounts] = allCarts[i].productId;
					buyProductsCounts[buyCounts] = allCarts[i].counts;
					buyCounts++;
					}
				}
			if (buyCounts == 0) {
				layer.msg("未選中商品",{icon:2});
			} else {
				buyConfirm(buyProducts, buyProductsCounts);
			}
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
					layer.alert('獲取購物清單錯誤');
					}
				});
			productResult = JSON.parse(productResult);
			return productResult;
			}

		function judgeIsLogin() {
			if("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" =="") {
				window.location.href = "${cp}/login";
				}
			}

		function buyConfirm(productsId, productsCounts) {
			var address = getUserAddress(${currentUser.id});
			var phoneNumber = getUserPhoneNumber(${currentUser.id});
			var totalPrice = 0;

			var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
					'<div class="col-sm-10 col-md-10 col-lg-10">'+
					'<table class="taable confirm-margin">';
			for (var i = 0; i < productsId.length; i++) {
				var product = getProductById(productsId[i]);
				html += '<tr>'+
					'<th>商品'+(i+1)+'名稱：</th>'+
					'<td>'+product.name+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>商品單價：</th>'+
					'<td>'+product.price+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>購買數量：</th>'+
					'<td>'+productsCounts[i]+'</td>'+
					'</tr>'+
					'<tr>';
				totalPrice+=product.price*productsCounts[i];
				}
			html +='<th>總金額：</th>'+
					'<td>'+totalPrice+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>收貨地址：</th>'+
					'<td>'+address+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>聯絡電話：</th>'+
					'<td>'+phoneNumber+'</td>'+
					'</tr>'+
					'</table>'+
					'<div class="row">'+
					'<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
					'<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToOrdersPre(['+productsId+'],['+productsCounts+'])">確認購買</button>'+
					'</div>'+
					'</div>';
			layer.open({
				type:1,
				title:'請確認訂單資訊：',
				content:html,
				area:['650px','350px'],
				});
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

		function addToOrdersPre(productsId, productsCounts) {
			for(var i = 0; i < productsId.length; i++){
				addToOrders(productsId[i],productsCounts[i]);
				}
			layer.confirm('前往訂單狀態？', {icon:1, title:'購買成功',btn:['前往訂單','繼續購買']},
					function(){
						window.location.href = "{cp}/order";
					},
					function(index){
						window.location.href = "${cp}/cart";
					}
				);
			}

		function addToOrders(productId, productCounts) {
			judgeIsLogin();
			var order = {};
			order.userId = ${currentUser.id};
			order.productId = productId;
			order.counts = productCounts;
			var buyResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/addCart',
				data : order,
				dataType : 'json',
				success : function(result) {
					buyResult = result.result;
					},
				error : function(result) {
					layer.alert('加入訂單錯誤');
					}
				});
			var product = getProductById(productId);
			if(buyResult == "success") {
				deleteCart(productId);
				layer.msg("商品 "+product.name+" 購買成功",{icon:1});
			} else if(buyResult =="unEnough") {
				layer.alert("商品 "+poduct.name+" 庫存不足，購買失敗");
				}
			}

		function deleteCart(productId) {
			var cart = {};
			cart.userId = ${currentUser.id};
			cart.productId = productId;
			var deleteResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/deleteCart',
				data : cart,
				dataType : 'json',
				success : function(result) {
					deleteResult = result.result;
					},
				error : function(result) {
					layer.alert('購物車刪除錯誤');
					}
				});
			}
	</script>

</body>
</html>