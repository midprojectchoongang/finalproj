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
	<div class="row headbox"><h2 class="heading-2">개인 회원정보</h2></div>
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
							<tr style="height: 60px;"><th style="text-align: center;">가입일</th>
								<td style="padding-left: 50px;">${customerdto.reg_date }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">가입상태</th>
								<td style="padding-left: 50px;">
									<c:if test="${customerdto.del != 'n'}">탈퇴</c:if>
									<c:if test="${customerdto.del == 'n'}">활동중</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group" style="text-align: center;">
						<a href="${path }/master/cusState?c_id=${customerdto.c_id }&pageNum=${pageNum }" class="btn btn-primary">가입상태 변경</a>
						<button onclick="location.href='${path }/master/cusList?pageNum=${pageNum }'" class="btn btn-outline">목록</button>			
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>