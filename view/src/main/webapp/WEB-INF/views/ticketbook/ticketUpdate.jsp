<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mainPage/header.jsp"%>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("수정 완료");
		location.href='${path}/cus/ticketView?ticketbook_no=${ticketbook_no}';
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 실패");
		history.go(-1);
	</script>
</c:if>