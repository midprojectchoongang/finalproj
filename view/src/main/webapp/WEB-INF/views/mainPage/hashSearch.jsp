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
			<form name="frm" action="exList">
			<div class="row-pb-sm">
				<div class="row headbox-sm"><h2 class="heading-2-b">Search</h2></div>
				<div class="row-pb-sm">
					<div class="col-md-12">
						<input type="text" id="keyword" class="form-control" onkeyup="filter()" placeholder="Type #HASH"
							 style="width:80%; display: inline;">
						<div style="cursor: pointer;" class="btn btn-info" onclick="search()">검색</div>
					</div>
					<div class="col-md-12" style="margin-top: 50px;">
						<p class="tags" id="prehash" style="min-height: 35px;"></p>
						<div id="warnDisp" class="warn-style"></div>
					</div>
				</div>
			</div>
			<input type="hidden" name="keyword" value="">
			</form>
			<script type="text/javascript">
				function filter() {
					var keyword, name, tag, i;
					keyword = document.getElementById("keyword").value.toUpperCase();
					tag = document.getElementsByName("taglists");
					for (i=0; i<tag.length; i++) {
						name = tag[i].getElementsByClassName("name");
						if(name[0].innerHTML.toUpperCase().indexOf(keyword) > -1) {
							tag[i].style.display = "block";
						} else {
							tag[i].style.display = "none";
						}
					}
				}
				
				function search() {
					if (hash_select[0] == null || hash_select[0] == "") {
						$('#warnDisp').html('#HashTag를 최소 1개 이상 선택하여 주십시요');
						return;
					}
					var hts = new Object();
					hts.hash = hash_select;
					var values = JSON.stringify(hts);
					$(function() {
					    $('input[name=keyword]').val(values);
					});
					document.frm.submit();
				}
			</script>
			<div class="row-pb-lg">
				<div class="row headbox-sm"><h2 class="heading-2-b">#HASHTAG</h2></div>
				<div class="row-pb-md">
					<div class="col-md-12">
						<p class="tags">
							<c:forEach var="htl" items="${hashList }">
							<span class="tag" name="taglists">
								<a onclick="addPrehash('${htl.hash_title }')" class="name" style="cursor: pointer;">
									<i class="icon-tag"></i> ${htl.hash_title }
								</a>
							</span>
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var hash_html = new Array();
				var hash_select = new Array();
				var max_hashtag = 3;
				
				function addPrehash(hash_title) {
					$('#warnDisp').html('');
					if (hash_html.length < max_hashtag) {
						if (hash_html.length > 0) {
							hash_html[hash_html.length] = '<span class="tag" id="'+hash_title+'" style="float:inherit;">' +
									'<a onclick="removePrehash(\''+hash_title+'\')" style="cursor:pointer">' +
									'<i class="icon-tag"></i> '+hash_title+'</a></span>';
							hash_select[hash_select.length] = hash_title;
							for (i=0; i<hash_html.length; i++) {
								if (i+1 == hash_html.length) {
									break;
								} else {
									for (j=i+1; j<hash_html.length; j++) {
										if (hash_html[i] == hash_html[j]) {
											hash_html.splice(j, 1);
											hash_select.splice(j, 1);
											$('#warnDisp').html('#HashTag는 중복하여 선택할 수 없습니다');
											return;
										} else {
											continue;
										}
									}
								}
							}
						} else {
							hash_html[0] = '<span class="tag" id="'+hash_title+'" style="float:inherit;">' +
									'<a onclick="removePrehash(\''+hash_title+'\')" style="cursor:pointer">' +
									'<i class="icon-tag"></i> '+hash_title+'</a></span>';
							hash_select[0] = hash_title;
						}			
						if (hash_html.length > 1){
							$('#prehash').append(hash_html[hash_html.length-1]);
					    } else {
							$('#prehash').html(hash_html[0]);
					    }
					} else if (hash_html.length == max_hashtag) {
						$('#warnDisp').html('#HashTag는 최대' + max_hashtag + '개까지만 선택할 수 있습니다');
					}
				}
				
				function removePrehash(hash_title) {
			        for (i=0; i<hash_html.length; i++) {
			        	var title = "#" + hash_title;
			            var search = hash_html[i].indexOf(hash_title);
			            if (search == -1) {
			            	continue;
			            } else {
			            	hash_html.splice(i,1); // html태그 배열에서 삭제
			            	hash_select.splice(i,1); // 값이 저장된 배열에서 삭제
			            	$(title).remove(); // 화면에서 삭제
							$('#warnDisp').html(''); // 경고문구 삭제	            	
			            }
					}
				}
			</script>
		</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>