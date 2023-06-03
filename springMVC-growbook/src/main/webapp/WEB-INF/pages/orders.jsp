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
<title>萌芽書屋訂購列表</title>

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
						<li role="presentation" class="active list-group-item-diy"><a href="#unHandle" aria-controls="unHandle" role="tab" data-toggle="tab">待發貨訂單&nbsp;<span class="badge" id="unHandleCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a href="#transport" aria-controls="transport" role="tab" data-toggle="tab">運輸中訂單&nbsp;<span class="badge" id="transportCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a href="#receive" aria-controls="receive" role="tab" data-toggle="tab">已收貨訂單&nbsp;<span class="badge" id="receiveCount">0</span></a></li>
						<li role="presentation" class="list-group-item-diy"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部訂單&nbsp;<span class="badge" id="allCount">0</span></a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="unHandle">
							<table class="table table-hover center" id="unHandleTable"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="transport">
							<table class="table table-hover center" id="transportTable"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="receive">
							<table class="table table-hover center" id="receive"></table>
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
// TODO 動作之後補
	</script>

</body>
</html>