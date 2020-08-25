<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function idChk() {
		if (!frm.c_id.value) {
			alert("id check");
			frm.c_id.focus();
			return false;
		}
		$.post('idChk', 'c_id=' + frm.c_id.value, function(data) {
			$('#disp').html(data);
		});
	}
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
							<h2 class="heading-2">회원정보 입력</h2>
							<form action="join" method="post" name="frm" onsubmit="return chk()">
								<div class="row form-group">
									<div class="col-md-12">
										<input type="text" name="c_id" id="c_id" class="form-control" placeholder="아이디" required="required" autofocus="autofocus">
										<input type="button" onclick="idChk()" value="IdCheck">
										<span id="disp" class="err"></span>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<input type="password" name="c_password" id="c_password" class="form-control" placeholder="비밀번호" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<input type="password" name="c_password2" id="c_password2" class="form-control" placeholder="비밀번호 확인" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<input type="text" name="nickname" id="nickname" class="form-control" placeholder="별명" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<input type="email" name="email" id="email" class="form-control" placeholder="메일주소" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<input type="text" name="hashtag" id="hashtag" class="form-control" placeholder="#HASH">
									</div>
								</div>
								<div class="form-group" style="text-align: center;">
									<input type="submit" value="가입하기" class="btn btn-primary">
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

