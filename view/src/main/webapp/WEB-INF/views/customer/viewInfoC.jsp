<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container" align="center">
			<div class="container">
				<div class="col-md-9">
					<div class="row" >
						<div class="row headbox"><h2 class="heading-2">회원정보</h2></div>
							<div class="row" align="left">
							<table class="table table-ticket">
							<tr>
								<td>
									<label for="c_id">id</label>
									<div class="col-md-12">																										
										${customerdto.c_id }										
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label for="nickname">nickname</label>
									<div class="col-md-12">
										${customerdto.nickname }						
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label for="subject">email</label>
									<div class="col-md-12">
										${customerdto.email }										
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label>prefered #HashTag</label>
									<div class="col-md-12">
										<p class="tags">
											<c:forEach var="htl" items="${selectedHash }">
												<span class="tag">
													<a href="#" class="name"><i class="icon-tag"></i> ${htl.hash_title }</a>
												</span>
											</c:forEach>
										</p>
									</div>
								</td>
							</tr>
							</table>
							</div>
							<div class="form-group" style="text-align: center;">
								<a href="main">main</a>
								<a href="logoutC">logout</a>
								<a href="updateFormC">update</a>
								<a href="deleteC" onclick="return confirm('really?');">delete</a>						
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

