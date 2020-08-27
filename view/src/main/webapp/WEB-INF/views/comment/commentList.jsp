<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="colorlib-loader"></div>
<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
	
	
	
	<div id="colorlib-container">
		<div class="container">
			<div class="row">
				<div class="col-md-12 content">
					<div class="row row-pb-lg">
						<div class="col-md-12">
							<h2>${count } Comments</h2>
							<c:forEach items="${cmtList }" var="cl">
							<c:if test="${cl.del == 'n' }">
								<div class="review">
							   		<div class="desc">
							   			<h4>
							   				<span class="text-left">${cl.c_id }</span>
							   				<span class="text-right">${cl.reg_date }</span>
							   			</h4>
							   			<p>${cl.content }</p>
							   		</div>
							   	</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h2>Say something</h2>
							<form action="#">
								<div class="row form-group">
									<div class="col-md-12">
										<!-- <label for="message">Message</label> -->
										<textarea name="message" id="message" cols="30" rows="5" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<input type="submit" value="Post Comment" class="btn btn-primary">
								</div>
							</form>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>

