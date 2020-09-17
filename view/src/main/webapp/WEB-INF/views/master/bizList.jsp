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
		<div class="row headbox"><h2 class="heading-2">단체회원 목록</h2></div>
			<div class="container" align="center">
				<div class="row-pb-md">
					<div class="col-md-9">
						<div class="formbox">
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
				</div>
				<!-- paging -->
				<div class="row-pb-lg">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<div class="col-md-12" align="center">
						<div class="pagination">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<button class="active" onclick="location.href='${path }/master/bizList?pageNum=${page.startPage - 1 }'">
								&laquo;
							</button>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<button class="disabled" onclick="location.href='${path }/master/bizList?pageNum=${i }'">
									${i}
								</button>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<button class="active" onclick="location.href='${path }/master/bizList?pageNum=${i }'">
									${i}
								</button>
							</c:if>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
							<button class="active" onclick="location.href='${path }/master/bizList?pageNum=${page.endPage + 1 }'">
								&raquo;
							</button>
						</c:if>
						</div>
					</div>
				</div>	<!-- paging -->
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>