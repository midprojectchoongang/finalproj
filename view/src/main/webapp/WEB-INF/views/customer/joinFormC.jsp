<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	var chk = "";
	function idChk() {
		if ($('#c_id').val() == "") {
			$('#idDisp').html("");
			return;
		}
		var c_id = $('#c_id').val();
		$.ajax({
			url : 'idChk',
			type : 'post',
			data : {
				c_id : c_id
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					$('#idDisp').html("<b>사용 가능한 ID입니다</b>");
					chk = "y";
				} else {
					$('#idDisp').html("<b>이미 존재하는 ID입니다</b>");
					chk = "n";
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	function nickChk() {
		if ($('#nickname').val() == "") {
			$('#nickDisp').html("");
			return;
		}
		var nickname = $('#nickname').val();
		$.ajax({
			url : 'nickChk',
			type : 'post',
			data : {
				nickname : nickname
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					$('#nickDisp').html("<b>사용 가능한 닉네임입니다</b>");
					chk = "y";
				} else {
					$('#nickDisp').html("<b>이미 존재하는 닉네임입니다</b>");
					chk = "n";
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	function passwordChk() {
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
							<h2 class="heading-2">joinForm</h2>
							<form action="joinC" method="post" name="frm" onsubmit="return passwordChk()">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_id">id</label>
										<input type="text" name="c_id" id="c_id" class="form-control" placeholder="Your id" required="required" autofocus="autofocus"
										onkeyup="idChk()">
									</div>								
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<div id="idDisp"></div>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password">password</label>
										<input type="password" name="c_password" id="c_password" class="form-control" placeholder="Your password" required="required">
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
										<input type="text" name="nickname" id="nickname" class="form-control" placeholder="Your nickname" required="required"
										onkeyup="nickChk()">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<div id="nickDisp"></div>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="subject">email</label>
										<input type="email" name="email" id="email" class="form-control" placeholder="Your email" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="hashtag">hashtag</label>
										<input type="text" name="hashtag" id="hashtag" class="form-control" placeholder="Your hashtag">
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

