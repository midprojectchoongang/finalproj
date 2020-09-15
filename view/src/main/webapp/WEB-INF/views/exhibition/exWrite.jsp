<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("전시 등록이 완료되었습니다.");
		location.href = "exList";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("오류가 발생했습니다.");
		history.go(-1);
	</script>
</c:if>