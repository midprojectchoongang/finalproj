<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>VIEW</title>
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


<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}/ckeditor/contents.css">
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
<!-- fullcalendar -->
<link rel="stylesheet" href="${path}/fullcalendar/main.css">
<script src="${path}/fullcalendar/main.js"></script>
<script src="${path}/fullcalendar/ko.js"></script>
<!-- Animate.css -->
<link rel="stylesheet" href="${path}/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${path}/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${path}/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="${path}/css/magnific-popup.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="${path}/css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="${path}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${path}/css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="${path}/css/style.css">

<!-- Modernizr JS -->
<script src="${path}/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->

<!-- jQuery -->
<script src="${path}/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${path}/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${path}/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${path}/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="${path}/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="${path}/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="${path}/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/js/magnific-popup-options.js"></script>
<!-- Main -->
<script src="${path}/js/main.js"></script>
<!-- Map -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db0dac3b0daa13d53c2ff56ca8789c9&libraries=services"></script> -->
<body>
<nav class="colorlib-nav" role="navigation">
	<div class="top-menu">
		<div class="container">
			<div class="row">
				<div class="col-xs-3">
					<div id="colorlib-logo"><a href="main">VIEW</a></div>
				</div>
				<div class="col-xs-12 text-right menu-1">
					<ul>
						<li><a href="bizLoginForm">bizLogin</a></li>
						<li><a href="loginForm">loginForm</a></li>
						<li><a href="hashMenu">#hashMenu</a></li>
						<li><a href="exList">exhibition</a></li>
						<li><a href="ticketWriteForm">WriteForm</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
</body>
</html>