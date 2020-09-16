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
			<div class="row">
				<div class="row headbox"><h2 class="heading-2">${ticket.title }<br><font size="3px">${ticket.visit_date }</font></h2></div>
				<div class="row btn-group-xs" style="text-align: right; padding: 20px;">
					<a href="javascript:list()" class="btn btn-default">목록</a>
					<a href="${path }/cus/ticketUpdateForm?ticketbook_no=${ticket.ticketbook_no }&date=${date}" 
						class="btn btn-default">수정</a>
					<a href="${path }/cus/ticketDel?ticketbook_no=${ticket.ticketbook_no }&date=${date}"
						onclick="return confirm('티켓을 삭제하시겠습니까?')" class="btn btn-outline">삭제</a>
				</div>
			</div>
			<div class="col-md-12">								
				<div class="row row-pb-md" style="margin-top: 30px; float: left;">
					<div class="col-md-5" align="center">
						<div class="row">
						<img src="${path }/ticketImg/${ticket.filename }" class="img-thumbnail">
						</div>
					</div>
					<div class="col-md-5" align="left">
						<div class="row" style="margin-left: 5%; padding: 5%;">
						${ticket.content }
						</div>
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

