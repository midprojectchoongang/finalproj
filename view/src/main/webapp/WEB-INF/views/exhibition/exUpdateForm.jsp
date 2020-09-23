<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<!-- Map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db0dac3b0daa13d53c2ff56ca8789c9&libraries=services"></script>
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
		
		function valChk() {
		 	if (frm.title.value != "" || frm.title.value != null) {
				$('#titleDisp').html("");
			}
			if (frm.gallery.value != "" || frm.gallery.value != null) {
				$('#galleryDisp').html("");
			}
			if (frm.price.value != "" || frm.price.value != null) {
				$('#priceDisp').html("");
			}
			if (frm.start_date.value != "" || frm.start_date.value != null) {
				$('#dateDisp').html("");
			}
			if (frm.end_date.value != "" || frm.end_date.value != null) {
				$('#dateDisp').html("");
			}
		}
	</script>
	<div id="colorlib-container">
	<div class="row headbox"><h2 class="heading-2">전시회 정보 수정</h2></div>
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row">
					<form action="${path }/exUpdate" enctype="multipart/form-data" method="post" name="frm">
					<div class="row formbox">							
						<input type="hidden" name="exhibition_no" value="${ex.exhibition_no}">
						<input type="hidden" name="oldFilename" value="${ex.filename }">
						<input type="hidden" name="fileChange" id="fileChange" value="n">
						<div class="row form-group">
							<div class="col-md-12">
								<div id="select_img" class="row-pb-sm col-md-6">
									<img src="${path }/exImg/${ex.filename }" class="img-thumbnail">
								</div>
								<input type="file" name="file" id="file" class="form-control">
								<script>
									$("#file").change(function(){
								 		if(this.files && this.files[0]) {
								 		  	var reader = new FileReader;
								   			reader.onload = function(data) {
								  				$("#select_img img").attr("src", data.target.result);        
										    }
								   			reader.readAsDataURL(this.files[0]);
								   			$('#fileChange').attr('value','y');
								   		}
								 	});
								 </script>
							</div>
						</div>							
						<div class="row form-group">
							<div class="col-md-12" align="left">
								<b>&emsp;전시회명</b>
								<input type="text" name="title" class="form-control" required="required" 
								value="${ex.title }" onchange="valChk()">
								<div id="titleDisp"></div>
							</div>
						</div>
						<div class="row form-group" align="justify">	
							<div class="col-md-12">
								<table class="table-box">
									<tr>
										<td style="width: 47%">
											<input type="date" name="start_date" class="form-control" required="required" value="${ex.start_date }" onchange="valChk()">
										</td>
										<td style="width: 6%; text-align: center; vertical-align: middle;">
											~
										</td>
										<td style="width: 47%">
											<input type="date" name="end_date" class="form-control" required="required" value="${ex.end_date }" onchange="valChk()">
										</td>
									</tr>
								</table>
								<div id="dateDisp"></div>
							</div>
						</div>						
						<div class="row form-group">
							<div class="col-md-12" align="left">
								<b>&emsp;장소</b>
								<input type="text" name="gallery" class="form-control" required="required" id="gallery"
								 value="${ex.gallery }" onchange="valChk()">
								 <div id="galleryDisp"></div>
							</div>
						</div>
						<div class="row form-group" align="left">
							<div class="col-md-12 btn-group-sm">
								<input type="text" name="address" class="form-control" id="mapAddress" readonly="readonly"
									value="${addr }" style="display: inline; width: auto; min-width: 70%">
								<button type="button" onclick="postSearch()" class="btn btn-outline">주소검색</button>
								<input type="text" name="sub_address" class="form-control" placeholder="상세주소" value="${sub_addr }">							
								<div id="addressDisp"></div>
								<div id="map" style="width:100%;height:300px;margin-top:10px;"></div>
								
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script type="text/javascript">
									var addr = '${addr}';
									var galName = '${ex.gallery}';
									
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  
	
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 
									var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
									geocoder.addressSearch(addr, function(result, status) { // 주소로 좌표를 검색합니다
									     if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
									        // 결과값으로 받은 위치를 마커로 표시합니다
									        var marker = new kakao.maps.Marker({
									            map: map,
									            position: coords
									        });
		
									        // 인포윈도우로 장소에 대한 설명을 표시합니다
									        var infowindow = new kakao.maps.InfoWindow({
									            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+galName+'</div>'
									        });
									        infowindow.open(map, marker);
		
									        map.setCenter(coords); // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									    } 
									});
									
									function postSearch() {
										$('#addressDisp').html("");
										var gallery = document.getElementById("gallery").value;
								        new daum.Postcode({
								            oncomplete: function(data) {
								                var addr = data.address; // 최종 주소 변수
								                document.getElementById("mapAddress").value = addr; // 주소 정보를 해당 필드에 넣는다.
								                geocoder.addressSearch(data.address, function(results, status) { // 주소로 상세 정보를 검색
								                    if (status === daum.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면
								                        var result = results[0]; //첫번째 결과의 값을 활용
								                        var coords = new daum.maps.LatLng(result.y, result.x); // 해당 주소에 대한 좌표를 받아서
								                        
								                     	// 결과값으로 받은 위치를 마커로 표시합니다
												        var marker = new kakao.maps.Marker({ 
												            map: map,
												            position: coords
												        });
														
												     	// 인포윈도우로 장소에 대한 설명을 표시합니다
												        var infowindow = new kakao.maps.InfoWindow({ 
												            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+gallery+'</div>'
												        });
												        infowindow.open(map, marker);
					
												        map.setCenter(coords); // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								                    }
								                });
								            }
								        }).open();
								    }
								</script>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12" align="left">
								<b>&emsp;갤러리 사이트</b>
								<input type="text" name="gallery_site" class="form-control" value="${ex.gallery_site }">
							</div>
						</div>
						<div class="row form-group" align="left">
							<div class="col-md-12" id="siteForm">
								<b>&emsp;예매 사이트</b>
								<c:if test="${empty ex.ticket_link1 }">
									<input type="text" name="ticket_link1" class="form-control">
								</c:if>								
								<c:if test="${not empty ex.ticket_link1 }">
								<input type="text" name="ticket_link1" class="form-control" value="${ex.ticket_link1 }">
								</c:if>
								<c:if test="${not empty ex.ticket_link2 }">
								<input type="text" name="ticket_link2" class="form-control" value="${ex.ticket_link2 }">
								</c:if>
								<c:if test="${not empty ex.ticket_link3 }">
								<input type="text" name="ticket_link3" class="form-control" value="${ex.ticket_link3 }">
								</c:if>
							</div>
							<c:if test="${empty ex.ticket_link1 }">
								<div class="col-md-12 btn-group-sm">
									<button type="button" class="btn btn-outline" onclick="addForm()">추가</button>
								</div>
							</c:if>
							<script type="text/javascript">
								function addForm() {
									var link = $('#siteForm > input:last');
									var num = parseInt(link.attr('name').substring(11));
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
							<div class="col-md-12" align="left">
								<b>&emsp;입장권 가격</b>
								<input type="text" name="price" class="form-control" required="required"
								 value="${ex.price }" onchange="valChk()">
								 <div id="priceDisp"></div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<textarea name="content">${ex.content }</textarea>
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
					<div class="row formbox">
						<div class="row form-group" align="center">
							<div class="col-md-12 btn-group-sm">
								<table class="table-box">
								<tr>
									<td style="width: 90%">
									<label for="keyword">Search #HASH</label>
									<input type="text" name="keyword" id="keyword" class="form-control" onkeyup="filter()">
									</td>
									<td style="width: 10%; padding-right: 0; padding-left: 10px; vertical-align: middle;" class="btn-group-sm">
									<button class="btn btn-primary" onclick="addNewHash()">추가</button>
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
								var keyword, name, tag, i;
								$('#warnDisp').html('');
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
						<div class="row form-group">
							<div class="col-md-12">
								<p class="tags">
									<c:forEach var="htl" items="${hashList }">
									<c:if test="${htl.kind == 'basic' }">
										<span class="tag" name="taglists">
											<a onclick="addPrehash('${htl.hash_title }')" class="name" style="cursor: pointer;">
												<i class="icon-tag"></i> ${htl.hash_title }
											</a>
										</span>
									</c:if>
									</c:forEach>
								</p>
								<p class="tags" id="customHash">
									<c:forEach var="htl" items="${hashList }">
									<c:if test="${htl.kind == 'custom' }">
										<span class="tag" name="taglists">
											<a onclick="addPrehash('${htl.hash_title }')" class="name" style="cursor: pointer;">
												<i class="icon-tag"></i> ${htl.hash_title }
											</a>
										</span>
									</c:if>
									</c:forEach>
								</p>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var hash_html = new Array();
						var hash_select = new Array();
						var max_hashtag = 8;
						var postedHash = ${postedHash };
						
						for(var i=0; i<postedHash.length; i++) {
							addPrehash(postedHash[i]);
						}
						
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
					<script type="text/javascript">
						function submit() {
							if (frm.title.value == "" || frm.title.value == null) {
								$('#titleDisp').html("<b>전시회명을 입력해 주세요</b>");
								frm.title.focus();
								return;
							} else if (frm.start_date.value == "" || frm.start_date.value == null) {
								$('#dateDisp').html("<b>전시회 시작 날짜를 선택해 주세요</b>");
								frm.start_date.focus();
								return;
							} else if (frm.end_date.value == "" || frm.end_date.value == null) {
								$('#dateDisp').html("<b>전시회 종료 날짜를 선택해 주세요</b>");
								frm.end_date.focus();
								return;
							} else if (frm.gallery.value == "" || frm.gallery.value == null) {
								$('#galleryDisp').html("<b>장소명(갤러리명 혹은 건물 이름 등)을 입력해 주세요</b>");
								frm.gallery.focus();
								return;
							} else if (frm.address.value == "" || frm.address.value == null) {
								$('#addressDisp').html("<b>주소를 입력해 주세요</b>");
								frm.address.focus();
								return;
							} else if (frm.price.value == "" || frm.price.value == null) {
								$('#priceDisp').html("<b>입장권 가격을 입력해 주세요(ex. 0, 1000, 10000 등)</b>");
								frm.price.focus();
								return;
							} else if (hash_select == null) {
								$('#warnDisp').html('&emsp;#HASH는 하나 이상 선택해 주세요');
								frm.keyword.focus();
							}							
							var c_hashtag = new Object();
							c_hashtag.hash = hash_select;
							var values = JSON.stringify(c_hashtag);
							$(function() {
							    $('input[name=hashtags]').val(values);
							});
							document.frm.submit();
						}
					</script>
					<button onclick="submit()" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>

