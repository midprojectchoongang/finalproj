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
	<div id="colorlib-container">
		<div class="container" align="center">
		<div class="col-md-9">
			<div class="row" align="left">
				<div class="row headbox"><h2 class="heading-2">#${hashtag.hash_title }</h2></div>
				<div class="row formbox-nonlabel">
					<div class="col-md-12 row-pb-sm">
						<label for="hash_title">#HASHTAG</label><span id="hashDisp" class="warn-style"></span>
						<input onkeyup="hashChk()" type="text" name="hash_title" id="hash_title" class="form-control"
							value="${hashtag.hash_title }">
					</div>
					<script type="text/javascript">
						var chk = "y";
						var cur_title = '${hashtag.hash_title }';
						
						function hashChk(){
					        if ($('#hash_title').val() == "") {
					            $('#hashDisp').html("");
					            return;
					        }
							var hash_title = $('#hash_title').val();
						    $.ajax({
						        url : 'hashChk',
						        type : 'post',
						        //         변수 명        :    변수 값
						        data : {hash_title : hash_title}, success : function(data) {
						            if ($.trim(data) == 0) {
						                $('#hashDisp').html("&emsp;<b>사용 가능한 #HASHTAG입니다</b>");
						            } else if (hash_title == cur_title) {
						                $('#hashDisp').html("&emsp;<b>현재 #HASHTAG입니다</b>");
						            } else {
						                $('#hashDisp').html("&emsp;<b>사용 불가능한 #HASHTAG입니다</b>");
						                chk = "n";       	
						            }
						        },
						        error:function(){
						        	$('#hashDisp').html("&emsp;<b>ERROR</b>");
						        	return false;
						        }
						    });
						}
					</script>
					<div class="col-md-12 row-pb-sm">
						<label for="hashgroup" class="label-normal">#HASHGROUP</label><br>
						<select id="hashgroup" class="form-control">
							<option value="1">종류별
							<option value="2">시대별
							<option value="3">지역별
							<option value="4">전시 유형별
							<option value="5">기타
						</select><br>
						<span id="groupDisp" class="warn-style"></span>
						<script type="text/javascript">
							var hg = "${hashtag.hashgroup}";
							$(function() {
								$('select>option[value='+hg+']').attr('selected','selected');
							});
						</script>
					</div>
					<div class="col-md-12 btn-group-lg">
						<label class="label-normal">#KIND</label><br>
						<button class="btn btn-outline">
							<label for="k1" class="label-normal">Basic&emsp;</label>
							<input type="radio" id="k1" name="kind" class="kind" value="basic" onchange="changeKind()">
						</button>
						<button class="btn btn-outline">
							<label for="k2" class="label-normal">Custom&emsp;</label>
							<input type="radio" id="k2" name="kind" class="kind" value="custom" onchange="changeKind()">
						</button>
					</div>
					<script type="text/javascript">
						var kd = "${hashtag.kind}";
						$(function() {
							if (kd == 'basic') {
								$('.kind[value='+kd+']').attr('checked','checked');
							} else {
								$('.kind[value='+kd+']').attr('checked','checked');
								$('#groupDisp').html("<b>Custom은 선택할 수 없습니다</b>");
								$('#hashgroup').attr('disabled','disabled');
							}
						});
						
						function changeKind() {
							if ($('input[name=kind]:checked').val() == 'basic') {
								$('#groupDisp').html("");
								$('#hashgroup').removeAttr('disabled');
							} else {
								$('#groupDisp').html("<b>Custom은 선택할 수 없습니다</b>");
								$('#hashgroup').attr('disabled','disabled');
							}
						}
					</script>
				</div>
				<div class="col-xs-12" align="center">
					<button onclick="updateHash()" class="btn btn-primary">수정</button>
					<button onclick="deleteHash()" class="btn btn-cta">삭제</button>
				</div>
				<script type="text/javascript">
					function updateHash() {
				        if ($('#hash_title').val() == "") {
				            $('#hashDisp').html("&emsp;<b>#HASHTAG 이름을 입력해 주세요</b>");
				            return;
				        }
				        if (chk == "y") {
							location.href="updateHash?hash_title=" + $('#hash_title').val() + '&cur_title=' + cur_title
									+ "&hashgroup=" + $('#hashgroup').val() + "&kind=" + $('input[name=kind]:checked').val();
					    } else {
					        $('#hashDisp').html("&emsp;<b>다른 #HASHTAG 이름을 사용해 주세요</b>");
					    }
					}
					
					function deleteHash() {
						if (confirm("삭제하시겠습니까?")) {
							location.href="deleteHash?hash_title=" + $('#hash_title').val();
						} else {
							return false;
						}
					}
				</script>
			</div>
			<div class="row-pb-lg">
				<div class="col-xs-12" align="center">
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../mainPage/footer.jsp"%>
</div>
</body>
</html>