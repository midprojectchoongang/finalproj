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
		<div class="row headbox"><h2 class="heading-2">회원정보수정</h2></div>
			<div class="container">
				<div class="col-md-12">
					<div class="row">
							<form action="bizUpdate" method="post" name="frm">
							<input type="hidden" name="b_id" value="${bsness.b_id }">
							<div class="row formbox">
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;단체명</b> 
										<input type="text" name="groupName" id="groupName" class="form-control"
											value="${bsness.groupName }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;대표자</b> 
										<input type="text" name="ceoName" id="ceoName" class="form-control"
											value="${bsness.ceoName }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;단체종류</b>										
										<select name="groupkind" id="groupkind" class="form-control">
											<c:forEach var="kind" items="${groupkind }" varStatus="i">
												<option value="${groupname[i.index] }">${kind }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<script type="text/javascript">
									$(function() {
										var ori_kind = '${bsness.groupkind}';
										$('#groupkind>option[value="'+ori_kind+'"]').attr('selected','selected');
									})
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
										<c:if test="${bsness.groupkind == 'licensee'}">
										<b>&emsp;사업자등록번호</b> 										
											<input type="text" name="licensee" id="licensee" class="form-control"
											value="${bsness.licensee }">
										</c:if>																																							
										<c:if test="${bsness.groupkind == 'corporation'}">
										<b>&emsp;법인등록번호</b> 										
											<input type="text" name="corporation" id="corporation" class="form-control"
											value="${bsness.corporation }">
										</c:if>																																							
										<c:if test="${bsness.groupkind == 'etc'}">
										<b>&emsp;기타고유번호</b> 										
											<input type="text" name="etc" id="etc" class="form-control"
											value="${bsness.etc }">
										</c:if>																																							
									</div>
								</div>						
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;대표번호</b>
										<input type="text" name="tel" id="tel" class="form-control"
										 value="${bsness.tel }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;메일주소</b>
										<input type="email" name="email" id="email" class="form-control"
										 value="${bsness.email }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;홈페이지</b>
										<input type="text" name="website" id="website" class="form-control"
										 value="${bsness.website }">
									</div>
								</div>
							</div>
							<div class="row formbox">								
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;비밀번호</b>
										<input type="password" name="b_password" id="b_password" class="form-control" required="required"
										 value="${bsness.b_password }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<b>&emsp;비밀번호 확인</b>
										<input type="password" name="b_password2" id="b_password2" class="form-control" required="required"
										 placeholder="비밀번호 확인" onkeyup="passwordChk()">
										<div id="pwDisp"></div>
									</div>
								</div>
								<script type="text/javascript">
									function passwordChk() {
										if (frm.b_password.value != frm.b_password2.value) {
											$('#pwDisp').html("<b>비밀번호와 비밀번호 확인이 일치하지 않습니다</b>");
										} else {
											$('#pwDisp').html("");
										}
									}
								</script>
							</div>												
								<div class="form-group" style="text-align: center;">
									<input type="submit" value="수정" class="btn btn-primary">
									<button type="button" onclick="cancel()" class="btn btn-cta">취소</button>							
								</div>
								<script type="text/javascript">
									function cancel() {
										history.back();
									}
								</script>
							</form>	
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

