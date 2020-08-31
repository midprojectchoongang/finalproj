<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="col-md-12" id="commentDisp">
	<h2>${count } Comments</h2>
	<c:forEach items="${cmtList }" var="cl">
	<c:if test="${cl.del == 'n' }">
		<div class="review">
	   		<div class="desc">
	   			<h4><span class="text-left">${cl.nickname }&emsp;
	   					<c:if test="${cl.c_id == c_id }">
	   						<button onclick="updateComment('${cl.comment_no}','${cl.content }')" id="updateBtn">수정</button>
	   						<button id="deleteBtn">삭제</button>
	   					</c:if></span>
	   				<span class="text-right">${cl.reg_date }</span>
	   			</h4>
	   			<p id="contentBox">${cl.content }</p>
	   		</div>
	   	</div>
	</c:if>
	</c:forEach>
	<script type="text/javascript">
		function updateComment(updateCmtno,updateCont) {
			var updateCont = updateCont
			$(function() {
				$('#contentBox').html('<textarea name="content" id="updateCont" cols="30" rows="5" class="form-control">'+updateCont+'</textarea>');
				$('#deleteBtn').replaceWith('<button id="cancelUpBtn">취소</button>');
			});
		}
	</script>
</div>			
</body>
</html>