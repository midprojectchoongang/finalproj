<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div class="colorlib-loader">
	<%@ include file="../mainPage/header.jsp" %>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("에러발생");
			history.back();
		</script>
	</c:if>
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			location.href='viewHashList';
		</script>
	</c:if>
</div>
</body>
</html>