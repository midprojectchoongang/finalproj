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
						<div class="row headbox"><h2 class="heading-2">전시회</h2></div>
						<div class="row" align="left">						
						<c:if test="${empty list }">
							<table class="table" style="margin-top: 20px;">
								<tr>
								<td style="text-align: center;">등록된 전시회가 없습니다.</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${not empty list }">
						<table class="table" style="margin: 30px 0;">
						<tbody>
						<c:forEach items="${list }" var="ex">
							<c:if test="${ex.del == 'n' }">
							<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
							style="cursor: pointer;">
								<td rowspan="4" style="width: 35%;">
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail" style="width: 120px; height: 120px;">
								</td>
							</tr>
							<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%;">전시회명</th>
								<td>
									${ex.title }
								</td>
							</tr>
							<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%;">장소</th>
								<td>
									${ex.gallery }
								</td>
							</tr>
							<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" style="cursor: pointer;">
								<th style="width: 25%;">기간</th>
								<td>
									${ex.start_date } ~ ${ex.end_date }
								</td>										
							</tr>
							<tr style="border-bottom: 2px solid #eeeeee;">
								<td id="${ex.exhibition_no }" colspan="3">					
								</td>
									<script type="text/javascript">
										var verify = '${ex.exhibition_no }';
										var jsondata = '${ex.hashtags }';
										var hash = JSON.parse(jsondata);
										for (var i=0; i<hash.hash.length; i++) {
											$('#' + verify).append('<span id="'+hash.hash[i]+'">' +
													'<a style="cursor:pointer; font-size: 12px;" href="${path}/exList?keyword=' + hash.hash[i] + '">#' +
													hash.hash[i] + '&emsp;</a></span>'
											);
										}
									</script>
							</tr>
						</c:if>
						</c:forEach>
						</tbody>
					</table>
						</c:if>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<div class="col-md-12">
						<ul class="pagination pagination-sm">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<li><a href="${path }/exList?pageNum=${page.startPage - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						     	</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<li class="disabled"><a href="${path }/exList?pageNum=${i }">${i}</a></li>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<li class="active"><a href="${path }/exList?pageNum=${i }">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
							<li><a href="${path }/exList?pageNum=${page.endPage + 1 }" aria-label="Next">
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