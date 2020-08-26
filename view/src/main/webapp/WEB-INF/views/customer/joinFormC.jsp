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
		<script type="text/javascript">
			$(function() {
				var placeholderTarget = $('.formbox input[type="text"], .formbox input[type="password"], .formbox input[type="email"]');
				//포커스시
				placeholderTarget.on('focus', function() {
					$(this).siblings('label').fadeOut('fast');
				});
				//포커스아웃시
				placeholderTarget.on('focusout', function() {
					if ($(this).val() == '') {
						$(this).siblings('label').fadeIn('fast');
					}
				});
			});
		</script>
		<div id="colorlib-container" align="center">
			<div class="container">
				<div class="col-md-9">
					<div class="row">
							<div class="row headbox"><h2 class="heading-2">회원가입</h2></div>
							<form action="joinC" method="post" name="frm" onsubmit="return passwordChk()">
							<div class="row formbox">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_id">아이디</label>
										<input type="text" name="c_id" id="c_id" class="form-control"required="required" onkeyup="idChk()">
									</div>								
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<div id="idDisp"></div>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password">비밀번호</label>
										<input type="password" name="c_password" id="c_password" class="form-control" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="c_password2">비밀번호 확인</label>
										<input type="password" name="c_password2" id="c_password2" class="form-control" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="nickname">닉네임</label>
										<input type="text" name="nickname" id="nickname" class="form-control" required="required"
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
										<label for="subject">메일주소</label>
										<input type="email" name="email" id="email" class="form-control"required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="hashtag">#hash</label>
										<input type="text" name="hashtag" id="hashtag" class="form-control">
									</div>
								</div>
								<div class="form-group" style="text-align: center;">
									<input type="submit" value="회원가입" class="btn btn-primary">
								</div>
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

