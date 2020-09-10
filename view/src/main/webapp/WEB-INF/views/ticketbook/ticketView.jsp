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
		<script type="text/javascript">
			function list() {
			    location.href='${path}/cus/ticketCal?date=${date}';
			}
		</script>
		<div id="colorlib-container">
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row-pb-md" align="justify" style="margin-top: 30px;">
					<table class="table table-ticket">
						<tr>
							<td colspan="2" class="headbox">
								<h2 class="heading-2" style="margin: 30px;">${ticket.title } (${ticket.visit_date })</h2>
							</td>
						</tr>
						<tr>
							<td style="padding-top: 30px;">
							<div class="row" align="center">
								<div class="col-md-6">
								<img src="${path }/ticketImg/${ticket.filename }" class="img-thumbnail">
								</div>
							</div>
							</td>
						</tr>
						<tr>
							<td style="padding: 30px;">
							<div class="row" align="center">
								<div class="col-md-12" align="justify">
								${ticket.content }
								</div>
							</div>
							</td>
						</tr>
					</table>
				</div>
					<div class="row-pb-lg btn-group-sm" style="text-align: center; padding: 20px;">
						<a href="javascript:list()" class="btn btn-default">목록</a>
						<a href="${path }/cus/ticketUpdateForm?ticketbook_no=${ticket.ticketbook_no }&date=${date}" class="btn btn-default">수정</a>
						<a href="${path }/cus/ticketDel?ticketbook_no=${ticket.ticketbook_no }&date=${date}"
							onclick="return confirm('티켓을 삭제하시겠습니까?')" class="btn btn-outline">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

