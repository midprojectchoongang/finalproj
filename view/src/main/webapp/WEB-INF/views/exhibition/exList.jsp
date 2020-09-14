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
					<div class="col-md-12">
					<div class="row">
						<div class="row headbox col-md-9"><h2 class="heading-2">전시회</h2></div>
						<div class="row" align="left">						
						<table class="table table-hover">
							<thead>
							<tr>
								<th style="width: 50%;" colspan="2">전시회명</th>
								<th style="width: 20%;">장소</th>
								<th style="width: 30%;">기간</th>
							</tr>
							</thead>
						<%-- location.href='exView?exhibition_no=${ex.exhibition_no }' --%>
						<%-- <tr style="cursor: pointer;" id="${ex.exhibition_no }"> --%>						
							<c:forEach items="${list }" var="ex">
								<%-- <c:if test="${ex.del == 'y' }">
									<td colspan="4">
										삭제된 글입니다.
									</td>
								</c:if>	 --%>													
							<tbody>
								<c:if test="${ex.del == 'n' }">
							<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" style="cursor: pointer;">
								<td>
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail" style="width: 100px; height: 100px;">
								</td>
								<td style="width: 40%; vertical-align: middle; padding-left: 20px;">
									${ex.title }<br><p id="${ex.exhibition_no }"></p>
									<script type="text/javascript">
										var verify = '${ex.exhibition_no }';
										var jsondata = '${ex.hashtags }';
										var hash = JSON.parse(jsondata);
										for (var i=0; i<hash.hash.length; i++) {
											$('#' + verify).append('<span id="'+hash.hash[i]+'">' +
													'<a style="cursor:pointer; font-size: 12px;" href="exList?keyword=' + hash.hash[i] + '">#' +
													hash.hash[i] + '&emsp;</a></span>'
											);
										}
									</script>
								</td>
								<td style="text-align: center; vertical-align: middle;">
									${ex.gallery }
								</td>
								<td style="text-align: center; vertical-align: middle;">
									${ex.start_date }<br> ~ ${ex.end_date }
								</td>															
							</tr>
								</c:if>
							</tbody>							
							</c:forEach>
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
							<li><a href="exList?pageNum=${page.startPage - 1 }" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						     	</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<li class="disabled"><a href="exList?pageNum=${i }">${i }</a></li>
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