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
			var placeholderTarget = $('.formbox input[type="text"]');
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
	<div id="colorlib-container">
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row">
					<div class="row headbox"><h2 class="heading-2">전시회 등록</h2></div>
					<form action="exWrite" enctype="multipart/form-data" method="post">
					<div class="row formbox">
						<input type="hidden" name="b_id" value="${b_id}">
						<div class="row form-group">
							<div class="col-md-12">
								<input type="file" name="file" id="file" class="form-control" required="required">
								<div class="select_img"><img src="" /></div>
								<%=request.getRealPath("/") %>
								<script>
									$("#file").change(function(){
								 		if(this.files && this.files[0]) {
								 		  	var reader = new FileReader;
								   			reader.onload = function(data) {
								  				$(".select_img img").attr("src", data.target.result).width(300);        
										    }
								   			reader.readAsDataURL(this.files[0]);
								   		}
								 	});
								 </script>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="title">전시회명</label>
								<input type="text" name="title" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="artist">아티스트</label>
								<input type="text" name="artist" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="gallery">갤러리</label>
								<input type="text" name="gallery" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="gallery_site">갤러리 사이트</label>
								<input type="text" name="gallery_site" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="local_no">지역</label>
								<input type="text" name="local_no" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="address">갤러리 주소</label>
								<input type="text" name="address" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="ticket_link1">예매 사이트1</label>
								<input type="text" name="ticket_link1" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="ticket_link2">예매 사이트2</label>
								<input type="text" name="ticket_link2" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="ticket_link3">예매 사이트3</label>
								<input type="text" name="ticket_link3" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="price">입장권 가격</label>
								<input type="text" name="price" class="form-control" required="required">
							</div>
						</div>																	
						<div class="row form-group">														
							<div class="col-md-12">
								전시회 시작일
								<input type="date" name="start_date" class="form-control" required="required">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								전시회 마감일
								<input type="date" name="end_date" class="form-control" required="required">
							</div>
						</div>						
						<div class="row form-group">
							<div class="col-md-12">
								<script>
									window.onload = function() {
										ck = CKEDITOR.replace("content");
									};
								</script>
								<textarea name="content" rows=10></textarea>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<div class="col-md-8">
									<input onkeyup="filter()" type="text" name="keyword" id="keyword" placeholder="Search #HASH"
										style="width: 100%; text-align: center;">
								</div><br>
								<p class="tags" id="prehash" style="min-height: 35px;"></p>
								<div id="warnDisp" style="color:red; font-weight: 900; min-height: 35px;"></div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<p class="tags">
									<c:forEach var="htl" items="${hashList }">
										<span class="tag" name="taglists">
											<a onclick="addPrehash('${htl.hash_title }')" class="name" style="cursor: pointer;">
												<i class="icon-tag"></i> ${htl.hash_title }
											</a>
										</span>
									</c:forEach>
								</p>
							</div>
						</div>
						<script type="text/javascript">
	 						function filter() {
								var keyword, name, tag, i;
								keyword = document.getElementById("keyword").value.toUpperCase();
								tag = document.getElementsByName("taglists");
								for (i=0; i<tag.length; i++) {
									name = tag[i].getElementsByClassName("name");
									if(name[0].innerHTML.toUpperCase().indexOf(keyword) > -1) {
										tag[i].style.display = "flex";
									} else {
										tag[i].style.display = "none";
									}
								}
							}
							
							var hash_html = new Array();
							var hash_select = new Array();
							var max_hashtag = 5;
							
							function addPrehash(hash_title) {
								$('#warnDisp').html('');
								if (hash_html.length < max_hashtag) {
									if (hash_html.length > 0) {
										hash_html[hash_html.length] = '<span class="tag" id="'+hash_title+'" style="float:inherit;">' +
												'<a onclick="removePrehash(\''+hash_title+'\')" style="cursor:pointer">' +
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
												'<a onclick="removePrehash(\''+hash_title+'\')" style="cursor:pointer">' +
												'<i class="icon-tag"></i> '+hash_title+'</a></span>';
										hash_select[0] = hash_title;
									}			
									if (hash_html.length > 1){
										$('#prehash').append(hash_html[hash_html.length-1]);
								    } else {
										$('#prehash').html(hash_html[0]);
								    }
								} else if (hash_html.length == max_hashtag) {
									$('#warnDisp').html('&emsp;#HashTag는 최대' + max_hashtag + '개까지만 선택할 수 있습니다');
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
								var c_hashtag = new Object();
								c_hashtag.hash = hash_select;
								var values = JSON.stringify(c_hashtag);
								$(function() {
								    $('input[name=hashtags]').val(values);
								});
								document.frm.submit();
							}
						</script>
						</div>
					</form>
					<button onclick="submit()">SUBMIT</button>
					
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>

