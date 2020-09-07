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
		moreList();
		function moreList() {
			 
		    var startRow = $("#list tr").length / 2;  //마지막 리스트 번호를 알아내기 위해서 tr태그의 length를 구함.
		    var c_id = '${c_id}';
		    var addListHtml = "";  
		    console.log("startRow", startRow); //콘솔로그로 startRow에 값이 들어오는지 확인
		 
		     $.ajax({
		        url : "ticketList",
		        type : "post",
		        dataType : "json",
		        data : {"startRow":startRow, "c_id":c_id},
		        
		        success : function(data) {
		        	alert("list");
		            if(data.length < 10){
		                $("#addBtn").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
		            }else{
		            var addListHtml ="";
		            if(data.length > 0){
		                
		                for(var i=0; i<data.length;i++) {
		                    addListHtml += '<tr style="cursor: pointer;" id="'+ data[i].ticketbook_no + '">';
		                    addListHtml += '<td style="width: 30%;" rowspan="2"><img src="ticketImg/'+data[i].filename+'" class="img-thumbnail"></td>';
		                    addListHtml += '<td style="width: 70%; height: 30px;">';
		                    addListHtml += '<div class="row"><div class="col-xs-offset-1 h4">';
		                    addListHtml += data[i].title;
		                    addListHtml += '<div class="col-xs-offset-0 small">';
		                    addListHtml += data[i].visit_date;
		                    addListHtml += '</div></div></div></td></tr><tr style="cursor: pointer;"><td style="width: 70%;">';
		                    addListHtml += '<div class="row" id="content"><div class="col-xs-offset-1" id="cBody">';
		                    addListHtml += '';
		                    addListHtml += '</div></div></td></tr>';
							var tr_id = '#'+data[i].ticketbook_no;
			   				$(tr_id).attr('onclick', 'location.href="ticketView?ticketbook_no=${t.ticketbook_no }"');
		                }
		                $("#listBody").append(addListHtml);
		           		}
		            }
		        }
		    });
		 
		}
		</script>
		<div id="colorlib-container">
			<div class="container" align="center">
				<div class="row">
					<div class="col-md-9">
					<div class="row">
						<div class="row headbox"><h2 class="heading-2">티켓북</h2></div>
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
						<a href="javascript:moreList();" class="btn btn-primary" id="addBtn">더보기</a>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>