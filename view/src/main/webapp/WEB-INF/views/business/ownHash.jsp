<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">

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
				
					function addNewHash() {
						if ($('#keyword').val() == "") {
							$('#warnDisp').html('&emsp;생성하고 싶은 #HashTag를 먼저 입력하여 주십시요');
							$('#keyword').focus();
						} else {
							var hashName = $('#keyword').val();
							$.ajax({
								url : 'addHashChk',
								type : 'post',
								data : {
									hashName : hashName
								},
								success : function(data) {
									if ($.trim(data) == 0) {
										$('#customHash').append('<span class="tag" name="taglists">' +
												'<a onclick="addPrehash(\''+hashName+'\')" class="name" style="cursor: pointer;">' +
												'<i class="icon-tag"></i> '+hashName+'</a></span>');
									} else {
										$('#warnDisp').html('&emsp;이미 사용중인 #HashTag입니다');
									}
								},
								error : function() {
									alert("ERROR");
								}
							});
						}
					}
				</script>
				<div class="row-pb-lg">
					<div class="row headbox-sm"><h2 class="heading-2-b">#HASHTAG</h2></div>
					<div class="row-pb-md">
						<div class="col-md-12">
							<p class="tags" id="customHash">
								<c:forEach var="ohl" items="${ownHash }">
									<span class="tag">
										<a href="#" class="name"><i class="icon-tag"></i> ${ohl.hash_title }</a>
									</span>
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