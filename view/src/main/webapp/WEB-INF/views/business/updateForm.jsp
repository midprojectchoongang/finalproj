<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function chk() {
		if (frm.b_password.value != frm.b_password2.value) {
			alert("password check");
			frm.b_password.focus();
			frm.b_password.value = "";
			frm.b_password2.value = "";
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
							<h2 class="heading-2">회원정보수정</h2>
							<form action="bizUpdate" method="post" name="frm" onsubmit="return chk()">
							<input type="hidden" name="b_id" value="${bsness.b_id }">								
								<div class="row form-group">
									<div class="col-md-12">
										<label for="b_password">비밀번호</label>
										<input type="password" name="b_password" id="b_password" class="form-control"
										 placeholder="${bsness.b_password }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${bsness.b_password }'">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="b_password2">비밀번호 확인</label>
										<input type="password" name="b_password2" id="b_password2" class="form-control"
										 placeholder="Your password confirm" required="required">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="tel">대표번호</label>
										<input type="text" name="tel" id="tel" class="form-control"
										 placeholder="${bsness.tel }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${bsness.tel }'">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="email">메일주소</label>
										<input type="email" name="email" id="email" class="form-control"
										 placeholder="${bsness.email }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${bsness.email }'">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="website">홈페이지</label>
										<input type="text" name="website" id="website" class="form-control"
										 placeholder="${bsness.website }" required="required"
										 onfocus="this.placeholder=''" onblur="this.placeholder='${bsness.website }'">
									</div>
								</div>				
								<div class="form-group" style="text-align: center;">
									<input type="submit" value="확인" class="btn btn-primary">									
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

