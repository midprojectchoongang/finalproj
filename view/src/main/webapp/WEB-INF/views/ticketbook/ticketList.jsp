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
						<div class="row headbox"><h2 class="heading-2">티켓북</h2></div>
						<!-- 달력 -->
						<script type="text/javascript">
						document.addEventListener('DOMContentLoaded', function() {
					        var calendarEl = document.getElementById('calendar');
					        var calendar = new FullCalendar.Calendar(calendarEl, {
					        	themeSystem: String
					        });
					        calendar.render();
					    });
						</script>
						<div class="row" align="left">
							<div class="col-md-12" id="calendar"></div>
						</div>
						<div class="row" align="left">
						<table class="table table-ticket" id="list">
						<tbody id="listBody">
      					</tbody>
							<c:forEach items="${list }" var="t">
							<%-- location.href='ticketView?ticketbook_no=${t.ticketbook_no }' --%>
							<tr style="cursor: pointer;" id="${t.ticketbook_no }">
								<td style="width: 30%;" rowspan="2"><img src="ticketImg/${t.filename }" class="img-thumbnail"></td>
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
							<tr style="cursor: pointer;">
								<td style="width: 70%;">
									<div class="row" id="content">
										<div class="col-xs-offset-1" id="cBody">
											${t.content }
										</div>
									</div>
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