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
		<input type="hidden" name="pageNum" id="pageNum" value="${pageNum }">
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row" align="left">
					<div class="row headbox-sm"><h2 class="heading-2-b">${biz.groupName } 가입정보</h2></div>
					<div class="row formbox">
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>아이디</sapn>
								<div class="col-md-12">
									${biz.b_id }
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>단체명</sapn>
								<div class="col-md-12">
									${biz.groupName }
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>대표자</sapn>
								<div class="col-md-12">
									${biz.ceoName }
								</div>
							</div>
						</div>
					</div>
					<div class="row formbox">
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>단체종류</sapn>
								<div class="col-md-12">
									${biz.groupkind }
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>등록번호</sapn>
								<div class="col-md-12">
								<c:choose>
									<c:when test="${not empty biz.licensee}">${biz.licensee}</c:when>
									<c:when test="${not empty biz.corporation}">${biz.corporation}</c:when>
									<c:when test="${not empty biz.etc }">${biz.etc}</c:when>
									<c:otherwise>등록번호가 없습니다.</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>대표번호</sapn>
								<div class="col-md-12">
									${biz.tel }
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>메일주소</sapn>
								<div class="col-md-12">
									${biz.email }
								</div>
							</div>
						</div>							
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>홈페이지</sapn>
								<div class="col-md-12">
									${biz.website }
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>가입일</sapn>
								<div class="col-md-12">
									<fmt:formatDate value="${biz.reg_date }" pattern="YYYY-MM-dd"/>
								</div>
							</div>
						</div>						
					</div>
					<form action="bizConfirm" method="post" name="frm">
					<div class="row formbox">
					<script type="text/javascript">
						/* function getList() {
							$('#listDisp').load('bizList #list', 'pageNum=${pageNum}');	// list
						} */
						
						$(function () {
							/* getList(); */
							
							var state = "${biz.confirm}";
							var ment = "${biz.con_comment}";
							if (state != 'n') {
								$('#comment').hide('fast');
							}
							$('#confirm').change(function() {
								var chg = $(this).val();
								if (chg != 'n') $('#comment').hide('fast');
								else $('#comment').show('fast');
							});		
							
							$('select > option[value='+ state +']').attr('selected', 'selected');
							if (ment == null || ment == "") {
								$("#con_comment").prop("selectedIndex", -1);
							}
							else {
								$('select > option[value='+ ment +']').attr('selected', 'selected');
							}
						});			
						
						function confirm() {
							var id = '${biz.b_id}';
							var state = $('#confirm').val();
							var ment = $('#con_comment').val();
							/* console.log("id:"+id+",state:"+state+",ment"+ment); */
							$.ajax({
								url : 'bizConfirm',
								type : 'post',
								data : {
									b_id : id,
									confirm : state,
									con_comment : ment
								},
								success : function(data) {
									if ($.trim(data) > 0) {
										$('#resultDisp').html("<b>승인 결과가 반영되었습니다.</b>");
									}
									/* getList(); */
								},
								error : function() {
									alert("에러입니다");
								}
							});
						}
					</script>					
						<div class="row form-group">
							<div class="col-md-12">
								<sapn>가입승인</sapn>
								<div class="col-md-12">
									<select name="confirm" id="confirm" class="form-control" required="required">
										<c:forEach var="state" items="${db }" varStatus="i">
										<option value="${state}">${text[i.index] }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div id="comment" class="row form-group">
							<div class="col-md-12">
								<span>승인불가 사유</span>
								<div class="col-md-12">
									<select name="con_comment" id="con_comment" class="form-control" required="required">
										<c:forEach var="com" items="${com_no }" varStatus="i">
										<option value="${com}">${comment[i.index] }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row form-group" style="text-align: center;">
							<div class="col-md-12" id="resultDisp" style="padding: 20px;">
							</div>
							<div class="col-md-12" style="padding: 20px; margin-top: 10px;">
								<a href="javascript:confirm();" class="btn btn-primary">가입승인</a>
							</div>
						</div>
					</div>
					</form>
					<div class="row-pb-md form-group" style="text-align: center;">
						<button onclick="location.href='bizList?pageNum=${pageNum }'" class="btn btn-cta">목록</button>
					</div>
				</div>	
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

