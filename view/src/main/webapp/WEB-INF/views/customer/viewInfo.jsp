<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container">
			<div class="container">
				<div class="col-md-12">
					<div class="row">
							<h2 class="heading-2">viewInfo</h2>
							<form action="#">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_id">id</label>
										<label>${customer.c_id }</label>											
									</div>
								</div>					
								<div class="row form-group">
									<div class="col-md-12">
										<label for="nickname">nickname</label>	
										<label>${customer.nickname }</label>							
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="subject">email</label>
										<label>${customer.email }</label>										
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="hashtag">hashtag</label>
										<label>${customer.hashtag }</label>									
									</div>
								</div>
								<div class="form-group" style="text-align: center;">
									<a href="loginForm">login</a>
								</div>
							</form>	
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

