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
		<script type="text/javascript">
		$(function () {
		    $('[data-toggle="popover1"]').popover();
		    $('#pop').popover({
		    	placement : 'bottom',
		    	trigger : 'hover click'
		    });
		})
		$(function () {
		    $('[data-toggle="popover2"]').popover();
		    $('#pop').popover({
		    	placement : 'bottom',
		    	trigger : 'hover click'
		    });
		})
		$(function () {
			$('#list3').css('font-size','25px').css('font-weight','bold');
		})
	</script>
	<div id="colorlib-container" align="center">
		<div class="row headbox"><h2 class="heading-2">전시회</h2>
			<a href="${path }/exList" style="color: white;" id="list1">ALL&emsp;</a>
			<b style="color: white;">/</b>
			<a href="${path }/exList?listType=p" style="color: white;" id="list2">&emsp;My #HASH</a>
			<a tabindex="0" role="button" data-toggle="popover1" data-placement="bottom" data-trigger="focus" 
				data-content="가입 시 설정한 내 #HASH가 포함된 전시 리스트를 보여줍니다.">
				<img src="${path }/images/tooltip.png" width="15px" style="outline: 0; border: 0;">
			</a>&emsp;
			<b style="color: white;">/</b>
			<a href="${path }/hashSearch" style="color: white;" id="list3">&emsp;By #HASH</a>
			<a tabindex="0" role="button" data-toggle="popover2" data-placement="bottom" data-trigger="focus" 
				data-content="보고자 하는 #HASH를 선택하여 그것이 포함된 전시 리스트를 보여줍니다.">
				<img src="${path }/images/tooltip.png" width="15px" style="outline: 0; border: 0;">
			</a>
		</div>
		<div class="container">
		<div class="col-md-9">
			<div class="row formbox">
				<div class="row">
					<div class="col-md-12">
						<input type="text" id="keyword" class="form-control" onkeyup="filter()" placeholder="Type #HASH">
					</div>
				</div>			
				<hr>
				<div class="row row-pb-lg" style="height: 200px; overflow: hidden; margin-bottom: 50px;">
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
				<div class="row row-pb-lg">
				<form name="frm" action="exList">
					<div class="col-md-12 btn-group-lg" style="margin-bottom: 50px;">
						<table class="table-box">
						<tr>
							<td style="text-align: center; width: 80%; border-bottom: 1px solid #eee;">
								<p class="tags" id="prehash" style="min-height: 35px;"></p>
							</td>
						</tr>
						<tr>
							<td>
								<div id="warnDisp" class="warn-style" align="center"></div>
							</td>
						</tr>
						</table>
					</div>	
					<button type="button" class="btn btn-primary" onclick="search()">#hash로 검색</button>
					<input type="hidden" name="keyword" value="">
				</form>
				</div>
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

			</div>
		</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>