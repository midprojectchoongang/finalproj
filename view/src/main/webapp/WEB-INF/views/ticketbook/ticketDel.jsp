<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainPage/header.jsp"%>>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href='${path}/cus/ticketCal?date=${ticket.date}';
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("삭제 실패");
		history.go(-1);
	</script>
</c:if>