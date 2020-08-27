<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>만년 달력</title>
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
 
        function present(){
        
        var start = new Date(year, month-1, 1);
        var ymda = document.getElementById("Ymd");
        var Tab = document.getElementById("tab");
        var dayTab = document.getElementById("dayTab");
        
        
        var row = null;
        var cnt = 0;
        
        var ym = year + "년" + (month)+"월";
    
        ymda.innerHTML = ym;
 
        for(var j = 0; j<start.getDay(); j++){ //달력의 시작 일 구함
            cell = dayTab.insertCell();
            cnt+=1;
        }
 
        for(var i = 0; i< dayy(year, month); i++){ //달력 일수만큼 찍어줌
        cell = dayTab.insertCell();
        cell.innerHTML = i+1;
        cnt += 1;
    	}
 
    }
    </script>
</head>
<center>
<body id="body">
    <div class="row">
    <div class="col-md-12">
    <table class = "table" id="tab">
        <tr id="dayTab">
            <td align="center" id="prev" style="width: 23px;"><label onclick="prevmonth()">≤</td>
            <th colspan="5" align="center" id="Ymd" style="width: 150px; height: 50px;"></th>
            <td align="center" id="next" style="width: 23px;"><label onclick="nextmonth()">≥</td>
        </tr>
    </table>
    </div>
    </div>
<script type="text/javascript">
	present();
</script>
</body>
</center>
</html>
