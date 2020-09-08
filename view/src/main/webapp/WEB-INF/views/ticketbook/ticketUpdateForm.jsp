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
			
			$('#file_input').hide('fast');
		});
		</script>
		<div id="colorlib-container">
			<div class="container" align="center">
				<div class="col-md-9">
					<div class="row">
						<div class="row headbox"><h2 class="heading-2">티켓수정</h2></div>
						<form action="ticketUpdate" enctype="multipart/form-data" method="post">
						<div class="row formbox">
						<input type="hidden" name="ticketbook_no" value="${ticket.ticketbook_no }">
						<input type="hidden" name="oldFilename" value="${ticket.filename }">
						<input type="hidden" name="fileChange" id="fileChange" value="n">
							<div class="row form-group">
								<div class="col-md-12">
									<div id="select_img" class="row-pb-sm col-md-6">
										<img src="ticketImg/${ticket.filename }" class="img-thumbnail">
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
							<div class="row form-group">
								<div class="col-md-12">
									<input type="text" name="title" value="${ticket.title }" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="date" name="visit_date" value="${ticket.visit_date }" class="form-control" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<script>
										window.onload = function() {
											ck = CKEDITOR.replace("content");
										};
									</script>
									<textarea name="content" rows=10>${ticket.content }</textarea>
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

