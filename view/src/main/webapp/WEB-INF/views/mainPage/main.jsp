<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
<%@ include file="header.jsp" %>
	<div align="center">
	
		<!-- 메인 사진 슬라이더 -->
		<aside id="colorlib-hero">
			<div class="flexslider" style="max-width:1500px;">
				<ul class="slides">
					<c:forEach items="${exList }" var="el">
					<li style="background-image: url(${path }/exImg/${el.filename })">
						<div class="overlay"></div>
						<div class="container">	
							<div class="row">
								<div class="col-md-6 col-md-pull-3 col-sm-12 col-xs-12 col-md-offset-3 slider-text">
									<div class="slider-text-inner">
										<div class="desc">
											<div style="height:50px;">
												<div style="float: left; font-weight: 900;">${el.gallery }</div>
												<div style="float: right; text-align: right; font-size: 15px;">${el.start_date } ~ ${el.end_date }</div>
											</div>
											<h1><a href="exView?exhibition_no=${el.exhibition_no }">${el.title }</a></h1>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</aside>
	
		<!-- 게시물 미리보기 -->
		<div id="colorlib-container">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="blog.jsp"><img src="images/blog-1.jpg" class="img-responsive"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="#">Events</a></span>
									<span class="date">20 March 2018</span>
									<span class="pos">By <a href="#">Rich</a></span>
								</p>
								<h2><a href="blog.jsp">Recipe for your site</a></h2>
								<p>(hashtags)</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="blog.jsp"><img src="${path}/images/blog-2.jpg" class="img-responsive" alt="html5 bootstrap template"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="#">Read</a></span>
									<span class="date">20 March 2018</span>
									<span class="pos">By <a href="#">Rich</a></span>
								</p>
								<h2><a href="blog.jsp">Recipe for your site</a></h2>
								<p>(hashtags)</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-slider">
								<div class="owl-carousel">
									<div class="item">
										<a href="blog.jsp" class="image-popup-link">
										<img src="${path}/images/blog-3.jpg" class="img-responsive" alt="html5 bootstrap template"></a>
									</div>
									<div class="item">
										<a href="blog.jsp" class="image-popup-link">
										<img src="images/blog-4.jpg" class="img-responsive" alt="html5 bootstrap template"></a>
									</div>
								</div>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="#">Travel</a></span>
									<span class="date">20 March 2018</span>
									<span class="pos">By <a href="#">Rich</a></span>
								</p>
								<h2><a href="blog.jsp">Recipe for your site</a></h2>
								<p>(hashtags)</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row row-pb-md">
					<div class="col-md-8">
						<div class="blog-entry">
							<div class="blog-img">
								<div class="video colorlib-video" style="background-image: url(images/blog-8.jpg);">
									<a href="https://vimeo.com/channels/staffpicks/93951774" class="popup-vimeo"><i class="icon-play"></i></a>
									<div class="overlay"></div>
								</div>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="#">Watch</a></span>
									<span class="date">20 March 2018</span>
									<span class="pos">By <a href="#">Rich</a></span>
								</p>
								<h2><a href="blog.jsp">Watch our video how to make website</a></h2>
								<p>(hashtags)</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="blog.jsp"><img src="${path}/images/blog-7.jpg" class="img-responsive" alt="html5 bootstrap template"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="#">Events</a></span>
									<span class="date">20 March 2018</span>
									<span class="pos">By <a href="#">Rich</a></span>
								</p>
								<h2><a href="blog.jsp">Recipe for your site</a></h2>
								<p>(hashtags)</p>
							</div>
						</div>
					</div>
				</div>
				<!-- paging
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="pagination">
							<li class="disabled"><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
				 -->
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>