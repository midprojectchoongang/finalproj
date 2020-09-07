<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function filter() {
		var keyword, name, tag, i;
		keyword = document.getElementById("keyword").value.toUpperCase();
		tag = document.getElementsByClassName("tag");
		for (i=0; i<tag.length; i++) {
			name = tag[i].getElementsByClassName("name");
			if(name[0].innerHTML.toUpperCase().indexOf(keyword) > -1) {
				tag[i].style.display = "flex";
			} else {
				tag[i].style.display = "none";
			}
		}
	}
</script>
</head>
<body>
<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container">
			<div class="container">
				<div class="row">
					<div class="col-xs-12" align="center">
						<h2>Search</h2>
						<div class="row-pb-lg">
							<div class="col-xs-12">
								<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
									style="width: 40%; text-align: center;">
							</div>
						</div>
					</div>
				</div>
				<div class="row-pb-lg" align="center">
					<div class="col-xs-4">
						<h2>BASIC</h2>
					</div>
					<div class="col-xs-8">
						<p class="tags">
							<c:forEach var="htl" items="${hashList }">
							<c:if test="${htl.kind == 'basic' }">
								<span class="tag">
									<a href="hashDetail?hash_title=${htl.hash_title }" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
								</span>
							</c:if>
							</c:forEach>
						</p>
					</div>
				</div>
				<div class="row-pb-lg" align="center">
					<div class="col-xs-4">
						<h2>CUSTOM</h2>
					</div>
					<div class="col-xs-8">
						<p class="tags">
							<c:forEach var="htl" items="${hashList }">
							<c:if test="${htl.kind != 'basic' }">
								<span class="tag">
									<a href="hashDetail?hash_title=${htl.hash_title }" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
								</span>
							</c:if>
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>