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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar sidebar-1">
				<ul class="nav nav-sidebar">
					<li class="list-group-item-diy"><a href="#productArea1">心理學
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="list-group-item-diy"><a href="#productArea2">小說</a></li>
					<li class="list-group-item-diy"><a href="#productArea3">其他</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="jumbotron">
					<h1>歡迎光臨萌芽書屋</h1>
				</div>
				<div class="row pd-10" id="productArea1"></div>

				<div class="row" id="productArea2"></div>

				<div class="row" id="productArea3"></div>
			</div>

			<!-- footer -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<jsp:include page="parts/foot.jsp" />
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var loading = layer.load(0);

		var productType = new Array;
		productType[1] = "心理學";
		productType[2] = "小說";
		productType[3] = "其他";

		listProducts();

		function listProducts() {
			var allProduct = getAllProducts();
			var mark = new Array;
			mark[1] = 0;
			mark[2] = 0;
			mark[3] = 0;

			for (var i = 0; i < allProduct.length; i++) {
				var html = "";
				var imgURL = "${cp}/img/p" + allProduct[i].id + ".jpg";
				html += '<div class="col-sm-4 col-md-4" >'
						+ '<div class="boxes pointer" onclick="productDetail('
						+ allProduct[i].id + ')">' + '<div class="big bigimg">'
						+ '<img src="'+imgURL+'">' + '</div>'
						+ '<p class="product-name">' + allProduct[i].name
						+ '</p>' + '<p class="product-price">$'
						+ allProduct[i].price + '</p>' + '</div>' + '</div>';
				var id = "productArea" + allProduct[i].type;
				var productArea = document.getElementById(id);
				if (mark[allProduct[i].type] == 0) {
					html = '<hr/><h1>' + productType[allProduct[i].type]
							+ '</h1><hr/>' + html;
					mark[allProduct[i].type] = 1;
				}
				productArea.innerHTML += html;
			}
			layer.close(loading);
		}

		function getAllProducts() {
			var allProducts = null;
			var nothing = {};
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getAllProducts',
				data : nothing,
				dataType : 'json',
				success : function(result) {
					if (result != null) {
						allProducts = result.allProducts;
					} else {
						layer.alert('查詢AllProducts()錯誤');
					}
				},
				error : function(result) {
					layer.alert('查詢getAllProducts()錯誤');
				}
			});
			allProducts = eval("(" + allProducts + ")");
			return allProducts;
		}

		function productDetail(id) {
			var product = {};
			var jumpResult = '';
			product.id = id;
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/productDetail',
				data : product,
				dataType : 'json',
				success : function(result) {
					jumpResult = result.result;
				},
				error : function(result) {
					layer.alert('查詢productDetail(id)錯誤');
				}
			});

			if (jumpResult == "success") {
				window.location.href = "${cp}/product";
			}
		}
	</script>
</body>
</html>