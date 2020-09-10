<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	var chk = "";
	function hashChk(){
        if ($('#keyword').val() == "") {
            $('#hashDisp').html("");
            return;
        }
		var hash_title = $('#keyword').val();
	    $.ajax({
	        url : 'hashChk',
	        type : 'post',
	        //         변수 명        :    변수 값
	        data : {hash_title : hash_title}, success : function(data) {
	            if ($.trim(data) == 0) {
	                $('#hashDisp').html("<b>사용 가능한 #HASHTAG입니다</b>");
	                chk = "y";
	            } else {
	                $('#hashDisp').html("<b>이미 존재하는 #HASHTAG입니다</b>");
	                chk = "n";
	            }
	        },
	        error:function(){
	        	alert("에러입니다");
	        }
	    });
	};
	function addHash() {
        if ($('#keyword').val() == "") {
            $('#hashDisp').html("<b>#HASHTAG 이름을 입력해 주세요</b>");
            return;
        }
        if (chk == "y") {
        	location.href = "/master/addHash?hash_title=" + $('#keyword').val() + "&hashgroup=" + $('#hashgroup').val();
	    } else {
	        $('#hashDisp').html("<b>다른 #HASHTAG 이름을 사용해 주세요</b>");
	    }
	}
</script>
</head>
<body>
<div class="colorlib-loader"></div>
	<div id="page">
		<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container" align="center">
			<div class="container">
				<div class="col-md-9">
					<div class="row">
						<div class="row headbox-sm"><h2 class="heading-2-b">#hash 추가</h2></div>
						<div class="row row-pb-md">
							<table class="table">
							<tr>
							<td>
								<select id="hashgroup" class="form-control">
									<option value="1">종류별
									<option value="2">시대별
									<option value="3">지역별
									<option value="4">전시 유형별
									<option value="5">기타
								</select>
							</td>
							<td>
								<input onkeyup="hashChk()" type="text" name="keyword" id="keyword" placeholder="Type #HASH"
									style="text-align: center;" class="form-control">
							</td>
							<td width="10%">
								<button onclick="addHash()" class="btn btn-primary">추가</button>
							</td>
							</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row-pb-lg">
					<div class="col-xs-12" align="center">
						<div id="hashDisp"></div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../mainPage/footer.jsp"%>
	</div>
</body>
</html>