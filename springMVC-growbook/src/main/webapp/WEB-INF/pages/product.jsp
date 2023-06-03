<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
				<img class="detail-img" src="${cp}/img/${product.id}.jpg">
			</div>
			<div class="col-sm-5 col-md-5 detail-x">
				<table class="table table-striped">
					<tr>
						<th>商品名稱</th>
						<th>${product.name}</th>
					</tr>
					<tr>
						<th>商品價格</th>
						<th>${product.price}</th>
					</tr>
					<tr>
						<th>商品描述</th>
						<th>${product.description}</th>
					</tr>
					<tr>
						<th>商品類別</th>
						<th>${product.type}</th>
					</tr>
					<tr>
						<th>商品庫存</th>
						<th>${product.counts}</th>
					</tr>
					<tr>
						<th>商品數量</th>
						<td>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default" onclick="">-</button>
								<button id="productCounts" type="button" class="btn btn-default">1</button>
								<button type="button" class="btn btn-default" onclick="">+</button>
							</div>
						</td>
					</tr>
				</table>
				<div class="row">
					<div class="col-sm-1 col-md-1 col-lg-1"></div>
					<button class="btn btn-danger btn-lg col-sm-4 col-lg-4" onclick="">添加購物車</button>
					<div class="col-sm-2 col-md-1 col-lg-2"></div>
					<button class="btn btn-danger btn-lg col-sm-4 col-lg-4" onclick="">購買</button>
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
		// TODO 動作之後補
	</script>
</body>
</html>