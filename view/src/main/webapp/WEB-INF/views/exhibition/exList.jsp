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
						<div class="row headbox">
							<h2 class="heading-2">전시회</h2>
						</div>
						<table style="width: 100%">
							<tr align="left">
								<th style="width: 45%">전시회명</th>
								<th style="width: 15%">장소</th>
								<th style="width: 40%">기간</th>
							</tr>
						</table>																														
						<div class="row" align="left">						
						<table style="width: 100%">						
							<c:forEach items="${list }" var="ex">
							<%-- location.href='exView?exhibition_no=${ex.exhibition_no }' --%>
							<%-- <tr style="cursor: pointer;" id="${ex.exhibition_no }"> --%>
							<tr>
								<td style="width: 30%; height: 15px;">
									<img src="exImg/${ex.filename }">
								</td>
								<td style="width: 15%;">
									<a href="exView?exhibition_no=${ex.exhibition_no }">
									${ex.title }
									</a>
								</td>
								<td style="width: 15%;">
									<a href="#">
									${ex.gallery }
									</a>
								</td>
								<td style="width: 40%;">
									${ex.start_date } <br>
									 ~ ${ex.end_date }
								</td>															
							</tr>							
							</c:forEach>
						</table>
						</div>
					</div>
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