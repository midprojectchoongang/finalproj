<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainPage/header.jsp"%>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("등록 완료");
		location.href='${path}/cus/ticketCal?date=${date}';
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("등록 실패");
		history.go(-1);
	</script>
</c:if>