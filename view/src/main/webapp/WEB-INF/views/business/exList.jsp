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
		<div class="row headbox"><h2 class="heading-2">전시 관리</h2>
		</div>
			<div class="container" align="center">
				<div class="row-pb-md">
					<div class="col-md-9">
					<div class="row">
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
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=b&pageNum=${pageNum}'" 
							style="cursor: pointer; border-bottom: 2px solid #eeeeee;">
								<td rowspan="5" style="width: 35%; vertical-align: middle;" align="center">
									<div style="width:120px;">
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail">
									</div>
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=b&pageNum=${pageNum}'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%; vertical-align: middle;">전시회명</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.title }
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&myList=b&pageNum=${pageNum}'" 
							style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
								<th style="width: 25%;">장소</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.gallery }
								</td>
							</tr>
							<tr onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }'&myList=b&pageNum=${pageNum}" 
								style="cursor: pointer; border-bottom: 1px dashed #eeeeee;">
								<th style="width: 25%; vertical-align: middle;">기간</th>
								<td height="50px;" style="vertical-align: middle;">
									${ex.start_date } ~ ${ex.end_date }
								</td>											
							</tr>
							<tr style="border-bottom: 2px solid #eeeeee;">
								<td colspan="3" height="50px;" style="vertical-align: middle;">
									<div class="btn-group-xs" style="text-align: right;">
									<c:if test="${ex.del == 'n' }">
										<a href="${path }/biz/exUpdateForm?exhibition_no=${ex.exhibition_no }" 
											class="btn btn-outline">수정</a>
										<a href="${path }/biz/exDelete?exhibition_no=${ex.exhibition_no }" 
											class="btn btn-outline" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
									</c:if>
									<c:if test="${ex.del == 'y' }">
										<font style="font-size: 12px; color: #808080">삭제한 게시물입니다.</font>
									</c:if>
									</div>
								</td>
							</tr>
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
					<div class="col-md-12" align="center">
						<div class="pagination">
						<c:if test="${page.startPage > page.pagePerBlock }">
							<button class="active" onclick="location.href='${path }/biz/exList?pageNum=${page.startPage - 1 }'">
								&laquo;
							</button>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:if test="${i == page.currentPage }">
								<button class="disabled">
									${i}
								</button>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<button class="active" onclick="location.href='${path }/biz/exList?pageNum=${i }'">
									${i}
								</button>
							</c:if>
						</c:forEach>  
						<c:if test="${page.endPage < page.totalPage }">
							<button class="active" onclick="location.href='${path }/biz/exList?pageNum=${page.endPage + 1 }'">
								&raquo;
							</button>
						</c:if>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>