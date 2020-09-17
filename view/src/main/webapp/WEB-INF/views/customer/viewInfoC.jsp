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
		<div id="colorlib-container" align="center">
		<div class="row headbox"><h2 class="heading-2">회원정보</h2></div>
			<div class="container">
				<div class="col-md-9">
					<div class="row" >
							<div class="row formbox-nonlabel" align="left">
							<table class="table table-ticket">
							<tr>
								<td>
									<label>아이디</label>
									<div class="col-md-12 row-pb-sm">																									
										${customerdto.c_id }										
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label>닉네임</label>
									<div class="col-md-12 row-pb-sm">
										${customerdto.nickname }						
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label>메일주소</label>
									<div class="col-md-12 row-pb-sm">
										${customerdto.email }										
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label>#HashTag</label>
									<div class="col-md-12 row-pb-sm">
										<p class="tags">
											<c:forEach var="htl" items="${selectedHash }">
												<span class="tag">
													<a href="#" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
												</span>
											</c:forEach>
										</p>
									</div>
								</td>
							</tr>
							</table>
							</div>
							<div class="form-group" style="text-align: center;">
								<a href="updateFormC" class="btn btn-primary">회원정보수정</a>
								<button class="btn btn-outline" onclick="delConfirm();">회원탈퇴</button>						
							</div>
							<script type="text/javascript">
								function delConfirm() {
								    var msg = '아이디를 삭제하시겠습니까?';
								    if(confirm(msg)) {
										location.href='deleteC';
								    }
								}
							</script>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

