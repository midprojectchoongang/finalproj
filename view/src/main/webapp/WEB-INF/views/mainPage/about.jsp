<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Stuff Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<!-- Facebook and Twitter integration -->
<meta property="og:title" content=""/>
<meta property="og:image" content=""/>
<meta property="og:url" content=""/>
<meta property="og:site_name" content=""/>
<meta property="og:description" content=""/>
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
	<%@ include file="header.jsp" %>
	<aside id="colorlib-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12 breadcrumbs text-center">
					<h2>About Me</h2>
					<p><span><a href="main.jsp">Home</a></span> / <span>About</span></p>
				</div>
			</div>
		</div>
	</aside>
	<div id="colorlib-container">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img class="img-responsive" src="images/author.jpg" alt="">
				</div>
				<div class="col-md-6">
					<p>Hi! My Name is <strong>Rich</strong>
						Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.
						Pityful a rethoric question ran over her cheek, then she continued her way.
					</p>
					<blockquote>A small river named Duden flows by their place and supplies it with the necessary regelialia.
						It is a paradisematic country, in which roasted parts of sentences fly into your mouth.
					</blockquote>
					<p class="first-letra">Far far away, <strong><a href="#">behind the word mountains</a></strong>
						, far from the countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.
						A small river named Duden flows by their place and supplies it with the necessary regelialia.
						It is a paradisematic country, in which roasted parts of sentences fly into your mouth.
					</p>
					<p>
						<ul class="colorlib-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>

