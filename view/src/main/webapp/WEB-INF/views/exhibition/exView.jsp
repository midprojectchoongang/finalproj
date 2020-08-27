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
		<!-- <script type="text/javascript">
			$(function () {
				$('#listDisp').load('ticketList #list', 'c_id=${ticket.c_id}');
			});
		</script> -->
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row">
					<div class="row headbox"><h2 class="heading-2">(${ex.exhibition_no }) ${ex.title }</h2></div>
				</div>
				<div class="row" align="justify">
					<div class="row" style="text-align: right; padding: 20px;">
						<a href="#" class="btn btn-xs btn-outline">수정</a>
						<a href="#" class="btn btn-xs btn-outline">삭제</a>
					</div>
					<table>
						<tr>
							<td style="width: 30%; padding-top: 30px;">
								<img src="exImg/${ex.filename }">
							</td>
							<td style="width: 70%; padding: 30px;">
								${ex.content }
							</td>
						</tr>
					</table>
				</div>
				<!-- <div class="row" id="listDisp" style="margin-top: 50px;">
				</div> -->
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

