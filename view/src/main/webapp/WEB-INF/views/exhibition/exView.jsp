<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
	<div id="colorlib-container">
	<div class="row headbox"><h2 class="heading-2">${ex.title }</h2></div>
		<div class="container" align="center">
			<div class="col-md-9">
				<div class="row">
					<div class="row-pb-sm btn-group-xs" style="text-align: right; padding: 20px;">
						<c:if test="${myList == 'b' }">
							<a href="${path }/biz/exList?pageNum=${pageNum}" class="btn btn-outline">전시목록</a>
						</c:if>
						<c:if test="${myList == 'c' }">
							<a href="${path }/cus/myExList?pageNum=${pageNum}" class="btn btn-outline">관심전시목록</a>
						</c:if>
						<c:if test="${myList == null }">
						<a href="${path }/exList?pageNum=${pageNum}" class="btn btn-outline">목록</a>
						</c:if>
					</div>
				</div>
				<div class="row">
				<div class="col-md-12" style="padding: 0">
					<table class="table table-box table-striped">
						<tr>
							<td style="width: 30%;" rowspan="4">
								<img src="${path}/exImg/${ex.filename }" class="img-thumbnail">
							</td>
							<th>
								전시장소
							</th>
							<td>
								${ex.gallery }
							</td>
						</tr>
						<tr>
							<th>
								전시기간
							</th>	
							<td>
								${ex.start_date } ~ ${ex.end_date }
							</td>
						</tr>
						<tr>	
							<th>
								입장료
							</th>
							<td>
							<c:if test="${ex.price == 0 }">
								무료
							</c:if>
							<c:if test="${ex.price != 0 }">
								${ex.price }원
							</c:if>
							</td>
						</tr>
						<tr>
							<th>
								홈페이지
							</th>	
							<td>
								<c:if test="${empty ex.gallery_site }">
									-
								</c:if>
								<c:if test="${not empty ex.gallery_site }">
									<c:set var="site" value="${ex.gallery_site }"/>
									<c:set var="length" value="${fn:length(site)+1}"/>
									<c:choose>
										<c:when test="${fn:startsWith(site, 'http://')}">
											<c:set var="adj_site" value="${fn:substring(site,7,length)}"></c:set>
											<a href="http://${adj_site }" target="blank">${ex.gallery_site }</a>
										</c:when>
										<c:otherwise>
											<a href="http://${ex.gallery_site }" target="blank">${ex.gallery_site }</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</td>
						</tr>							
						<tr>
							<td style="vertical-align: middle;">
								<span style="cursor: pointer;">
								<c:if test="${heart == 1}">
									<img src="${path }/images/heart_on.png" id="heartIcon" onclick="changeIcon()" role="on">
								</c:if>
								<c:if test="${heart == 0}">
									<img src="${path }/images/heart_off.png" id="heartIcon" onclick="changeIcon()" role="off">
								</c:if>
								</span>
							</td>	
							<script type="text/javascript">
								$(function() {
									// customer의 interest값에 따라서 icon img 설정
								})
								var eno = '${ex.exhibition_no}';
								function changeIcon() {
									if ($('#heartIcon').attr('role') == 'off') {
										// controller 처리
										$.ajax({
											url : 'add_Interest',
											type : 'post',
											data : {
												exhibition_no : eno
											},
											success : function(data) {
												if(data == 0) {
													alert('로그인 후 이용할 수 있습니다.');
													return false;
												} else {
													alert('관심전시로 등록했습니다.');
													$('#heartIcon').attr('src','${path }/images/heart_on.png');
													$('#heartIcon').attr('role','on');
												}
											}
										});
									} else {
										$.ajax({
											url : 'remove_Interest',
											type : 'post',
											data : {
												exhibition_no : eno
											},
											success : function(data) {
												if($.trim(data) == 0) {
													alert('오류가 발생했습니다.');
													return false;
												} else {
													alert('관심전시에서 삭제했습니다.');
													$('#heartIcon').attr('src','${path }/images/heart_off.png');
													$('#heartIcon').attr('role','off');
												}
											}
										});
									}
								}
							</script>													
							<td colspan="2" style="padding: 30px 0;">
								<p class="tags">
									<c:forEach var="ph" items="${postedHash }">
										<span class="tag">
											<a href="exList?keyword=${ph.hash_title }" class="name"><i class="icon-tag"></i> ${ph.hash_title }</a>
										</span>
									</c:forEach>
								</p>
							</td>
						</tr>												
						<tr>
							<th>
								주소
							</th>	
							<td colspan="2">
								${ex.address }
							<div id="map" style="width:100%;height:300px;margin-top:10px;"></div>
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
								
							</td>
						</tr>
						<c:if test="${not empty ex.ticket_link1 || ex.ticket_link1 != ''}">
						<tr>
							<th>
								예매처
							</th>	
							<td colspan="2">
								<c:forEach var="link" items="${t_links }">
									<c:set var="site" value="${link }"/>
									<c:set var="length" value="${fn:length(site)+1}"/>
									<c:choose>
										<c:when test="${fn:startsWith(site, 'http://')}">
											<c:set var="adj_site" value="${fn:substring(site,7,length)}"></c:set>
											<a href="http://${adj_site }" target="blank">${link }</a><br>
										</c:when>
										<c:otherwise>
											<a href="http://${link }" target="blank">${link }</a><br>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
						</tr>
						</c:if>
						<tr>
							<td colspan="3" class="ex-content">
								${ex.content }
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>				
	<%@ include file="../comment/commentWrite.jsp" %>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>