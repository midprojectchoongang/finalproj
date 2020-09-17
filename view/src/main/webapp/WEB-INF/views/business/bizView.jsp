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
		<div id="colorlib-container" align="center">
		<div class="row headbox"><h2 class="heading-2">회원정보</h2></div>
		<div class="container">
			<div class="col-md-9">
				<div class="row">
					<div class="row-pb-md formbox-nonlabel" align="left">
					<table class="table table-ticket">
						<tr>
							<td>
								<label>아이디</label>
								<div class="col-md-12 row-pb-sm">			
									${biz.b_id }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>단체명</label>
								<div class="col-md-12 row-pb-sm">			
									${biz.groupName }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>대표자</label>
								<div class="col-md-12 row-pb-sm">			
									${biz.ceoName }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>연락처</label>
								<div class="col-md-12 row-pb-sm">			
									${biz.tel }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>메일주소</label>
								<div class="col-md-12 row-pb-sm">			
									${biz.email }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>단체종류</label>
								<div class="col-md-12 row-pb-sm">			
								<c:choose>
									<c:when test="${biz.groupkind == 'licensee' }">개인사업자</c:when>
									<c:when test="${biz.groupkind == 'corporation' }">법인사업자</c:when>
									<c:when test="${biz.groupkind == 'etc' }">기타</c:when>
								</c:choose>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>등록번호</label>
								<div class="col-md-12 row-pb-sm">			
								<c:choose>
									<c:when test="${not empty biz.licensee}">${biz.licensee}</c:when>
									<c:when test="${not empty biz.corporation}">${biz.corporation}</c:when>
									<c:when test="${not empty biz.etc }">${biz.etc}</c:when>
									<c:otherwise>등록번호가 없습니다.</c:otherwise>
								</c:choose>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>홈페이지</label>
								<div class="col-md-12 row-pb-sm">			
								${biz.website }
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>가입승인</label>
								<div class="col-md-12">			
								<c:choose>
									<c:when test="${biz.confirm == 'y' }">승인 완료</c:when>
									<c:when test="${biz.confirm == 'n' }">승인 불가</c:when>
									<c:when test="${biz.confirm == 'c' }">승인 대기</c:when>
								</c:choose>
								</div>
								<c:if test="${biz.confirm == 'n' }">
								<div class="col-md-12 row-pb-sm warn-style">
									: ${comment[biz.con_comment] }
								</div>	
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								<label>가입일</label>
								<div class="col-md-12 row-pb-sm">			
								<fmt:formatDate value="${biz.reg_date }" pattern="YYYY-MM-dd"/>
								</div>
							</td>
						</tr>									
					</table>
					</div>
					<div class="row-pb-md" style="text-align: center;">
						<a href="/biz/bizUpdateForm" class="btn btn-primary">회원정보수정</a>
						<button class="btn btn-outline" onclick="delConfirm();">회원탈퇴</button>												
					</div>
					<script type="text/javascript">
						function delConfirm() {
							var msg = '아이디를 삭제하시겠습니까?';
							if(confirm(msg)) {
								location.href='/biz/bizDelete';
							}
						}
					</script>					
				</div>
				</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

