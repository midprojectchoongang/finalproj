<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="header.jsp"%>
		<div id="colorlib-container">
			<div class="container">
				<div class="col-md-12">
					<div class="row">
							<h2 class="heading-2">Get In Touch</h2>
							<form action="#">
								<div class="row form-group">
									<div class="col-md-6">
										<label for="fname">First Name</label>
										<input type="text" id="fname" class="form-control" placeholder="Your firstname">
									</div>
									<div class="col-md-6">
										<label for="lname">Last Name</label>
										<input type="text" id="lname" class="form-control" placeholder="Your lastname">
									</div>
								</div>
									<div class="row form-group">
									<div class="col-md-12">
										<label for="email">Email</label>
										<input type="text" id="email" class="form-control" placeholder="Your email address">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="subject">Subject</label>
										<input type="text" id="subject" class="form-control" placeholder="Your subject of this message">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="subject">Poster</label>
										<input type="file" id="poster" class="form-control">
									</div>
								</div>
									<div class="row form-group">
									<div class="col-md-12">
										<label for="message">Message</label>
										<script>
											window.onload = function() {
												ck = CKEDITOR.replace("editor");
											};
										</script>
										<textarea id="editor" rows=10></textarea>
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
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>

