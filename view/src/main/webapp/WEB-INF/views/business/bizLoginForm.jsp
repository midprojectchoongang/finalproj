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
		<script type="text/javascript">
			$(function() {
				var placeholderTarget = $('.formbox input[type="text"], .formbox input[type="password"]');
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
		<div id="colorlib-container">
			<div class="container" align="center">
				<div class="col-md-5">
					<div class="row-pb-lg"></div>
					<div class="row formbox">
						<form action="bizLogin">
							<div class="row">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="b_id">단체아이디</label>
										<input type="text" name="b_id" id="b_id" class="form-control" required="required">
									</div>
								</div>							
								<div class="row form-group">
									<div class="col-md-12">
										<label for="b_password">비밀번호</label>
										<input type="password" name="b_password" id="b_password"class="form-control" required="required">
									</div>
								</div>							
							</div>	
							<div class="row">	
								<div class="row form-group" style="text-align: center;">
									<input type="submit" value="로그인" class="btn btn-primary">
									<input type="button" value="회원가입" class="btn btn-outline" onclick="location.href='bizJoinForm'">
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

