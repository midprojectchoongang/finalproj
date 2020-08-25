<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function chk() {
		if (frm.c_password.value != frm.c_password2.value) {
			alert("password check");
			frm.c_password.focus();
			frm.c_password.value = "";
			frm.c_password2.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container">
			<div class="container">
				<div class="col-md-12">
					<div class="row">
							<h2 class="heading-2">updateForm</h2>
							<form action="updateC" method="post" name="frm" onsubmit="return chk()">
							<input type="hidden" name="c_id" value="${customerdto.c_id }">								
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password">password</label>
										<input type="password" name="c_password" id="c_password" class="form-control" placeholder="${customerdto.c_password }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${customerdto.c_password }'">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password2">password confirm</label>
										<input type="password" name="c_password2" id="c_password2" class="form-control" placeholder="Your password confirm" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="nickname">nickname</label>
										<input type="text" name="nickname" id="nickname" class="form-control" placeholder="${customerdto.nickname }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${customerdto.nickname }'">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="subject">email</label>
										<input type="email" name="email" id="email" class="form-control" placeholder="${customerdto.email }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${customerdto.email }'">
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

