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
							<h2 class="heading-2">loginForm</h2>
							<form action="loginC">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_id">id</label>
										<input type="text" name="c_id" id="c_id" class="form-control" placeholder="Your id" required="required" autofocus="autofocus">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password">password</label>
										<input type="password" name="c_password" id="c_password" class="form-control" placeholder="Your password" required="required">
									</div>
								</div>
								<div class="form-group" style="text-align: center;">
									<input type="submit" value="Confirm" class="btn btn-primary">
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

