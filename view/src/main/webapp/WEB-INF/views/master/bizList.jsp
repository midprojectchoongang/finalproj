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
						<table class="table table-hover" id="list">
							<thead>
							<tr>
								<th>아이디</th>
								<th>단체명</th>
								<th>분류</th>
								<th>가입일</th>
								<th>승인</th>
								<th>승인일</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="mem" items="${list }">
							<c:if test="${mem.confirm == 'y'}">
								<tr style="cursor: pointer; text-align: center; background-color: #fff;" 
									onclick="location.href='${path}/master/bizAdmin?b_id=${mem.b_id }&pageNum=${pageNum }'">
							</c:if>
							<c:if test="${mem.confirm == 'c'}">
								<tr style="cursor: pointer; text-align: center; background-color: #F2F2F2;" 
									onclick="location.href='${path}/master/bizAdmin?b_id=${mem.b_id }&pageNum=${pageNum }'">
							</c:if>
							<c:if test="${mem.confirm == 'n'}">
								<tr style="cursor: pointer; text-align: center; color: #F6490D;" 
									onclick="location.href='${path}/master/bizAdmin?b_id=${mem.b_id }&pageNum=${pageNum }'">
							</c:if>
								<td>${mem.b_id }</td>
								<td>${mem.groupName }</td>
								<td>
									<c:choose>
										<c:when test="${mem.groupkind == 'licensee'}">
											개인
										</c:when>
										<c:when test="${mem.groupkind == 'corporation'}">
											법인
										</c:when>
										<c:when test="${mem.groupkind == 'etc'}">
											개인
										</c:when>
									</c:choose>
								
								</td>
								<td><fmt:formatDate value="${mem.reg_date }" pattern="YYYY-MM-dd"/></td>
								<td>
									<c:choose>
										<c:when test="${mem.confirm == 'y'}">
											완료
										</c:when>
										<c:when test="${mem.confirm == 'c'}">
											대기
										</c:when>
										<c:when test="${mem.confirm == 'n'}">
											불가
										</c:when>
									</c:choose>									
								</td>
								<td><fmt:formatDate value="${mem.confirm_date }" pattern="YYYY-MM-dd"/></td>
							</tr>
							</c:forEach>
						</tbody>
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