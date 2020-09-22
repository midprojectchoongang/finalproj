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
			var placeholderTarget = $('.formbox input');
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
	<div class="row headbox"><h2 class="heading-2">전시회 등록</h2></div>
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row" align="justify">
					<form action="${path }/exWrite" enctype="multipart/form-data" method="post" name="frm">
					<div class="row formbox">
						<input type="hidden" name="b_id" value="${b_id}">
						<div class="row form-group" align="center">
							<div class="col-md-4">
								<div id="select_img" class="row-pb-sm">
									<img src="" />
								</div>					
							</div>
							<div class="col-md-12">
								<input type="file" name="file" id="file" class="form-control" required="required">
								<%-- <%=request.getRealPath("/") %> --%>
								<script>
									$("#file").change(function(){
								 		if(this.files && this.files[0]) {
								 		  	var reader = new FileReader;
								   			reader.onload = function(data) {
								  				$("#select_img img").attr("src", data.target.result);        
								  				$("#select_img img").attr("class", "img-thumbnail");        
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
						<div class="row form-group" align="justify">	
							<div class="col-md-12">
								<table class="table-box">
									<tr>
										<td style="width: 47%">
											<input type="date" name="start_date1" class="form-control" required="required">
										</td>
										<td style="width: 6%; text-align: center; vertical-align: middle;">
											~
										</td>
										<td style="width: 47%">
											<input type="date" name="end_date1" class="form-control" required="required">
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="gallery">장소</label>
								<input type="text" name="gallery" class="form-control" required="required">
							</div>
						</div>						
						<div class="row form-group" align="left">
							<div class="col-md-12 btn-group-sm">
								<button type="button" onclick="postSearch()" class="btn btn-outline">주소검색</button><br>
								<input type="text" name="address" class="form-control" id="mapAddress" placeholder="주소" required="required">
								<input type="text" name="sub_address" class="form-control" placeholder="상세주소">
								<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>
								
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
								        mapOption = {
								            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
								            level: 5 // 지도의 확대 레벨
								        };
								
								    //지도를 미리 생성
								    var map = new daum.maps.Map(mapContainer, mapOption);
								    //주소-좌표 변환 객체를 생성
								    var geocoder = new daum.maps.services.Geocoder();
								    //마커를 미리 생성
								    var marker = new daum.maps.Marker({
								        position: new daum.maps.LatLng(37.537187, 127.005476),
								        map: map
								    });
								
								
								    function postSearch() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                var addr = data.address; // 최종 주소 변수
								
								                // 주소 정보를 해당 필드에 넣는다.
								                document.getElementById("mapAddress").value = addr;
								                // 주소로 상세 정보를 검색
								                geocoder.addressSearch(data.address, function(results, status) {
								                    // 정상적으로 검색이 완료됐으면
								                    if (status === daum.maps.services.Status.OK) {
								
								                        var result = results[0]; //첫번째 결과의 값을 활용
								
								                        // 해당 주소에 대한 좌표를 받아서
								                        var coords = new daum.maps.LatLng(result.y, result.x);
								                        // 지도를 보여준다.
								                        mapContainer.style.display = "block";
								                        map.relayout();
								                        // 지도 중심을 변경한다.
								                        map.setCenter(coords);
								                        // 마커를 결과값으로 받은 위치로 옮긴다.
								                        marker.setPosition(coords)
								                    }
								                });
								            }
								        }).open();
								    }
								</script>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="gallery_site">갤러리 사이트</label>
								<input type="text" name="gallery_site" class="form-control">
							</div>
						</div>						
						<div class="row form-group">
							<div class="col-md-12" id="siteForm">
								<label for="link1">예매 사이트</label>
								<input type="text" name="ticket_link1" id="link" class="form-control">
							</div>
							<div class="col-md-12 btn-group-sm">
								<button type="button" class="btn btn-outline" onclick="addForm()">추가</button>
							</div>
							<script type="text/javascript">
								function addForm() {
									var link = $('#siteForm > input:last');
									var num =  parseInt(link.attr('name').substring(11));
									if (num == 3) {
										alert('더이상 추가할 수 없습니다.');
										return false;
									} else {
										$('#siteForm').append('<input type="text" name="ticket_link'+ (num+1) +'" id="link" class="form-control">');
									} 
								}
							</script>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="price">입장권 가격</label>
								<input type="text" name="price" class="form-control" required="required">
							</div>
						</div>																	
						<div class="row form-group">
							<div class="col-md-12">							
								<textarea name="content" rows="20"></textarea>
								<script>
									window.onload = function() {
										ck = CKEDITOR.replace("content", {
											filebrowserUploadUrl : "/view/ckUpload",
											height: 350
										});
									};
								</script>
							</div>
						</div>
					</div>
					<input type="hidden" name="hashtags" value="">
					</form>
					<!-- hash -->
					<div class="row formbox" align="left">
						<div class="row form-group">
							<div class="col-md-12">
								<table class="table-box">
								<tr>
									<td style="width: 90%">
									<label for="keyword">Search #HASH</label>
									<input type="text" name="keyword" id="keyword" class="form-control" onkeyup="filter()">
									</td>
									<td style="width: 10%; padding-right: 0; padding-left: 10px; vertical-align: middle;" class="btn-group-sm">
									<button type="button" class="btn btn-primary" onclick="addNewHash()">추가</button>
									</td>
								</tr>
								</table>
							</div>
						</div>
						<div class="row form-group" align="center">
							<div class="col-md-12">
								<p class="tags" id="prehash" style="min-height: 35px;"></p>
								<div id="warnDisp" class="warn-style"></div>
							</div>
						</div>
						<script type="text/javascript">							
							function filter() {
								var keyword, name, tag, i, hint;
								keyword = document.getElementById("keyword").value.toUpperCase();
								tag = document.getElementsByName("taglists");
								for (i=0; i<tag.length; i++) {
									name = tag[i].getElementsByClassName("name");
									if (name[0].innerHTML.toUpperCase().indexOf(keyword) > -1) {
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
						<div class="row form-group">
							<div class="col-md-12">
								<p class="tags" id="customHash">
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
					</div>
					<script type="text/javascript">
						var hash_html = new Array();
						var hash_select = new Array();
						var max_hashtag = 8;
						
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
								$('#warnDisp').html('&emsp;#HashTag는 최대 ' + max_hashtag + '개까지만 선택할 수 있습니다');
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
					<div class="form-group" style="text-align: center;">
						<button onclick="submit()" class="btn btn-primary">등록</button>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>