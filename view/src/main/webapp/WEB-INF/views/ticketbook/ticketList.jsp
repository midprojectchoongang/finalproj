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
				<div class="row-pb-md">
					<div class="col-md-9">
					<div class="row">
						<div class="row" align="left">
						<table class="table table-ticket" id="list">
							<c:if test="${empty list }">
								<tr>
									<td style="text-align: center;">관람한 전시회가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty list }">
							<c:forEach items="${list }" var="t">
							<tr style="cursor: pointer;" onclick="location.href='${path }/cus/ticketView?ticketbook_no=${t.ticketbook_no }&date=${date }'">
								<td style="width: 30%;" rowspan="2"><img src="${path }/ticketImg/${t.filename }" class="img-thumbnail"></td>
								<td style="width: 70%; height: 30px;">
									<div class="row">
										<div class="col-xs-offset-1 h4">
											${t.title }
											<div class="col-xs-offset-0 small">
												${t.visit_date }
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="cursor: pointer;" onclick="location.href='${path }/cus/ticketView?ticketbook_no=${t.ticketbook_no }&date=${date }'">
								<td style="width: 70%;">
									<div class="row" id="content">
										<div class="col-xs-offset-1" id="cBody">
											${t.content }
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
							</c:if>
						</table>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>