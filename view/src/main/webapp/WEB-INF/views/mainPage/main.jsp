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
		
		<!-- Slide -->
		<div class="slider-for" style="background: #212415;">
			<c:forEach items="${slideList }" var="sl">
			    <div><a href="exView?exhibition_no=${sl.exhibition_no }">
			    <img src="${path }/exImg/${sl.filename }" style="max-height: 400px; margin: 50px; border: none; outline: none; text-decoration: none;">
			    </a></div>
		    </c:forEach>
		</div>
		<script type="text/javascript">
			$('.slider-for').slick({
				centerMode: true,
				dots: true,
				slidesToShow: 3,
				autoplay: true,
				autoplaySpeed: 3000,
				variableWidth: true,
				responsive: [{
					breakpoint: 480,
					settings: {
						centerMode: true,
				        centerPadding: '40px',
						slidesToShow: 1
					}
				}]
			});
		</script>
		
		<div style="height: 100px;"></div>

		<div id="colorlib-container">
			<div class="container">
			
				<!-- 해쉬태그 기반 -->
				<div class="row row-pb-md" style="border: red 1px solid;">
					<c:if test="${sessionScope.login != 'customer' }"><h2>요새 유행하는 전시회</h2></c:if>
					<c:if test="${sessionScope.login == 'customer' }"><h2>내가 관심 가질만한 전시회</h2><a href="exList?listType=p">더보기</a></c:if>
					<c:forEach items="${rcmdList }" var="rl">
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="exView?exhibition_no=${rl.exhibition_no }">
								<img src="${path }/exImg/${rl.filename }" class="img-responsive" style="outline: none;"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="exView?exhibition_no=${rl.exhibition_no }">${rl.gallery }</a></span>
									<span class="date">${rl.reg_date } ~ ${rl.end_date }</span>
								</p>
								<h2><a href="exView?exhibition_no=${rl.exhibition_no }">${rl.title }</a></h2>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<!-- 코멘트 기반 -->
				<div class="row row-pb-md" style="border: red 1px solid;">
					<h2>후기 많은 전시회</h2><a href="#">더보기</a>
					<c:forEach items="${cmtList }" var="cl">
					<div class="col-md-4">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="exView?exhibition_no=${cl.exhibition_no }">
								<img src="${path }/exImg/${cl.filename }" class="img-responsive" style="outline: none;"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="exView?exhibition_no=${cl.exhibition_no }">${cl.gallery }</a></span>
									<span class="date">${cl.reg_date } ~ ${cl.end_date }</span>
								</p>
								<h2><a href="exView?exhibition_no=${cl.exhibition_no }">${cl.title }</a></h2>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
<!-- 			<div class="row row-pb-md"> // 동영상
					<div class="col-md-8">
						<div class="blog-entry">
							<div class="blog-img">
								<div class="video colorlib-video" style="background-image: url(images/blog-8.jpg);">
									<a href="https://www.youtube.com/watch?v=Mpdvwlnjyys" class="popup-vimeo"><i class="icon-play"></i></a>
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
				</div> -->
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>