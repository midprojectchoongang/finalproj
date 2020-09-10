<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW</title>
</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<script type="text/javascript">
			var pageNum = '${pageNum}';
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth();

			month += 1;
			
		    if (month < 10) {
			    var date = year + '0' + month;
			} else {
			    var date = year + '' + month;
			}
			    
			function getList(date) {
			    $('#listDisp').load('${path}/cus/ticketList #list', 'c_id=${ticket.c_id}&date=' + date + '&pageNum=' + pageNum);
			}

			function present() {

			    var yg = document.getElementById("Ymd");
			    var ymda = year + "년 " + (month) + "월";
			    yg.innerHTML = ymda;
			    
				var now = new Date();
				var nowYear = today.getFullYear();
				var nowMonth = today.getMonth();
				if (year >= nowYear && month > nowMonth) {
					$('#next > button').attr('disabled','disabled');
			    }
			}

			function prevmonth() { //이전 월로 가는 함수

			    var yg = document.getElementById("Ymd");

			    month--; //month를 계속 감소시켜준다
			    if (month < 1) { // month가 1보다 작아지면
				month = 12; // month를 12로 만들어줌
				year -= 1; //year를 1 감소시켜준다
			    }
			    if (year < 2010) { 
					alert("2010년 이후부터 기록할 수 있습니다.");
					return;
			    }

			    var ymda = year + "년 " + (month) + "월";
			    yg.innerHTML = ymda;

			    if (month < 10) {
				    var date = year + '0' + month;
				} else {
				    var date = year + '' + month;
				}
			    
			    $('#next > button').removeAttr('disabled','disabled');
			    getList(date);
			    present();
			}

			function nextmonth() { //다음 월로 가는 함수

			    var yg = document.getElementById("Ymd");

			    month++; //month 를 계속 증가시켜줌
			    if (month > 12) { //만약 month가 12를 넘어가면
				month = 1; // month를 1로 만듦
				year += 1; //year을 1 증가시켜준다
			    }
				
			    var ymda = year + "년 " + month + "월";
			    yg.innerHTML = ymda;

				var now = new Date();
				var nowYear = today.getFullYear();
				var nowMonth = today.getMonth();
				if (year >= nowYear && month > nowMonth) {
					$('#next > button').attr('disabled','disabled');
			    }
			    if (month < 10) {
				    var date = year + '0' + month;
				} else {
				    var date = year + '' + month;
				}
			    			    
				getList(date);
			}
			
			
			$(function() {
				getList(date);
				present();
			})
	</script>
		<div id="colorlib-container">
			<div class="container" align="center">
				<div class="row">
					<div class="col-md-9">
						<div class="row-pb-md">
							<table class="table" id="tab">
								<tr id="dayTab">
									<td align="center" id="prev" style="width: 5%;" class="btn-group-md">
										<a class="btn btn-outline" href="javascript:prevmonth()">이전</a>
									</td>
									<th colspan="5" style="width: 40%; text-align: center;">
									<div class="row">
										<span class="col-md-2 cal-title" id="Ymd"></span>
										<span class="col-xs-0 cal-title btn-group-xs">
										<a href="/cus/ticketWriteForm" class="btn btn-primary">+</a>
										</span>
									</div>
									</th>
									<td align="center" id="next" style="width: 5%;" class="btn-group-md">
										<a class="btn btn-outline" href="javascript:nextmonth()">다음</a>
									</td>
								</tr>
							</table>
						</div>

					<div class="row" id="listDisp"></div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>