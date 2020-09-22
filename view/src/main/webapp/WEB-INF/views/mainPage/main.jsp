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
		<div class="slider-for customized">
			<c:forEach items="${slideList }" var="sl">
			    <div><a href="exView?exhibition_no=${sl.exhibition_no }">
			    <img src="${path }/exImg/${sl.filename }" style="max-height: 400px; margin: 50px; outline: none;">
			    </a></div>
		    </c:forEach>
		</div>
		<script type="text/javascript">
			$('.slider-for').slick({
				centerMode: true,
				dots: true,
				arrows: true,
				slidesToShow: 3,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 3000,
				variableWidth: true,
				responsive: [{
					breakpoint: 600,
					settings: {
						centerMode: true,
				        centerPadding: '40px',
						slidesToShow: 1,
						arrows: false
					}
				}]
			});
		</script>
		
		<div style="height: 100px;"></div>

		<div id="colorlib-container">
			<div class="container-fluid">
				<div class="col-md-9">
				<div class="row">
				<!-- 해쉬태그 기반 -->
					<c:if test="${hashList == 'n' }">
						<div class="headbox-sm"><h1 class="heading-2-m">Issue #hash</h1></div>
					</c:if>
					<c:if test="${hashList == 'y' }">
						<div class="headbox-sm">
							<a href="exList?listType=p">
							<h1 class="heading-2-m">My #hash</h1>
							</a>
						</div>
					</c:if>
				<div class="row row-pb-md">
					<c:forEach items="${rcmdList }" var="rl">
					<div class="col-md-3" style="display: inline-block; min-width: 300px;">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="exView?exhibition_no=${rl.exhibition_no }">
								<img src="${path }/exImg/${rl.filename }" class="img-responsive" style="outline: none; max-height: 400px;"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="exView?exhibition_no=${rl.exhibition_no }">${rl.gallery }</a></span><br>
									<fmt:formatDate value="${rl.start_date }" pattern="yy/MM/dd" var="start"/>
									<fmt:formatDate value="${rl.end_date }" pattern="yy/MM/dd" var="end"/>
									<span class="date">${start } ~ ${end }</span>
								</p>
								<h2><a href="exView?exhibition_no=${rl.exhibition_no }">${rl.title }</a></h2>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<!-- 코멘트 기반 -->
				<div class="row row-pb-md">
					<div class="headbox-sm">
						<a href="#">
						<h1 class="heading-2-m">Comments</h1>
						</a>
					</div>
					<c:forEach items="${cmtList }" var="cl">
					<!-- display: inline; margin: 0 20px 0 20px; -->
					<div class="col-md-3" style="display: inline-block; min-width: 300px;">
						<div class="blog-entry">
							<div class="blog-img">
								<a href="exView?exhibition_no=${cl.exhibition_no }">
								<img src="${path }/exImg/${cl.filename }" class="img-responsive" style="outline: none; max-height: 400px;"></a>
							</div>
							<div class="desc">
								<p class="meta">
									<span class="cat"><a href="exView?exhibition_no=${cl.exhibition_no }">${cl.gallery }</a></span><br>
									<fmt:formatDate value="${cl.start_date }" pattern="yy/MM/dd" var="start"/>
									<fmt:formatDate value="${cl.end_date }" pattern="yy/MM/dd" var="end"/>									
									<span class="date">${start } ~ ${end }</span>
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
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>