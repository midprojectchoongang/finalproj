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
		<script text="javascript/text">
			$(function() {
				$.each('#content', function() {
							var content = $(this).children('#cBody');
							var content_txt = $('#cBody').text();
							var content_txt_short = content_txt.substring(0,100)+ "...";
							if (content_txt.length >= 100) {
								content.html(content_txt_short);
							}
					});
			});
		</script>
		<div id="colorlib-container">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<table class="table table-hover" id="list">
							<c:forEach items="${list }" var="t">
							<tr style="cursor: pointer;" onclick="location.href='ticketView?ticketbook_no=${t.ticketbook_no }'">
								<td style="width: 30%;"><img src="ticketImg/${t.filename }" class="img-thumbnail"></td>
								<td style="width: 70%;">
									<div class="row">
										<div class="col-xs-offset-1 h4">
											${t.title }
											<div class="col-xs-offset-0 small">
												${t.visit_date }
											</div>
										</div>
									</div>
									<br>
									<div class="row" id="content">
										<div class="col-xs-offset-1 col-xs-10" id="cBody">
											${t.content }
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</table>
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