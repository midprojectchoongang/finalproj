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
	<div id="colorlib-container">
		<div class="container">
			<div class="col-md-9">
				<div class="row">
					<div class="row headbox"><h2 class="heading-2">(${ex.exhibition_no }) ${ex.title }</h2></div>
				</div>
				<div class="row">
					<div class="row" style="text-align: right; padding: 20px;">
						<a href="exUpdateForm?exhibition_no=${ex.exhibition_no }" class="btn btn-xs btn-outline">수정</a>
						<a href="exDelete?exhibition_no=${ex.exhibition_no }" class="btn btn-xs btn-outline" onclick="return confirm('really?');">삭제</a>
						<a href="exList" class="btn btn-xs btn-outline">목록</a>
					</div>
					<table>
					
						<tr>
							<td>
								<p class="tags">
									<c:forEach var="ph" items="${postedHash }">
										<span class="tag">
											<a href="#" class="name"><i class="icon-tag"></i> ${ph.hash_title }</a>
										</span>
									</c:forEach>
								</p>
							</td>
						</tr>
						
						<tr>
							<td style="width: 30%; padding-top: 30px;" rowspan="4">
								<img src="exImg/${ex.filename }">
							</td>
							<td style="width: 70%; padding: 30px;">
								${ex.gallery }
							</td>
						</tr>						
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.start_date }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.end_date }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.price }
							</td>
						</tr>	
											
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.artist }
							</td>
						</tr>
						
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.gallery_site }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.address }
								
								
								
<!-- 								
							<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>
							<script type="text/javascript">
								var addr = '${addr}';
								var galName = '${ex.gallery}';
								
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 
	
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
	
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch(addr, function(result, status) {
	
								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
	
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
	
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});   
							</script>
								 -->
								
								
								
								
								
							</td>
						</tr>	
						<tr>
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link1 }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link2 }
							</td>
						</tr>
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.ticket_link3 }
							</td>
						</tr>
						
						<tr>	
							<td style="width: 70%; padding: 30px;">
								${ex.content }
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>