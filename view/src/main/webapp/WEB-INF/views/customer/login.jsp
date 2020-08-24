<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainPage/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("success")
		location.href="../mainPage/main";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("fail")
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("ID check")
		history.go(-1);
	</script>
</c:if>
</body>
</html>