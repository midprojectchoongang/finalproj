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
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<div class="quotetitle">${ticket.title }</div>
					<div class="row">
						<div class="col-md-4">
							<img src="ticketImg/${ticket.filename }" class="img-thumbnail">
							<div class="row">
							<span class="col-xs-4 small">
								${ticket.visit_date }
							</span>
							</div>
						</div>
						<div class="col-md-8">
							${ticket.content }
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

