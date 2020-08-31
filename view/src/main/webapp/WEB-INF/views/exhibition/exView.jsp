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
						<a href="exUpdateForm?exhibition_no=${ex.exhibition_no }" class="btn btn-xs btn-outline">수정</a>
						<a href="exDelete" class="btn btn-xs btn-outline" onclick="return confirm('really?');">삭제</a>
						<a href="exList" class="btn btn-xs btn-outline">목록</a>
					</div>
					<table>
					
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.hashtags }
							</td>
						</tr>
						
						<tr>
							<td style="width: 30%; padding-top: 30px;" rowspan="4">
								<img src="exImg/${ex.filename }">
							</td>
							<td style="width: 70%; padding: 30px;">
								${ex.gallery }
							</td>
						</tr>						
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.start_date }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.end_date }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.price }
							</td>
						</tr>	
											
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.artist }
							</td>
						</tr>
						
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.gallery_site }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.address }
							</td>
						</tr>	
						<tr>
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link1 }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link2 }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link3 }
							</td>
						</tr>
						
						<tr>	
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

