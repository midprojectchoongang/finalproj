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
			<div class="container">
				<div class="col-md-12">
					<div class="row">
						<h2 class="heading-2">관람기록 작성하기</h2>
						<form action="ticketWrite" enctype="multipart/form-data" method="post">
							<input type="hidden" name="c_id" value="test">
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
									<label for="visit_date">관람일</label>
									<input type="date" name="visit_date" class="form-control" required="required">
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
								<input type="submit" value="Send Message" class="btn btn-primary">
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

