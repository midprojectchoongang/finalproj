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
					<div class="row">
						<div class="row headbox"><h2 class="heading-2">관심전시회</h2></div>
						<div class="row" align="left">						
						<table class="table table-hover">
							<thead>
							<tr>
								<th style="width: 50%;" colspan="2">전시회명</th>
								<th style="width: 20%;">장소</th>
								<th style="width: 30%;">기간</th>
							</tr>
							</thead>
							<c:if test="${empty myList }">
							<tbody>
								<tr>
								<td colspan="4" style="text-align: center;">등록된 관심전시회가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty myList }">
							<c:forEach items="${myList }" var="ex">
								<c:if test="${ex.del == 'n' }">
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=y'" style="cursor: pointer;">
								<td>
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail" style="width: 100px; height: 100px;">
								</td>
								<td style="width: 40%; vertical-align: middle; padding-left: 20px;">
									${ex.title }
								</td>
								<td style="text-align: center; vertical-align: middle;">
									${ex.gallery }
								</td>
								<td style="text-align: center; vertical-align: middle;">
									${ex.start_date }<br> ~ ${ex.end_date }
								</td>															
							</tbody>							
								</c:if>
							</c:forEach>
							</tr>
							</c:if>
						</table>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<div class="col-md-12">
						<ul class="pagination pagination-sm">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<li><a href="${path }/cus/myExList?pageNum=${page.startPage - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						     	</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<li class="disabled"><a href="${path }/cus/myExList?pageNum=${i }">${ i }</a></li>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<li class="active"><a href="${path }/cus/myExList?pageNum=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
							<li><a href="${path }/cus/myExList?pageNum=${page.endPage + 1 }" aria-label="Next">
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