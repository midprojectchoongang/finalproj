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
				<div class="row">
					<div class="col-xs-12">
						<h2>Tags</h2>
						<div class="row-pb-lg">
							<div class="col-xs-4">
								<input type="text" class="search">
							</div>
							<input type="submit" class="btn btn-outline" value="검색">
						</div>
					</div>
				</div>
				<div class="row-pb-lg">
					<div class="col-xs-12">
					<p class="tags">
						<span><a href="#" class="tag-active"><i class="icon-tag"></i> 조각</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 회화</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 공예</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 고전</a></span>
						<span><a href="#"><i class="icon-tag"></i> 현대</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 국내작가</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 해외작가</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 특별전시</a></span> 
						<span><a href="#"><i class="icon-tag"></i> 무료입장</a></span>
					</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>