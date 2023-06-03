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
<title>萌芽書屋購物車</title>

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
				<hr/>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4"></div>
					<button type="button" class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4" onlcick="">確認購買</button>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />
	
	<script type="text/javascript">
	// todo (fat): 按鈕動作之後補
	</script>

</body>
</html>