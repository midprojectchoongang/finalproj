<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	var chk = "";
	function idChk() {
		if ($('#c_id').val() == "") {
			$('#idDisp').html("");
			return;
		}
		var c_id = $('#c_id').val();
		$.ajax({
			url : 'idChk',
			type : 'post',
			data : {
				c_id : c_id
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					$('#idDisp').html("<b>사용 가능한 ID입니다</b>");
					chk = "y";
				} else {
					$('#idDisp').html("<b>이미 존재하는 ID입니다</b>");
					chk = "n";
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	function nickChk() {
		if ($('#nickname').val() == "") {
			$('#nickDisp').html("");
			return;
		}
		var nickname = $('#nickname').val();
		$.ajax({
			url : 'nickChk',
			type : 'post',
			data : {
				nickname : nickname
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					$('#nickDisp').html("<b>사용 가능한 닉네임입니다</b>");
					chk = "y";
				} else {
					$('#nickDisp').html("<b>이미 존재하는 닉네임입니다</b>");
					chk = "n";
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	function passwordChk() {
		if (frm.c_password.value != frm.c_password2.value) {
			alert("password check");
			frm.c_password.focus();
			frm.c_password.value = "";
			frm.c_password2.value = "";
			return false;
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
				<div class="col-md-12">
					<div class="row">
						<h2 class="heading-2">joinForm</h2>
						<form action="joinC" method="post" name="frm" onsubmit="return passwordChk()">
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_id">id</label>
									<input type="text" name="c_id" id="c_id" class="form-control" placeholder="Your id" required="required" autofocus="autofocus"
									onkeyup="idChk()">
								</div>								
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<div id="idDisp"></div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_password">password</label>
									<input type="password" name="c_password" id="c_password" class="form-control" placeholder="Your password" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_password2">password confirm</label>
									<input type="password" name="c_password2" id="c_password2" class="form-control" placeholder="Your password confirm" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="nickname">nickname</label>
									<input type="text" name="nickname" id="nickname" class="form-control" placeholder="Your nickname" required="required"
									onkeyup="nickChk()">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<div id="nickDisp"></div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="subject">email</label>
									<input type="email" name="email" id="email" class="form-control" placeholder="Your email" required="required">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label>prefered hashtag</label>
									<span id="warnDisp" style="color:red; font-weight: 900;"></span>
									<p class="tags" id="prehash"></p>
								</div>
							</div>
<!-- 							<div class="row form-group" align="center">
								<div class="col-md-8">
									<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
										style="width: 100%; text-align: center;">
								</div>
							</div> -->
							<div class="row form-group">
								<div class="col-md-12">
									<p class="tags">
										<c:forEach var="htl" items="${hashList }">
										<c:if test="${htl.kind == 'basic' }">
											<span class="tag">
												<a onclick="addPrehash('${htl.hash_title }')" class="name" style="cursor: pointer;">
													<i class="icon-tag"></i> ${htl.hash_title }
												</a>
											</span>
										</c:if>
										</c:forEach>
									</p>
								</div>
							</div>
							<script type="text/javascript">
/* 								function filter() {
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
								} */
								var hashtags = new Array();
								function addPrehash(hash_title) {
									$('#warnDisp').html('');
									if (hashtags.length < 3) {
										if (hashtags.length > 0) {
											hashtags[hashtags.length] = '<span class="tag" id="'+hash_title+'"><a onclick="removePrehash(\''+hash_title+
													'\')" class="name" style="cursor:pointer"><i class="icon-tag"></i> '+hash_title+'</a></span>';
											for (i=0; i<hashtags.length; i++) {
												if (i+1 == hashtags.length) {
													break;
												} else {
													for (j=i+1; j<hashtags.length; j++) {
														if (hashtags[i] == hashtags[j]) {
															hashtags.splice(j, 1);
															$('#warnDisp').html('&emsp;#HASHTAG는 중복하여 선택할 수 없습니다');
															return;
														} else {
															continue;
														}
													}
												}
											}
										} else {
											hashtags[0] = '<span class="tag" id="'+hash_title+'"><a onclick="removePrehash(\''+hash_title+
													'\')" class="name" style="cursor:pointer"><i class="icon-tag"></i> '+hash_title+'</a></span>';
										}
										
										if (hashtags.length > 1){
											$('#prehash').append(hashtags[hashtags.length-1]);
									    } else {
											$('#prehash').html(hashtags[0]);
									    }
									} else if (hashtags.length == 3) {
										$('#warnDisp').html('&emsp;#HASHTAG는 최대 3개까지만 선택할 수 있습니다');
									}
								}
								function removePrehash(hash_title) {
							        for (i=0; i<hashtags.length; i++) {
							        	var title = "#" + hash_title;
							            var search = hashtags[i].indexOf(hash_title);
							            if (search == -1) {
							            	continue;
							            } else {
							            	hashtags.splice(i,1); // 배열에서 삭제
							            	$(title).remove(); // 목록에서 삭제
							            }
							        }
								}
							</script>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

