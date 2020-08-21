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
						<c:forEach var="htl" items="${hashList }">
							<span><a href="#"><i class="icon-tag"></i> ${htl.hash_title }</a></span> 
						<!-- <span><a href="#" class="tag-active"><i class="icon-tag"></i> 조각</a></span>  -->
						</c:forEach>
					</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>