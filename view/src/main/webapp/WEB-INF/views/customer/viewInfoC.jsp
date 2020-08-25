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
								<label for="c_id">id</label>
									<div class="col-md-12">																										
										${customerdto.c_id }										
									</div>
								</div>					
								<div class="row form-group">
								<label for="nickname">nickname</label>
									<div class="col-md-12">
										${customerdto.nickname }						
									</div>
								</div>
								<div class="row form-group">
								<label for="subject">email</label>
									<div class="col-md-12">
										${customerdto.email }										
									</div>
								</div>
								<div class="form-group" style="text-align: center;">
									<a href="main">main</a>
									<a href="logoutC">logout</a>
									<a href="updateFormC">update</a>
									<a href="deleteC" onclick="return confirm('really?');">delete</a>						
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

