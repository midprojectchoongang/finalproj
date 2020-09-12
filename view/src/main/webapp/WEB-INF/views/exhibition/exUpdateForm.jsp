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
		$(function() {
			var placeholderTarget = $('.formbox input[type="text"]');
			//포커스시
			placeholderTarget.on('focus', function() {
				$(this).siblings('label').fadeOut('fast');
			});
			//포커스아웃시
			placeholderTarget.on('focusout', function() {
				if ($(this).val() == '') {
					$(this).siblings('label').fadeIn('fast');
				}
			});
			
		});
		</script>
		<div id="colorlib-container">
			<div class="container" align="center">
				<div class="col-md-9">
					<div class="row">
						<div class="row headbox"><h2 class="heading-2">전시회 정보 수정</h2></div>
						<form action="${path }/exUpdate" enctype="multipart/form-data" method="post">
						<div class="row formbox">							
							<input type="hidden" name="exhibition_no" value="${ex.exhibition_no}">
							<input type="hidden" name="oldFilename" value="${ex.filename }">
							<input type="hidden" name="fileChange" id="fileChange" value="n">
							<div class="row form-group">
								<div class="col-md-12">
									<div id="select_img" class="row-pb-sm col-md-6">
										<img src="${path }/exImg/${ex.filename }" class="img-thumbnail">
									</div>
									<input type="file" name="file" id="file" class="form-control">
									<script>
										$("#file").change(function(){
									 		if(this.files && this.files[0]) {
									 		  	var reader = new FileReader;
									   			reader.onload = function(data) {
									  				$("#select_img img").attr("src", data.target.result);        
											    }
									   			reader.readAsDataURL(this.files[0]);
									   			$('#fileChange').attr('value','y');
									   		}
									 	});
									 </script>
								</div>
							</div>							
							<%-- <div class="row form-group">
								<div class="col-md-12">
									<input type="file" name="file" id="file" class="form-control" required="required">
									<div class="select_img"><img src="" /></div>
									<%=request.getRealPath("/") %>
									<script>
										$("#file").change(function(){
									 		if(this.files && this.files[0]) {
									 		  	var reader = new FileReader;
									   			reader.onload = function(data) {
									  				$(".select_img img").attr("src", data.target.result).width(300);        
											    }
									   			reader.readAsDataURL(this.files[0]);
									   		}
									 	});
									 </script>
								</div>
							</div> --%>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;전시회명</b>
									<input type="text" name="title" class="form-control" required="required" 
									value="${ex.title }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;아티스트</b>
									<input type="text" name="artist" class="form-control" required="required"
									 value="${ex.artist }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;갤러리</b>
									<input type="text" name="gallery" class="form-control" required="required"
									 value="${ex.gallery }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;갤러리 주소</b>
									<input type="text" name="address" class="form-control" required="required"
									 value="${ex.address }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;예매 사이트1</b>
									<input type="text" name="ticket_link1" class="form-control" required="required"
									 value="${ex.ticket_link1 }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;예매 사이트2</b>
									<input type="text" name="ticket_link2" class="form-control" required="required"
									value="${ex.ticket_link2 }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;예매 사이트3</b>
									<input type="text" name="ticket_link3" class="form-control" required="required"
									 value="${ex.ticket_link3 }">
								</div>
							</div>							
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;입장권 가격</b>
									<input type="text" name="price" class="form-control" required="required"
									 value="${ex.price }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;전시회 시작일</b>
									<input type="date" name="start_date" class="form-control" required="required" value="${ex.start_date }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;전시회 마감일</b>
									<input type="date" name="end_date" class="form-control" required="required" value="${ex.end_date }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;해시태그</b>
									<input type="text" name="hashtags" class="form-control" required="required">
								</div>
							</div>											
							<div class="row form-group">
								<div class="col-md-12">
									<script>
										window.onload = function() {
											ck = CKEDITOR.replace("content");
										};
									</script>
									<textarea name="content" rows=30>${ex.content }</textarea>
								</div>
							</div>
							<div class="form-group" style="text-align: center;">
								<input type="submit" value="등록" class="btn btn-primary">
								<button onclick="location.href='${path }/exView?exhibition_no=${ex.exhibition_no }&pageNum=${pageNum }'" class="btn btn-cta">
								취소</button>
							</div>
						</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

