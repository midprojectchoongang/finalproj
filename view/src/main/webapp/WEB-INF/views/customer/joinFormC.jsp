<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
	<script type="text/javascript">
		$(function() {
			var placeholderTarget = $('.formbox input[type="text"], .formbox input[type="password"], .formbox input[type="email"]');
			//포커스시
			placeholderTarget.on('focus', function() {
				$(this).siblings('label').fadeOut('fast');
			});
			//포커스아웃시
			placeholderTarget.on('focusout', function() {
				if ($(this).val() == '') {
					$(this).siblings('label').fadeIn('fast');
				}
			});
		});
	</script>
	<div id="colorlib-container" align="center">
	<div class="row headbox"><h2 class="heading-2">회원가입</h2></div>
		<div class="container">
			<div class="col-md-9">
				<div class="row">
					<form action="joinC" method="post" name="frm" onsubmit="return passwordChk()">
						<div class="row formbox">
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_id">아이디</label>
									<input type="text" name="c_id" id="c_id" class="form-control" onkeyup="idChk()">
									<div id="idDisp"></div>
								</div>								
							</div>
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
							</script>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_password">비밀번호</label>
									<input type="password" name="c_password" id="c_password" class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="c_password2">비밀번호 확인</label>
									<input type="password" name="c_password2" id="c_password2" class="form-control" onkeyup="passwordChk()">
									<div id="pwDisp"></div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
							function passwordChk() {
								if (frm.c_password.value != frm.c_password2.value) {
									$('#pwDisp').html("<b>비밀번호와 비밀번호 확인이 일치하지 않습니다</b>");
								} else {
									$('#pwDisp').html("");
								}
							}
						</script>
						<div class="row formbox">
							<div class="row form-group">
								<div class="col-md-12">
									<label for="nickname">닉네임</label>
									<input type="text" name="nickname" id="nickname" class="form-control" onkeyup="nickChk()">
									<div id="nickDisp"></div>
								</div>
							</div>
							<script type="text/javascript">
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
							</script>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="subject">이메일</label>
									<input type="email" name="email" id="email" class="form-control">
									<div id="emailDisp"></div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
							<fieldset>
								<legend>#HashTags</legend>
								<!-- <label>prefered #HashTag</label> -->
								<p class="tags" id="prehash" style="min-height: 35px;"></p>
								<div id="warnDisp" class="warn-style"></div>
							</fieldset>
							</div>
						</div>
<!-- 					<div class="row form-group" align="center">
							<div class="col-md-8">
								<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
									style="width: 100%; text-align: center;">
							</div>
						</div> -->
						<div class="row form-group">
							<div class="col-md-12">
							<fieldset>
								<p class="tags" align="center">
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
							</fieldset>
							</div>
						</div>
						<script type="text/javascript">
	/* 						function filter() {
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
							
							var hash_html = new Array();
							var hash_select = new Array();
							
							function addPrehash(hash_title) {
								$('#warnDisp').html('');
								if (hash_html.length < 3) {
									if (hash_html.length > 0) {
										hash_html[hash_html.length] = '<span class="tag" id="'+hash_title+'" style="float:inherit;">' +
												'<a onclick="removePrehash(\''+hash_title+'\')" class="name" style="cursor:pointer">' +
												'<i class="icon-tag"></i> '+hash_title+'</a></span>';
										hash_select[hash_select.length] = hash_title;
										for (i=0; i<hash_html.length; i++) {
											if (i+1 == hash_html.length) {
												break;
											} else {
												for (j=i+1; j<hash_html.length; j++) {
													if (hash_html[i] == hash_html[j]) {
														hash_html.splice(j, 1);
														hash_select.splice(j, 1);
														$('#warnDisp').html('&emsp;#HashTag는 중복하여 선택할 수 없습니다');
														return;
													} else {
														continue;
													}
												}
											}
										}
									} else {
										hash_html[0] = '<span class="tag" id="'+hash_title+'" style="float:inherit;">' +
												'<a onclick="removePrehash(\''+hash_title+'\')" class="name" style="cursor:pointer">' +
												'<i class="icon-tag"></i> '+hash_title+'</a></span>';
										hash_select[0] = hash_title;
									}			
									if (hash_html.length > 1){
										$('#prehash').append(hash_html[hash_html.length-1]);
								    } else {
										$('#prehash').html(hash_html[0]);
								    }
								} else if (hash_html.length == 3) {
									$('#warnDisp').html('&emsp;#HashTag는 최대 3개까지만 선택할 수 있습니다');
								}
							}
							
							function removePrehash(hash_title) {
						        for (i=0; i<hash_html.length; i++) {
						        	var title = "#" + hash_title;
						            var search = hash_html[i].indexOf(hash_title);
						            if (search == -1) {
						            	continue;
						            } else {
						            	hash_html.splice(i,1); // html태그 배열에서 삭제
						            	hash_select.splice(i,1); // 값이 저장된 배열에서 삭제
						            	$(title).remove(); // 화면에서 삭제
										$('#warnDisp').html(''); // 경고문구 삭제	            	
						            }
								}
							}
						</script>
						<input type="hidden" name="c_hashtag" value="" />
						<script type="text/javascript">
							function submit() {
								if (frm.c_id.value == "" || frm.c_id.value == null) {
									$('#idDisp').html("<b>ID를 적어주십시요</b>");
									frm.c_id.focus();
									return;
								} else if (frm.c_password.value == "" || frm.c_password.value == null) {
									$('#pwDisp').html("<b>비밀번호를 적어주십시요</b>");
									frm.c_password.focus();
									return;
								} else if (frm.nickname.value == "" || frm.nickname.value == null) {
									$('#nickDisp').html("<b>닉네임을 적어주십시요</b>");
									frm.nickname.focus();
									return;
								} else if (frm.email.value == "" || frm.email.value == null) {
									$('#emailDisp').html("<b>이메일을 적어주십시요</b>");
									frm.email.focus();
									return;
								} else if (frm.c_password.value != frm.c_password2.value) {
									$('#pwDisp').html("<b>비밀번호와 비밀번호 확인이 일치하지 않습니다</b>");
									frm.c_password2.focus();
									return;
								}
								var c_hashtag = new Object();
								c_hashtag.hash = hash_select;
								var values = JSON.stringify(c_hashtag);
								$(function() {
								    $('input[name=c_hashtag]').val(values);
								});
								document.frm.submit();
							}
						</script>
					</form>
					<button onclick="submit()" class="btn btn-primary">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>