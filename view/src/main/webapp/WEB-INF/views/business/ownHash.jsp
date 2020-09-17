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
		<div class="row headbox"><h2 class="heading-2">My #hash</h2></div>
			<div class="container">
			<div class="col-md-9">
				<div class="row-pb-sm">
					<div class="row-pb-sm">
						<div class="col-md-12">
							<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
								style="text-align: center;" class="form-control"><br>
							<div style="cursor: pointer;" class="btn btn-primary" onclick="addNewHash()" id="addBtn">추가</div>
						</div>
					</div>
					<div class="row-pb-sm">
						<div class="col-md-12">
							<div id="warnDisp" class="warn-style"></div>
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
										$('#customHash').append('<span class="tag"><a href="#" class="name" onclick="deleteHash(\''+hashName+'\')"' +
												' id="'+hashName+'"><i class="icon-tag"></i> '+hashName+'</a></span>');
										$('#warnDisp').html('');
									} else {
										$('#warnDisp').html('&emsp;이미 존재하는 #HashTag입니다');
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
					<div class="row-pb-md formbox">
						<div class="col-md-12">
							<p class="tags" id="customHash">
								<c:forEach var="ohl" items="${ownHash }">
									<span class="tag">
										<a href="#" class="name" onclick="deleteHash('${ohl.hash_title }')" id="${ohl.hash_title }">
											<i class="icon-tag"></i> ${ohl.hash_title }
										</a>
									</span>
								</c:forEach>
							</p>
							<script type="text/javascript">
								function deleteHash(hash_title) {
									if (confirm("'"+hash_title+"' 태그를 삭제하시겠습니까?\n앞으로 목록에서 다시 선택할 수 없으며,\n이미 게시물에 등록된 태그는 삭제되지 않습니다")) {
										$.ajax({
											url : '${path}/deleteHash',
											type : 'post',
											data : {
												hash_title : hash_title
											},
											success : function(data) {
												if ($.trim(data) == 0) {
										        	var title = "#" + hash_title;
										            $(title).remove(); // 화면에서 삭제
												} else {
													alert("ERROR");
												}
											},
											error : function() {
												alert("ERROR");
											}
										});
									} else {
										return false;
									}
								}
							</script>
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