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
				tag[i].style.display = "block";
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
		<div id="colorlib-container" align="center">
			<div class="container">
			<div class="col-md-9">
				<div class="row-pb-lg">
					<div class="row headbox-sm"><h2 class="heading-2-b">검색</h2></div>
					<div class="row-pb-sm">
						<div class="col-md-12">
							<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
								style="text-align: center;" class="form-control">
						</div>
					</div>
				</div>
				<div class="row-pb-lg">
					<div class="row headbox-sm"><h2 class="heading-2-b">BASIC</h2></div>
					<div class="row-pb-md">
					<div class="col-md-12">
						<p class="tags">
							<c:forEach var="htl" items="${hashList }">
							<c:if test="${htl.kind == 'basic' }">
								<span class="tag">
									<a href="${path }/exList?keyword=${htl.hash_title }" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
								</span>
							</c:if>
							</c:forEach>
						</p>
					</div>
					</div>
				</div>
				<div class="row-pb-lg">
					<div class="row headbox-sm"><h2 class="heading-2-b">CUSTOM</h2></div>
					<div class="row-pb-md">
					<div class="col-md-12">
						<p class="tags">
							<c:forEach var="htl" items="${hashList }">
							<c:if test="${htl.kind != 'basic' }">
								<span class="tag">
									<a href="${path }/exList?keyword=${htl.hash_title }" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
								</span>
							</c:if>
							</c:forEach>
						</p>
					</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>