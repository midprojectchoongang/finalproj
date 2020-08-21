<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer id="colorlib-footer" role="contentinfo">
	<div class="container">
		<div class="row row-pb-md">
			<div class="col-md-3">
				<h2>Navigational</h2>
				<p>
					<ul class="colorlib-footer-links">
						<li><a href="#"><i class="icon-check"></i> Home</a></li>
						<li><a href="#"><i class="icon-check"></i> About Me</a></li>
						<li><a href="#"><i class="icon-check"></i> Blog</a></li>
						<li><a href="#"><i class="icon-check"></i> Travel</a></li>
						<li><a href="#"><i class="icon-check"></i> Lifestyle</a></li>
						<li><a href="#"><i class="icon-check"></i> Fashion</a></li>
						<li><a href="#"><i class="icon-check"></i> Health</a></li>
					</ul>
				</p>
			</div>
			<div class="col-md-3">
				<h2>Recent Post</h2>
				<div class="f-blog">
					<a href="blog.jsp" class="blog-img" style="background-image: url(images/blog-1.jpg);">
					</a>
					<div class="desc">
						<h3><a href="blog.jsp">Be a designer</a></h3>
						<p class="admin"><span>25 March 2018</span></p>
					</div>
				</div>
				<div class="f-blog">
					<a href="blog.jsp" class="blog-img" style="background-image: url(images/blog-2.jpg);">
					</a>
					<div class="desc">
						<h3><a href="blog.jsp">How to build website</a></h3>
						<p class="admin"><span>24 March 2018</span></p>
					</div>
				</div>
				<div class="f-blog">
					<a href="blog.jsp" class="blog-img" style="background-image: url(images/blog-3.jpg);">
					</a>
					<div class="desc">
						<h3><a href="blog.jsp">Create website</a></h3>
						<p class="admin"><span>23 March 2018</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<h2>Archive</h2>
				<p>
					<ul class="colorlib-footer-links">
						<li><a href="#"><i class="icon-check"></i> February 2018</a></li>
						<li><a href="#"><i class="icon-check"></i> January 2018</a></li>
						<li><a href="#"><i class="icon-check"></i> December 2017</a></li>
						<li><a href="#"><i class="icon-check"></i> November 2017</a></li>
						<li><a href="#"><i class="icon-check"></i> October 2017</a></li>
						<li><a href="#"><i class="icon-check"></i> September 2017</a></li>
					</ul>
				</p>
			</div>
			<div class="col-md-3">
				<h2>Tags</h2>
				<p class="tags">
					<c:forEach var="htl" items="${hashtagList }">
						<span><a href="#"><i class="icon-tag"></i> ${htl.hash_title }</a></span>
					</c:forEach>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<p>
					<small class="block"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small> 
					<small class="block">Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a></small>
				</p>
			</div>
		</div>
	</div>
</footer>
<div class="gototop js-top">
	<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>
</body>
</html>