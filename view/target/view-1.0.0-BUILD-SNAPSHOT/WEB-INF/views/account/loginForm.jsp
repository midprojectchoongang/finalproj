<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
	<div id="colorlib-container">
		<div class="container">
			<div class="row row-pb-md">
				<form action="login">
					<table>
						<tr><td><input type="text" name="id"></td></tr>
						<tr><td><input type="password" name="password"></td></tr>
						<tr><td><input type="submit"></td></tr>
					</table>
				</form>
				
				<!-- 네이버아이디로로그인 버튼 -->
				<div id="naverIdLogin"></div>
				
				<!-- 네이버아디디로로그인 초기화 Script -->
				<script type="text/javascript">
					var naverLogin = new naver.LoginWithNaverId(
						{
							clientId: "HazYRaRElY_oar6cogOf",
							callbackUrl: "http://172.30.1.50:8080/view/login",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
						}
					);
					/* 설정정보를 초기화하고 연동을 준비 */
					naverLogin.init();
				</script>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>