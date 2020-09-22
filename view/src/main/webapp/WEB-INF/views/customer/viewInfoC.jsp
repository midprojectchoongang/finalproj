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
			<div class="col-md-5">
				<div class="row" >
					<div class="row formbox-nonlabel" align="left">
						<table class="table table-ticket" style="font-size: 17px;">
							<tr style="height: 60px;"><th style="width:100px; text-align: center;">아이디</th>
								<td style="padding-left: 50px;">${customerdto.c_id }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">닉네임</th>
								<td style="padding-left: 50px;">${customerdto.nickname }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">이메일</th>
								<td style="padding-left: 50px;">${customerdto.email }</td>
							</tr>
							<tr><th style="text-align: center;">My #Hash</th>
								<td style="padding-left: 30px;"><p class="tags">
									<c:forEach var="htl" items="${selectedHash }">
										<span class="tag" style="display: inline-block; margin-bottom: 10px;">
											<a href="#" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
										</span></c:forEach></p>
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
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>

