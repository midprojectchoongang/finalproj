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
<!-- Map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db0dac3b0daa13d53c2ff56ca8789c9&libraries=services"></script>
<!-- Main -->
<script src="${path}/js/main.js"></script>
<link rel="stylesheet" href="${path }/slick/slick.css">
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css"/>
<script type="text/javascript" src="${path }/slick/slick.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style type="text/css">
	.slick-prev:before, .slick-next:before {
		color: black;
	}
	.customized {
		background: #212415;
		width: 80%;
	}
	#customized {
		display: inline-block;
		width: 400px;
		height: 400px;
		border: solid 1px #d2d2d2;
		text-align: center;
		margin: 25px;
		padding: 50px 0 0 40px;
		border-radius: 20px;
	}
	@media screen and (max-width: 600px) {
		.customized {
			width: 100%;
		}
		#customized {
			display: inline-block;
			width: 100%;
			height: 400px;
			border: solid 1px #d2d2d2;
			text-align: center;
			margin: 25px 0 25px 0;
			padding: 50px 0 0 30px;
			border-radius: 20px;
		}
	}
</style>
<body>
<c:if test="${sessionScope.login == 'admin' }">
<font style="color: #F6490D; font-size: 13px; margin: 5px;">관리자모드</font>
</c:if>
<nav class="colorlib-nav navbar-static-top" role="navigation">
	<div class="top-menu">
		<div class="container">
		
			<div class="row">
				<div class="col-lg-12">
					<div id="colorlib-logo"><a href="${path}/main">VIEW</a></div>
				</div>
			</div>				

				<div class="row">
					<div class="col-xs-12 text-right menu-1">
						<ul>
							<li><a href="${path }/exList">exhibition</a></li>
							<c:if test="${sessionScope.login == 'biz' }">
							<li><a href="${path }/biz/exWriteForm">전시등록</a></li>
							<li><a href="${path }/biz/exList">전시관리</a></li>
							</c:if>
							<c:if test="${sessionScope.login == 'customer'}">
							<li><a href="${path }/cus/myExList">관심전시회</a></li>
							<li><a href="${path }/cus/ticketCal">TicketBook</a></li>
							</c:if>
							<c:if test="${sessionScope.login == 'admin'}">
							<li><a href="${path}/master/bizList">단체회원관리</a></li>
							<li><a href="${path}/master/cusList">일반회원관리</a></li>
							<li><a href="${path}/master/viewHashList">#hash목록</a></li>
							<li><a href="${path}/master/addHashForm">#hash추가</a></li>
							</c:if>
							<c:if test="${empty sessionScope.login }">
								<li><a href="${path}/bizLoginForm">단체회원로그인</a></li>
								<li><a href="${path}/loginFormC">개인회원로그인</a></li>
							</c:if>
							<c:if test="${sessionScope.login == 'biz' }">
								<li><a href="${path}/biz/ownHash">해쉬태그관리</a></li>
								<li><a href="${path}/biz/bizView">회원정보</a></li>
								<li><a href="${path}/bizLogout">로그아웃</a></li>
							</c:if>
							<c:if test="${sessionScope.login == 'customer'}">
								<li><a href="${path}/viewInfoC">회원정보</a></li>
								<li><a href="${path}/logoutC">로그아웃</a></li>
							</c:if>
							<c:if test="${sessionScope.login == 'admin'}">
								<li><a href="${path}/logoutC">로그아웃</a></li>
							</c:if>						
						</ul>
					</div>
				</div>
		</div>
	</div>
</nav>
</body>
</html>