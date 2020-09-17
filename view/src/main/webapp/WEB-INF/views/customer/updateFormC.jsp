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
	<div class="row headbox"><h2 class="heading-2">개인정보 수정</h2></div>
		<div class="container">
			<div class="col-md-9">
				<div class="row">
					<form action="updateC" method="post" name="frm" onsubmit="return passwordChk()">
						<input type="hidden" name="c_id" value="${customerdto.c_id }">	
						<div class="row formbox">
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;비밀번호</b>
									<input type="password" name="c_password" id="c_password" class="form-control" required="required"
										value="${customerdto.c_password }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;비밀번호 확인</b>
									<input type="password" name="c_password2" id="c_password2" class="form-control" required="required"
										value="${customerdto.c_password }">
								</div>
							</div>
						</div>
						<script type="text/javascript">
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
						<div class="row formbox">
							<div class="row form-group">
								<div class="col-md-12" align="left">
									<b>&emsp;닉네임</b>
									<input type="text" name="nickname" id="nickname" class="form-control" required="required" onkeyup="nickChk()"
										value="${customerdto.nickname }" placeholder="${customerdto.nickname }">
									<div id="nickDisp" style="color:red; font-weight: 900; min-height: 35px;"></div>
								</div>
							</div>
							<script type="text/javascript">
								var chk = "";
								var cur_nick = '${customerdto.nickname }';
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
												$('#nickDisp').html("&emsp;<b>사용 가능한 닉네임입니다</b>");
												chk = "y";
											} else if (nickname == cur_nick) {
								                $('#nickDisp').html("&emsp;<b>현재 닉네임입니다</b>");
								                chk = "y";
								            } else {
												$('#nickDisp').html("&emsp;<b>이미 존재하는 닉네임입니다</b>");
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
								<div class="col-md-12" align="left">
									<b>&emsp;이메일</b>
									<input type="email" name="email" id="email" class="form-control" required="required" value="${customerdto.email }"
										placeholder="${customerdto.email }">
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label>prefered #HashTag</label>
								<p class="tags" id="prehash" style="min-height: 35px;"></p>
								<div id="warnDisp" style="color:red; font-weight: 900; min-height: 35px;"></div>
							</div>
						</div>
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
							var hash_html = new Array();
							var hash_select = new Array();
							var tags = ${selectedHash };
							
							for (i=0; i<tags.length; i++) {
								addPrehash(tags[i]);
							}
							
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
					</form>
					<div class="form-group" style="text-align: center;">
						<button onclick="submit()" class="btn btn-primary">수정</button>
						<button onclick="cancel()" class="btn btn-cta">취소</button>
					</div>
					<script type="text/javascript">
						function submit() {
							var c_hashtag = new Object();
							c_hashtag.hash = hash_select;
							var values = JSON.stringify(c_hashtag);
							$(function() {
							    $('input[name=c_hashtag]').val(values);
							});
							document.frm.submit();
						}
						
						function cancel() {
							history.back();
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>