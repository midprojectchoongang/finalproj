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
		<div class="row headbox"><h2 class="heading-2">티켓등록</h2></div>
			<div class="container" align="center">
				<div class="col-md-9">
					<div class="row">
						<form action="${path }/ticketWrite" enctype="multipart/form-data" method="post">
						<input type="hidden" name="c_id" value="${c_id }">
						<div class="row formbox">
							<div class="row form-group">
								<div class="col-md-12">
									<div id="select_img" class="row-pb-sm">
										<img src="" />
									</div>					
								</div>							
								<div class="col-md-12">
									<input type="file" name="file" id="file" class="form-control" required="required">
									<script>
										$("#file").change(function(){
									 		if(this.files && this.files[0]) {
									 		  	var reader = new FileReader;
									   			reader.onload = function(data) {
									  				$("#select_img img").attr("src", data.target.result);
									  				$("#select_img img").attr("class", "img-thumbnail");   
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
									<input type="date" name="visit_date" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<script>
										window.onload = function() {
											ck = CKEDITOR.replace("content", {
												height : 350
											});
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

