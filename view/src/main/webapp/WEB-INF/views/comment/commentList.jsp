<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="col-md-12" id="commentDisp">
	<div class="row headbox-sm" align="left"><h2 class="heading-2-b">${count }개의 한줄평</h2></div>
	<c:forEach items="${cmtList }" var="cl">
	<c:if test="${cl.del == 'n' }">
		<div class="review">
	   		<div class="desc">
	   			<h3>
	   				<span class="text-left" style="width: 100%;">
	   					${cl.nickname }&emsp;&emsp;
	   				</span>
		   			<span class="text-right" style="width: 100%;">
	   					<span class="text-right btn-group-xs">
 	   					<c:if test="${cl.c_id == sessionScope.c_id }">
	   						<button onclick="updateComment('${cl.comment_no}', '${cl.exhibition_no }' ,'${cl.content }')" 
	   							id="updateBtn_${cl.comment_no}" class="btn btn-outline">수정</button>
	   						<button onclick="deleteComment('${cl.comment_no}')" 
	   							id="deleteBtn_${cl.comment_no}" class="btn btn-outline">삭제</button>
	   					</c:if>
	   					</span>
	   					&emsp;
	   					${cl.reg_date }
	   				</span>
	   			</h3>
	   			<p id="contentBox" class="comm_${cl.comment_no }">${cl.content }</p>
	   		</div>
	   	</div>
	</c:if>
	</c:forEach>
	<script type="text/javascript">
		function updateComment(comment_no, eno, content) {
			$('.comm_'+comment_no).html('<textarea name="content" id="updateCont" cols="30" rows="5"'
					+'class="form-control">'+content+'</textarea>');
			$('#updateBtn_'+comment_no).replaceWith('<button id="confirmBtn" onclick="confirmBtn('+comment_no+')" class="btn btn-outline">확인</button>');
			$('#deleteBtn_'+comment_no).replaceWith('<button id="cancelBtn" onclick="cancelBtn('+comment_no+')" class="btn btn-outline">취소</button>');
		}
		function confirmBtn(comment_no) {
			var sendData = $('#updateCont').val();
			console.log(sendData);
			$.ajax({
				url : 'updateComment',
				type : 'post',
				data : {
					content : sendData,
					comment_no : comment_no
				},
				success : function(data) {
					if ($.trim(data) == 1) {
						alert('댓글이 수정되었습니다');
						$('#commentList').html(data);
					} else {
						$('#commentList').html("<b>서버오류</b>");
					}
				},
				error : function() {
					$('#commentList').html("<b>페이지오류</b>");
				}
			});
			location.reload();
		}
		function cancelBtn(exhibition_no) {
			location.reload();
		}
		function deleteComment(comment_no) {
			var sandData = "comment_no="+comment_no;
			$.ajax({
				url : 'deleteComment',
				type : 'post',
				data : {
					comment_no : comment_no
				},
				success : function(data) {
					if ($.trim(data) == 1) {
						alert('댓글이 삭제되었습니다');
						$('#commentList').html(data);
					}
				}		
			});
			location.reload();
		}
	</script>
</div>			
</body>
</html>