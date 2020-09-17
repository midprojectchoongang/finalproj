<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	var chk = "";
	function idChk() {
		if ($('#b_id').val() == "") {
			$('#idDisp').html("");
			return;
		}
		var b_id = $('#b_id').val();
		$.ajax({
			url : 'b_idChk',
			type : 'post',
			data : {
				b_id : b_id
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
	}
	function passwordChk() {
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
	<script type="text/javascript">
		$(function() {
			var placeholderTarget = $('.formbox input, .formbox select');
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
			$("#groupkind").prop("selectedIndex", -1);
		});
	</script>
	<div id="colorlib-container">
	<div class="row headbox"><h2 class="heading-2">단체회원가입</h2></div>
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row">
					<form action="bizJoin" method="post" name="frm" onsubmit="return passwordChk()">
					<div class="row formbox">
						<div class="row form-group">
							<div class="col-md-12">
								<label for="b_id">아이디</label>
								<input type="text" name="b_id" id="b_id" class="form-control" required="required" onkeyup="idChk()">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<div id="idDisp"></div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="b_password">비밀번호</label>
								<input type="password" name="b_password" id="b_password" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="b_password2">비밀번호 확인</label>
								<input type="password" name="b_password2" id="b_password2" class="form-control" required="required">
							</div>
						</div>							
					</div>
					<div class="row formbox">
						<div class="row form-group">
							<div class="col-md-12">
								<label for="groupName">단체명</label>
								<input type="text" name="groupName" id="groupName" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="ceoName">대표자</label>
								<input type="text" name="ceoName" id="ceoName" class="form-control"required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="groupkind">단체종류</label>
								<select name="groupkind" id="groupkind" class="form-control" required="required">
									<c:forEach var="kind" items="${groupkind }" varStatus="i">
									<option value="${groupname[i.index] }">${kind }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<script type="text/javascript">
							$('#groupkind').change(function() {
								var colName = $('#groupkind option:selected').val();
								var pholder = "";
								if (colName == 'licensee') pholder = "사업자등록번호";
								else if (colName == 'corporation') pholder = "법인등록번호";
								else pholder = "기타고유번호";
								var form = '<div class="col-md-12"><input type="text" name="' 
											+ colName + '" id="' + colName 
											+ '"placeholder="' + pholder + '" class="form-control"></div>'; 
								$('#enterDisp').html(form);
							});
						</script>
						<div class="row form-group" id="enterDisp">
							<div class="col-md-12">
								<label for="licensee">등록번호</label>
								<input type="text" name="licensee" id="licensee"class="form-control">
							</div>
						</div>
					</div>
					<div class="row formbox">
						<div class="row form-group">
							<div class="col-md-12">
								<label for="tel">대표번호</label>
								<input type="tel" name="tel" id="tel" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="email">메일주소</label>
								<input type="email" name="email" id="email" class="form-control" required="required">
							</div>
						</div>							
						<div class="row form-group">
							<div class="col-md-12">
								<label for="website">홈페이지</label>
								<input type="text" name="website" id="website" class="form-control">
							</div>
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

