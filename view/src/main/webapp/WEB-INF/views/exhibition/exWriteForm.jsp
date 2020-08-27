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
						<div class="row headbox"><h2 class="heading-2">전시회 등록</h2></div>
						<form action="exWrite" enctype="multipart/form-data" method="post">
						<div class="row formbox">
							<input type="hidden" name="b_id" value="b_id">
							<div class="row form-group">
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
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="title">제목</label>
									<input type="text" name="title" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="artist">아티스트</label>
									<input type="text" name="artist" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="gallery">갤러리</label>
									<input type="text" name="gallery" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="gallery_site">갤러리 사이트</label>
									<input type="text" name="gallery_site" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="local_no">지역</label>
									<input type="text" name="local_no" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="address">갤러리 주소</label>
									<input type="text" name="address" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="ticket_link1">예매 사이트1</label>
									<input type="text" name="ticket_link1" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="ticket_link2">예매 사이트2</label>
									<input type="text" name="ticket_link2" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="ticket_link3">예매 사이트3</label>
									<input type="text" name="ticket_link3" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="price">입장권</label>
									<input type="text" name="price" class="form-control" required="required">
								</div>
							</div>																																																																					
							<div class="row form-group">														
								<div class="col-md-12">
									전시회 시작일
									<input type="date" name="start_date" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									전시회 마감일
									<input type="date" name="end_date" class="form-control" required="required">
								</div>
							</div>						
							<div class="row form-group">
								<div class="col-md-12">
									<label for="hashtags">해시태그</label>
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
									<textarea name="content" rows=10></textarea>
								</div>
							</div>
							<div class="form-group" style="text-align: center;">
								<input type="submit" value="등록" class="btn btn-primary">
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

