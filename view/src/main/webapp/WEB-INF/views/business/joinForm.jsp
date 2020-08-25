<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function idChk() {
		if (!frm.b_id.value) {
			alert("id check");
			frm.b_id.focus();
			return false;
		}
		$.post('idChk', 'b_id=' + frm.b_id.value, function(data) {
			$('#disp').html(data);
		});
	}
	function chk() {
		if (frm.b_password.value != frm.b_password2.value) {
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
						<h2 class="heading-2">단체회원정보 입력</h2>
						<form action="bizJoin" method="post" name="frm" onsubmit="return chk()">
							<div class="row form-group">
								<div class="col-md-12">
									<input type="text" name="b_id" id="b_id" class="form-control" placeholder="아이디" required="required" autofocus="autofocus">
									<input type="button" onclick="idChk()" value="IdCheck">
									<span id="disp" class="err"></span>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="password" name="b_password" id="b_password" placeholder="비밀번호" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="password" name="b_password2" id="b_password2" placeholder="비밀번호 확인" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="text" name="groupName" id="groupName" placeholder="단체명" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="text" name="ceoName" id="ceoName" placeholder="대표자" class="form-control"required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="tel" name="tel" id="tel" class="form-control" placeholder="대표번호 또는 담당자 번호" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="email" name="email" id="email" class="form-control" placeholder="메일주소" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<select name="groupkind" id="groupkind" class="form-control" required="required">
										<optgroup label="단체종류">
										<c:forEach var="kind" items="${groupkind }" varStatus="i">
										<option value="${groupname[i.index] }">${kind }</option>
										</c:forEach>
										</optgroup>
									</select>
								</div>
							</div>
							<script type="text/javascript">
								$('#groupkind').change(function() {
									var colName = $('#groupkind option:selected').val();
									var form = '<div class="col-md-12"><input type="text" name="' 
												+ colName + '" id="' + colName 
												+ '"placeholder="등록번호" class="form-control"></div>'; 
									$('#enterDisp').html(form);
								});
								</script>
							<div class="row form-group" id="enterDisp">
								<div class="col-md-12">
									<input type="text" name="licensee" id="licensee" placeholder="등록번호" class="form-control">
								</div>
							</div>
							<div class="row form-group">
									<div class="col-md-12">
									<input type="text" name="website" id="website" placeholder="홈페이지" class="form-control">
								</div>
							</div>
							<div class="form-group" style="text-align: center;">
								<input type="submit" value="가입신청" class="btn btn-primary">
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

