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
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<table class="table table-bordered table-info">
						<tr>
							<th class="th-info">아이디</th>
							<td>${biz.b_id }</td>
						</tr>
						<tr>
							<th class="th-info">단체명</th>
							<td>${biz.groupName }</td>
						</tr>
						<tr>
							<th class="th-info">대표자</th>
							<td>${biz.ceoName }</td>
						</tr>
						<tr>
							<th class="th-info">연락처</th>
							<td>${biz.tel }</td>
						</tr>
						<tr>
							<th class="th-info">메일주소</th>
							<td>${biz.email }</td>
						</tr>
						<tr>
							<th class="th-info">단체종류</th>
							<td>
							<c:choose>
								<c:when test="${biz.groupkind == 'licensee' }">개인사업자</c:when>
								<c:when test="${biz.groupkind == 'corporation' }">법인사업자</c:when>
								<c:when test="${biz.groupkind == 'etc' }">기타</c:when>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th class="th-info">등록번호</th>
							<td>
							<c:choose>
								<c:when test="${not empty biz.licensee}">${biz.licensee}</c:when>
								<c:when test="${not empty biz.corporation}">${biz.corporation}</c:when>
								<c:when test="${not empty biz.etc }">${biz.etc}</c:when>
								<c:otherwise>등록번호가 없습니다.</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th class="th-info">홈페이지</th>
							<td>${biz.website }</td>
						</tr>
						<tr>
							<th class="th-info">가입승인</th>
							<td>
								<c:choose>
									<c:when test="${biz.confirm == 'y' }">승인 완료</c:when>
									<c:when test="${biz.confirm == 'n' }">승인 불가</c:when>
									<c:when test="${biz.confirm == 'c' }">승인 대기</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th class="th-info">가입일</th>
							<td><fmt:formatDate value="${biz.reg_date }" pattern="YYYY-MM-dd"/></td>
						</tr>									
					</table>
					
					<div class="form-group" style="text-align: center;">
						<a href="bizExList">내 전시회</a>
						<a href="bizUpdateForm">회원정보수정</a>
						<a href="bizLogout">로그아웃</a>
						<a href="bizDelete" onclick="return confirm('really?');">회원탈퇴</a>												
					</div>
					
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>

