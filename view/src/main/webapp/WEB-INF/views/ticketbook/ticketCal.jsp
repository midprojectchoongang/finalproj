<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		<script type="text/javascript">
        var today = new Date();
        var year = today.getFullYear();
        var month = today.getMonth();
        var day = today.getDay();
 
        month += 1;
 
        function dayy(year, month){ //월의 일수를 구함
            switch(month){
                case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                return 31;
 
                case 4: case 6: case 9: case 11:
                return 30;
 
                case 2:
                if(((year%400)==0||(year%4)==0&&(year%100)!=0)){
                    return 29;
                }
                else{
                    return 28;
                }
            }
            
        } 
        
        function prevmonth(){ //이전 월로 가는 함수
            
            var ymda = document.getElementById("prev");
            var yg = document.getElementById("Ymd");
     
            month--; //month를 계속 감소시켜준다
            if(month < 1){ // month가 1보다 작아지면
                month = 12; // month를 12로 만들어줌
                year -= 1; //year를 1 감소시켜준다
            }
            if(year < 1970){ //1970년 밑으로는 내려가지 않음..
                alert("기원전");
                 for(var i=1;i<100;i--){
                window.top.moveTo(i ,i *=-1);
                }
            }
     
            var ymda = year + "년" + (month)+"월";
        
            present();
            } 
     
		function nextmonth(){  //다음 월로 가는 함수
                  
            var ymda = document.getElementById("next");
            var yg = document.getElementById("Ymd");
     
            month++; //month 를 계속 증가시켜줌
            if(month > 12){ //만약 month가 12를 넘어가면
                month = 1; // month를 1로 만듦
                year += 1; //year을 1 증가시켜준다
            }
     
            var ymda = year + "년" + month+"월";
        
            present(); //present()함수를 호출하여 다시 찍어줌
     
        }
		
        function present(){
        
        var start = new Date(year, month-1, 1);
        var ymda = document.getElementById("Ymd");
        var Tab = document.getElementById("tab");
        var dayTab = document.getElementById("dayTab");
        
        var ym = year + "년" + (month)+"월";
    
        ymda.innerHTML = ym;
        
   		}
    </script>
<div class="colorlib-loader"></div>
	<div id="page">
	<%@ include file="../mainPage/header.jsp"%>
		<div id="colorlib-container">
		<div class="container" align="center">
		    <div class="row">
		    <div class="col-md-9">
		    
    <div class="row">
    <div class="col-md-12">
	    <table class="table" id="tab" border="1">
	        <tr id="dayTab">
	            <td align="center" id="prev" style="width: 10%;"><label onclick="prevmonth()">≤</td>
	            <th colspan="5" align="center" id="Ymd" style="width: 50%; height: 50px;"></th>
	            <td align="center" id="next" style="width: 10%;"><label onclick="nextmonth()">≥</td>
	        </tr>
	    </table>
	</div>
	</div>
    </div>
    </div>
	<script type="text/javascript">
		present();
	</script>
					</div>
				</div>
			</div>
</body>
</html>