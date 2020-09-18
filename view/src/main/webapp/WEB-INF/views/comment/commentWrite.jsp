<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$('#commentList').load(
					'commentList?exhibition_no=${ex.exhibition_no}');
		});
	</script>
<div id="colorlib-container">
	<div class="row" align="left">
		<div class="container" align="center">
			<div class="col-md-9">
					<div class="row row-pb-lg" id="commentList" align="left"></div>
					<c:if test="${sessionScope.login == 'customer'}">
						<div class="row" align="left">
							<div class="col-md-12">
								<div class="row headbox-sm"><h2 class="heading-2-b">한줄평 작성</h2></div>
								<div class="row form-group">
									<div class="col-md-12">
										<!-- <label for="message">Message</label> -->
										<textarea name="content" id="content" cols="30" rows="5" class="form-control"></textarea>
										<div id="commentError"></div>
									</div>
								</div>
								<div class="form-group" align="center">
									<button onclick="submit()" class="btn btn-primary">등록</button>
								</div>
							</div>
						</div>
					</c:if>
					<script type="text/javascript">
						function submit() {
							if ($('#content').val() == "") {
								$('#content')
										.attr("placeholder", "내용을 입력해 주세요");
								return;
							}
							var content = $('#content').val();
							var exhibition_no = 1;
							$.ajax({
								url : 'addComment',
								type : 'post',
								data : {
									content : content,
									exhibition_no : exhibition_no
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										alert('댓글이 작성되었습니다');
										$('#content').val("");
										$('#commentList').load(
												'commentList?exhibition_no=1');
									} else {
										$('#commentError').html("<b>서버오류</b>");
									}
								},
								error : function() {
									$('#commentError').html("<b>페이지오류</b>");
								}
							});
						};
					</script>
			</div>
		</div>
	</div>
</div>
</body>
</html>