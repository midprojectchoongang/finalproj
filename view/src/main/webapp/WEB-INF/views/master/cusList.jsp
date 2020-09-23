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
	<div class="row headbox"><h2 class="heading-2">개인회원 목록</h2></div>
		<div class="container" align="center">
			<div class="row-pb-md">
				<div class="col-md-9">
					<div class="formbox">
					<table class="table table-hover" id="list">
						<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>가입상태</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="cl" items="${list }">
							<tr style="cursor: pointer; text-align: center; background-color: #fff;" 
								onclick="location.href='${path}/master/cusDetail?c_id=${cl.c_id }&pageNum=${pageNum }'">
								<td>${cl.c_id }</td>
								<td>${cl.nickname }</td>
								<td>${cl.email }</td>
								<td><fmt:formatDate value="${cl.reg_date }" pattern="YYYY-MM-dd"/></td>
								<td>
									<c:if test="${cl.del != 'n'}">탈퇴</c:if>
									<c:if test="${cl.del == 'n'}">활동중</c:if>
								</td>
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