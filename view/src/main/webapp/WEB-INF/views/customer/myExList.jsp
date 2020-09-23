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
		<div class="row headbox"><h2 class="heading-2">관심전시회</h2></div>
			<div class="container" align="center">
				<div class="row-pb-md">
					<div class="col-md-9">
					<div class="row">
						<div class="row" align="left">						
						<c:if test="${empty myList }">
							<table class="table" style="margin-top: 20px;">
								<tr>
								<td style="text-align: center;">등록된 전시회가 없습니다.</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${not empty myList }">
						<table class="table" style="margin: 30px 0;">
						<tbody>
						<c:forEach items="${myList }" var="ex">
							<c:if test="${ex.del == 'n' }">
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=c&pageNum=${pageNum}'" 
							style="cursor: pointer;">
								<td rowspan="5" style="width: 35%; vertical-align: middle; border-bottom: 2px solid #eeeeee;" align="center">
									<div style="width:120px;">
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail" style="max-height: 180px; width:auto; max-width: 150px;">
									</div>
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=c&pageNum=${pageNum}'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%; vertical-align: middle;">전시회명</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.title }
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=c&pageNum=${pageNum}'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%;">장소</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.gallery }
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=c&pageNum=${pageNum}'" style="cursor: pointer;">
								<th style="width: 25%; vertical-align: middle; border-bottom: 1px dashed #eeeeee;">기간</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.start_date } ~ ${ex.end_date }
								</td>										
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=c&pageNum=${pageNum}'" style="border-bottom: 2px solid #eeeeee;">
								<td id="${ex.exhibition_no }" colspan="3" style="line-height: 120%; vertical-align: middle;" height="50px;"></td>					
									<script type="text/javascript">
										var verify = '${ex.exhibition_no }';
										var jsondata = '${ex.hashtags }';
										var hash = JSON.parse(jsondata);
										for (var i=0; i<hash.hash.length; i++) {
											$('#' + verify).append('<span id="'+hash.hash[i]+'">' +
													'<a style="cursor:pointer; font-size: 12px; display: inline-block;" href="#">#' +
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
				<!-- paging -->
				<div class="row-pb-lg">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<div class="col-md-12" align="center">
						<div class="pagination">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<button class="active" onclick="location.href='${path }/cus/myExList?pageNum=${page.startPage - 1 }'">
								&laquo;
							</button>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<button class="disabled" onclick="location.href='${path }/cus/myExList?pageNum=${i }'">
									${i}
								</button>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<button class="active" onclick="location.href='${path }/cus/myExList?pageNum=${i }'">
									${i}
								</button>
							</c:if>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage }">
							<button class="active" onclick="location.href='${path }/cus/myExList?pageNum=${page.endPage + 1 }'">
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