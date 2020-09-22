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
		$(function () {
		    $('[data-toggle="popover1"]').popover();
		    $('#pop').popover({
		    	placement : 'bottom',
		    	trigger : 'hover click'
		    });
		})
		$(function () {
		    $('[data-toggle="popover2"]').popover();
		    $('#pop').popover({
		    	placement : 'bottom',
		    	trigger : 'hover click'
		    });
		})
		var listType = '${listType}';
		var keyword = '${keyword}'
		$(function () {
			if (keyword != '' && keyword != null) {
				$('#list3').css('font-size','25px').css('font-weight','bold');
			} else if (listType == 'p') {
				$('#list2').css('font-size','25px').css('font-weight','bold');
			} else {
				$('#list1').css('font-size','25px').css('font-weight','bold');
			}
		})
		$(function () {
			var alignment = '${alignment}';
			for (var i=0; i<4; i++) {
				if (alignment == $('#opt' + i).val()) {
					$('#opt' + i).attr('selected','selected');
					$('input[name=alignment]').val(alignment);
				}
			}
		})
	</script>
	<div id="colorlib-container">
		<div class="row headbox"><h2 class="heading-2">전시회</h2>
			<a href="${path }/exList" style="color: white;" id="list1">ALL&emsp;</a>
			<b style="color: white;">/</b>
			<a href="${path }/exList?listType=p" style="color: white;" id="list2">&emsp;My #HASH</a>
			<a tabindex="0" role="button" data-toggle="popover1" data-placement="bottom" data-trigger="focus" 
				data-content="가입 시 설정한 내 #HASH가 포함된 전시 리스트를 보여줍니다.">
				<img src="${path }/images/tooltip.png" width="15px" style="outline: 0; border: 0;">
			</a>&emsp;
			<b style="color: white;">/</b>
			<a href="${path }/hashSearch" style="color: white;" id="list3">&emsp;By #HASH</a>
			<a tabindex="0" role="button" data-toggle="popover2" data-placement="bottom" data-trigger="focus" 
				data-content="보고자 하는 #HASH를 선택하여 그것이 포함된 전시 리스트를 보여줍니다.">
				<img src="${path }/images/tooltip.png" width="15px" style="outline: 0; border: 0;">
			</a>
		</div>
		<div align="center">
			<select onchange="alignment()" id="alignment">
				<option id="opt0" value="reg_date">등록일순
				<option id="opt1" value="comment_cnt">댓글순
				<option id="opt2" value="like_cnt">관심전시순
				<option id="opt3" value="end_date">종료일순
			</select>
		</div>
		<script type="text/javascript">
			function alignment() {
				var keyword = '${keyword}';
				var listType = '${listType}';
				var alVal = $('#alignment').val();
			    $('input[name=alignment]').val(alVal);
			 	var pageNum = '${pageNum}';
			    $('input[name=pageNum]').val(pageNum);
			    if (listType == 'p' || keyword != null) {
				    $('input[name=keyword]').val(keyword);
				    $('input[name=listType]').val(listType);
			    }
			    document.frm.submit();
			}
		</script>
		<div class="container" align="center">
			<div class="row-pb-md">
				<div class="col-md-9">
					<div class="row">
						<div class="row" align="left">						
						<c:if test="${empty list }">
							<table class="table" style="margin-top: 20px;">
								<tr>
								<td style="text-align: center;">등록된 전시회가 없습니다.</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${not empty list }">
						<table class="table" style="margin: 30px 0;">
							<tbody>
								<c:forEach items="${list }" var="ex">
								<c:if test="${ex.del == 'n' }">
								<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
									style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
									<td rowspan="5" style="width: 35%; vertical-align: middle;" align="center">
										<div>
										<img src="${path }/exImg/${ex.filename }" class="img-thumbnail" style="max-height: 180px; width:auto; max-width: 150px;">
										</div>
									</td>
								</tr>
								<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
									style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
									<th style="width: 25%; vertical-align: middle;">전시회명</th>
									<td height="50px;" style="vertical-align: middle;">
										${ex.title }
									</td>
								</tr>
								<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
									style="cursor: pointer; border-bottom: 1px solid #eeeeee;">
									<th style="width: 25%;">갤러리</th>
									<td height="50px;" style="vertical-align: middle;">
										${ex.gallery }
									</td>
								</tr>
								<tr onclick="location.href='exView?exhibition_no=${ex.exhibition_no }'" 
									style="cursor: pointer; border-bottom: 1px dashed #eeeeee;">
									<th style="width: 25%; vertical-align: middle;">기간</th>
									<td height="50px;" style="vertical-align: middle;">
										${ex.start_date } ~ ${ex.end_date }
									</td>										
								</tr>
								<tr style="border-bottom: 2px solid #eeeeee;">
									<td id="${ex.exhibition_no }" colspan="3" style="line-height: 120%; vertical-align: middle;" height="50px;"></td>
								</tr>
								<script type="text/javascript">
									var verify = '${ex.exhibition_no }';
									var jsondata = '${ex.hashtags }';
									var hash = JSON.parse(jsondata);
									for (var i=0; i<hash.hash.length; i++) {
										$('#' + verify).append('<span id="'+hash.hash[i]+'">' +
												'<a style="cursor:pointer; font-size: 12px; display: inline-block;" href="${path}/exList?keyword=' +
												hash.hash[i] + '">#' + hash.hash[i] + '&emsp;</a></span>'
										);
									}
								</script>
								</c:if>
								</c:forEach>
							</tbody>
						</table>
						</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- paging -->
       		<c:if test="${listType != 'p' && keyword == null}">
			<div class="row-pb-lg">
				<div class="col-md-12" align="center">
					<div class="pagination">
					<c:if test="${page.startPage > page.pagePerBlock }">
						<button class="active" onclick="paging('p')">
							&laquo;
						</button>
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<c:if test="${i == page.currentPage }">
							<button class="disabled">
								${i}
							</button>
						</c:if>
						<c:if test="${i != page.currentPage }">
							<button class="active" onclick="paging('${i}')">
								${i}
							</button>
						</c:if>
					</c:forEach>  
					<c:if test="${page.endPage < page.totalPage }">
						<button class="active" onclick="paging('n')">
							&raquo;
						</button>
					</c:if>
					</div>
				</div>
			</div>
			<form action="exList" method="get" name="frm">
				<input type="hidden" name="pageNum" value="">
				<input type="hidden" name="alignment" value="">
			</form>
			<script type="text/javascript">
			 	function paging(num) {
			 		if (num == 'p') {
			 			var pageNum = ${page.startPage - 1 };
						$(function() {
						    $('input[name=pageNum]').val(pageNum);
						});
						document.frm.submit();
			 		} else if (num == 'n') {
			 			var pageNum = ${page.endPage + 1 };
						$(function() {
						    $('input[name=pageNum]').val(pageNum);
						});
						document.frm.submit();
			 		} else {
			 			var pageNum = num;
						$(function() {
						    $('input[name=pageNum]').val(pageNum);
						});
						document.frm.submit();
			 		}
			 	}
			</script>
			</c:if>
			
			<c:if test="${listType == 'p' || keyword != null}">
			<div class="row-pb-lg">
				<div class="col-md-12" align="center">
					<div class="pagination">
					<c:if test="${page.startPage > page.pagePerBlock }">
						<button class="active" onclick="paging('p')">
							&laquo;
						</button>
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<c:if test="${i == page.currentPage }">
							<button class="disabled">
								${i}
							</button>
						</c:if>
						<c:if test="${i != page.currentPage }">
							<button class="active" onclick="paging('${i}')">
								${i}
							</button>
						</c:if>
					</c:forEach>  
					<c:if test="${page.endPage < page.totalPage }">
						<button class="active" onclick="paging('n')">
							&raquo;
						</button>
					</c:if>
					</div>
				</div>
			</div>
			<form action="exList" method="get" name="frm">
				<input type="hidden" name="keyword" value="">
				<input type="hidden" name="pageNum" value="">
				<input type="hidden" name="listType" value="">
				<input type="hidden" name="alignment" value="">
			</form>
			<script type="text/javascript">
			 	function paging(num) {
				 	var keyword = '${keyword }';
				 	var listType = '${listType }';
			 		if (num == 'p') {
			 			var pageNum = ${page.startPage - 1 };
						$(function() {
						    $('input[name=keyword]').val(keyword);
						    $('input[name=pageNum]').val(pageNum);
						    $('input[name=listType]').val(listType);
						});
						document.frm.submit();
			 		} else if (num == 'n') {
			 			var pageNum = ${page.endPage + 1 };
						$(function() {
						    $('input[name=keyword]').val(keyword);
						    $('input[name=pageNum]').val(pageNum);
						    $('input[name=listType]').val(listType);
						});
						document.frm.submit();
			 		} else {
			 			var pageNum = num;
						$(function() {
						    $('input[name=keyword]').val(keyword);
						    $('input[name=pageNum]').val(pageNum);
						    $('input[name=listType]').val(listType);
						});
						document.frm.submit();
			 		}
			 	}
			</script>
			</c:if>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>