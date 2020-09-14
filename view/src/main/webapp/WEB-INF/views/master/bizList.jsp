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
			<div class="container" align="center">
				<div class="row">
					<div class="col-md-9">
					<div class="row headbox-sm"><h2 class="heading-2-b">단체회원 목록</h2></div>
						<table class="table table-striped" id="list">
							<tr>
								<th>아이디</th>
								<th>단체명</th>
								<th>분류</th>
								<th>승인</th>
								<th>가입일</th>
							</tr>
							<c:forEach var="mem" items="${list }">
							<tr style="cursor: pointer;" onclick="location.href='${path}/master/bizAdmin?b_id=${mem.b_id }&pageNum=${pageNum }'">
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
						<ul class="pagination pagination-sm">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<li><a href="exList?pageNum=${page.startPage - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						     	</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<li class="disabled"><a href="exList?pageNum=${i }">${ i }</a></li>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<li class="active"><a href="exList?pageNum=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
							<li><a href="exList?pageNum=${page.endPage + 1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>