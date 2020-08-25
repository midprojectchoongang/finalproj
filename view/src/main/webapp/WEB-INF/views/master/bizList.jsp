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
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>아이디</th>
									<th>단체명</th>
									<th>분류</th>
									<th>승인</th>
									<th>가입일</th>
								</tr>
							</thead>
							<c:forEach var="mem" items="${list }">
							<tr style="cursor: pointer;" onclick="location.href='bizView?b_id=${mem.b_id }'">
								<td>${mem.b_id }</td>
								<td>${mem.groupName }</td>
								<td>${mem.groupkind }</td>
								<td>${mem.confirm }</td>
								<td><fmt:formatDate value="${mem.reg_date }" pattern="YYYY-MM-dd"/></td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="row">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<div class="col-md-12">
						페이징
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>