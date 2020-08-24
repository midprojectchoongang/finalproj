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
		<%@ include file="header.jsp"%>
		<div id="colorlib-container">
			<div class="container">
				<div class="row">
					<div class="col-xs-12" align="center">
						<h2>Tags</h2>
						<div class="row-pb-lg">
							<div class="col-xs-12">
								<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
									style="width: 40%; text-align: center;">
							</div>
						</div>
					</div>
				</div>
				<div class="row-pb-lg">
					<div class="col-xs-12">
					<p class="tags">
						<c:forEach var="htl" items="${hashList }">
							<span class="tag"><a href="#" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a></span>
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