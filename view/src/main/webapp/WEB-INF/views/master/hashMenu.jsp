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
				<div class="row">
					<div class="col-xs-12" align="center">
						<div class="row-pb-lg">
							<div class="col-xs-6">
								<h2>Tag List</h2>
								<button onclick="location.href='viewHashList'"> List </button>
							</div>
							<div class="col-xs-6">
								<h2>Add Tags</h2>
								<button onclick="location.href='addHashForm'"> Add </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>