<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" scope="page" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-VA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>萌芽書屋</title>
<link rel="stylesheet" type="text/css" href="${cp}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${cp}/css/style.css" />

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/ajaxfileupload.js"></script>
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
				<ul class="nav nav-sidebar-">
					<li class="list-group-item-diy"><a href="#section1">查看所有用戶<span
							class="sr-only">(current)</span></a></li>
					<li class="list-group-item-diy"><a href="#section2">查看所有商品</a></li>
					<li class="list-group-item-diy"><a href="#section3">添加商品</a></li>
				</ul>
			</div>


			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="col-md-12">
					<h1>
						<a name="section1">用戶訊息</a>
					</h1>
					<hr />
					<table class="table table-hover center" id="userTable">
					</table>
				</div>
				<div class="col-md-12">
					<h1>
						<a name="section2">商品訊息</a>
					</h1>
					<hr />
					<div class="col-lg-12 col-md-12 col-sm-12" id="productArea">
					</div>
					<br />
				</div>
				<div class="col-md-12">
					<h1>
						<a name="section3">添加商品</a>
					</h1>
					<hr />
					<div class="col-sm-offset-2 col-md-offset-2">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="productName" class="col-sm-2 col-md-2 control-label">商品名稱</label>
								<div class="col-sm-6 col-md-6">
									<input type="text" class="form-control" id="productName"
										placeholder="充電器" />
								</div>
							</div>
							<div class="form-group">
								<label for="productName" class="col-sm-2 col-md-2 control-label">作者</label>
								<div class="col-sm-6 col-md-6">
									<input type="text" class="form-control" id="author"
										placeholder="台灣製造"></input>
								</div>
							</div>
							<div class="form-group">
								<label for="productDescribe"
									class="col-sm-2 col-md-2 control-label">商品描述</label>
								<div class="col-sm-6 col-md-6">
									<textarea type="text" class="form-control" id="productDescribe"
										placeholder="手機的生命線"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="keyWord" class="col-sm-2 col-md-2 control-label">關鍵字</label>
								<div class="col-sm-6 col-md-6">
									<textarea type="text" class="form-control" id="keyWord"
										placeholder="充電"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="productPrice"
									class="col-sm-2 col-md-2 control-label">商品價格</label>
								<div class="col-sm-6 col-md-6">
									<input type="text" class="form-control" id="productPrice"
										placeholder="300" />
								</div>
							</div>
							<div class="form-group">
								<label for="productCount"
									class="col-sm-2 col-md-2 control-label">商品數量</label>
								<div class="col-sm-6 col-md-6">
									<input type="text" class="form-control" id="productCount"
										placeholder="100" />
								</div>
							</div>
							<div class="form-group">
								<label for="productType" class="col-sm-2 col-md-2 control-label">商品類別</label>
								<div class="col-sm-6 col-md-6">
									<select name="productType" class="form-control"
										id="productType">
										<option value="1">心理學</option>
										<option value="2">小說</option>
										<option value="3">其他</option>
									</select>
								</div>
							</div>
							<form class="form-group" enctype="multipart/form-data">
                                <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" accept="img/jpg">商品圖片</label>
                                <div class="col-sm-6 col-md-6">
                                    <input name="productImgUpload" type="file" id="productImgUpload"/>
                                    <p class="help-block">上傳的圖片大小應為300*400大小</p>
								</div>
							</form>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-6">
									<button type="submit" class="btn btn-lg btn-primary btn-block"
										onclick="addProduct()">添加商品</button>
								</div>
							</div>
						</div>
						<br />
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="parts/foot.jsp" />

	<script type="text/javascript">
		var loading = layer.load(0);
		listAllUser();
		listAllProduct();
		layer.close(loading);

		// 列出所有使用者
		function listAllUser() {
			var userTable = document.getElementById("userTable");
			var allUser = getAllUsers();
			userTable.innerHTML = '<tr>' + '<th> 用戶ID </th>'
					+ '<th> 用戶名稱 </th>' + '<th> 用戶暱稱 </th>'
					+ '<th> Email </th>' + '<th> 是否刪除 </th>' + '</tr>';
			var html = "";
			for (var i = 0; i < allUser.length; i++) {
				html += '<tr>'+
						'<td>'+allUser[i].id+'</td>'+
						'<td>'+allUser[i].username+'</td>'+
						'<td>'+allUser[i].nickName+'</td>'+
						'<td>'+allUser[i].email+'</td>'+
						'<td>'+
						'<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser('+allUser[i].id+')">刪除</button>'+
						'</td>'+
						'</tr>';
			}
			userTable.innerHTML += html;
		}

		function getAllUsers() {
			var allUsers = "";
			var nothing = {};
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/getAllUser',
				data : nothing,
				dataType : 'json',
				success : function(result) {
					if (result!=null) {
						allUsers = result.allUsers;
					} else {
						layer.alert('查詢所有用戶錯誤');
					}
				},
				error : function(result) {
					layer.alert('查詢所有用戶error');
				}
			});
			allUsers = eval("("+allUsers+")");
			return allUsers;
		}

		function listAllProduct() {
			var productArea = document.getElementById("productArea");
			var allProduct = getAllProducts();
			var html = "";
			productArea.innerHTML = '';
			for (var i = 0; i < allProduct.length; i++) {
				var imgURL = "${cp}/img/" + allProduct[i].id + ".jpg";
				html += '<div class="col-sm-4 col-md-4 pd-5">'+
						'<div class="boxes">'+
						'<div class="big bigimg">'+
						'<img src="'+imgURL+'">'+
						'</div>'+
						'<p class="font-styles center">'+allProduct[i].name+'</p>'+
						'<p class="font-styles center">'+allProduct[i].author+'</p>'+
						'<p class="pull-right">價格：'+allProduct[i].price+'</p>'+
						'<p class="pull-left">庫存：'+allProduct[i].counts+'</p>'+
						'<div class = "row">'+
						'<button class="btn btn-primary delete-button" type="submit" onclick="deleteProduct('+allProduct[i].id+')">刪除商品</button>'+
						'</div>'+
						'</div>'+
						'</div>';
			}
			productArea.innerHTML += html;
		}

		// 列出所有商品
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
						layer.alert('查詢所有商品錯誤');
					}
				},
				error : function(result) {
					layer.alert('查詢所有商品error');
				}
			});
			allProducts = eval("(" + allProducts + ")");
			return allProducts;
		}

		function deleteUser(id) {
	         var user = {};
	         user.id = id;
	         var deleteResult = "";
	         $.ajax({
	             async : false,
	             type : 'POST',
	             url : '${cp}/deleteUser',
	             data : user,
	             dataType : 'json',
	             success : function(result) {
	                 deleteResult = result;
	             },
	             error : function(result) {
	                 layer.alert('刪除用戶錯誤');
	             }
	         });
	         layer.msg(deleteResult.message);
	         listAllUser();
	     }

		function deleteProduct(id) {
			var product = {};
			product.id = id;
			var deleteResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/deleteProduct',
				data : product,
				dataType : 'json',
				success : function(result) {
					deleteResult = result;
				},
				error : function(result) {
					layer.alert('刪除商品錯誤');
				}
			});
			layer.msg(deleteResult.message);
			listAllProduct();
		}

		function addProduct() {
			var loadings = layer.load(0);
			var product = {};
			product.name = document.getElementById("productName").value;
			product.author = document.getElementById("author").value;
			product.description = document.getElementById("productDescribe").value;
			product.keyWord = document.getElementById("keyWord").value;
			product.price = document.getElementById("productPrice").value;
			product.counts = document.getElementById("productCount").value;
			product.type = document.getElementById("productType").value;
			var addResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/addProduct',
				data : product,
				dataType : 'json',
				success : function(result) {
					addResult = result.result;
				},
				error : function(result) {
					layer.alert('添加商品錯誤');
				}
			});
			if (addResult == "success") {
				fileUpload();
				layer.msg('添加商品成功', {
					icon : 1,
					time : 1000
				});
				layer.close(loadings);
			}
			listAllProduct();
		}

		function fileUpload() {
	          var results = "";
	          var name = document.getElementById("productName").value;
	          $.ajax({
	              url:'${cp}/uploadFile?name='+name,
	              secureuri:false ,
	              fileElementId:'productImgUpload',
	              type:'POST',
	              dataType : 'text',
	              success: function (result){
	                  result = result.replace(/<pre.*?>/g, '');
	                  result = result.replace(/<PRE.*?>/g, '');
	                  result = result.replace("<PRE>", '');
	                  result = result.replace("</PRE>", '');
	                  result = result.replace("<pre>", '');
	                  result = result.replace("</pre>", '');
	                  result = JSON.parse(result);
	                  results = result.result;
	                  if(results == "success") {
	                      layer.msg("圖片上傳成功", {icon: 1});
	                      window.location.href = "${cp}/control";
	                  }
	                  else {
	                      layer.msg("圖片上傳失敗", {icon: 0});
	                  }

	              },
	              error: function ()
	              {
	                  layer.alert("圖片上傳錯誤");
	              }}
	          );
		}
	</script>
</body>
</html>