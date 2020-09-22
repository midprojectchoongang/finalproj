<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
	<div id="colorlib-container" align="center">
	<div class="row headbox"><h2 class="heading-2">회원정보</h2></div>
		<div class="container">
			<div class="col-md-12">
				<div class="row" >
					<div class="col-md-5" id="customized">
						<table class="table table-ticket" style="font-size: 17px;">
							<tr style="height: 60px;"><th style="width:100px; text-align: center;">아이디</th>
								<td style="padding-left: 50px;">${biz.b_id }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">연락처</th>
								<td style="padding-left: 50px;">${biz.tel }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">이메일</th>
								<td style="padding-left: 50px;">${biz.email }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">홈페이지</th>
								<td style="padding-left: 50px;">${biz.website }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">가입일</th>
								<td style="padding-left: 50px;">${biz.reg_date }</td>
							</tr>
						</table>
					</div>
					<div class="col-md-5" id="customized">
						<table class="table table-ticket" style="font-size: 17px;">
							<tr style="height: 60px;"><th style="width:100px; text-align: center;">단체명</th>
								<td style="padding-left: 50px;">${biz.groupName }</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">대표자</th>
								<td style="padding-left: 50px;">${biz.ceoName }</td>
							</tr>

							<tr style="height: 60px;"><th style="text-align: center;">단체종류</th>
								<td style="padding-left: 50px;">			
									<c:choose>
										<c:when test="${biz.groupkind == 'licensee' }">개인사업자</c:when>
										<c:when test="${biz.groupkind == 'corporation' }">법인사업자</c:when>
										<c:when test="${biz.groupkind == 'etc' }">기타</c:when>
									</c:choose>
								</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">등록번호</th>
								<td style="padding-left: 50px;">		
									<c:if test="${biz.groupkind == 'licensee' }">
									<c:choose>
										<c:when test="${biz.licensee != null}">
											${biz.licensee}
										</c:when>
										<c:otherwise>등록번호가 없습니다.</c:otherwise>
									</c:choose>
									</c:if>
									<c:if test="${biz.groupkind == 'corporation' }">
									<c:choose>
										<c:when test="${biz.corporation != null}">
											${biz.corporation}
										</c:when>
										<c:otherwise>등록번호가 없습니다.</c:otherwise>
									</c:choose>
									</c:if>
									<c:if test="${biz.groupkind == 'etc' }">
									<c:choose>
										<c:when test="${biz.etc != null}">
											${biz.etc}
										</c:when>
										<c:otherwise>등록번호가 없습니다.</c:otherwise>
									</c:choose>
									</c:if>
								</td>
							</tr>
							<tr style="height: 60px;"><th style="text-align: center;">승인여부</th>
								<td style="padding-left: 50px;">	
									<c:choose>
										<c:when test="${biz.confirm == 'y' }">승인 완료</c:when>
										<c:when test="${biz.confirm == 'n' }">승인 불가</c:when>
										<c:when test="${biz.confirm == 'c' }">승인 대기</c:when>
									</c:choose>
									<c:if test="${biz.confirm == 'n' }">
									<div class="col-md-12 row-pb-sm warn-style">
										: ${comment[biz.con_comment] }
									</div>	
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="row-pb-md" style="text-align: center;">
						<a href="${path }/biz/bizUpdateForm" class="btn btn-primary">회원정보수정</a>
						<button class="btn btn-outline" onclick="delConfirm();">회원탈퇴</button>												
					</div>
					<script type="text/javascript">
						function delConfirm() {
							var msg = '아이디를 삭제하시겠습니까?';
							if(confirm(msg)) {
								location.href='${path}/biz/bizDelete';
							}
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

