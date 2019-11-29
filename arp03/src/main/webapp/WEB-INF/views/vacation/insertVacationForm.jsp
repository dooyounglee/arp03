<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청하기</title>
<!-- jQuery UI CSS파일 --> 
<%@ include file="../include/bhead.jsp"%>
</head>
<body>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
        <div class="page-wrapper">





	<h2 align="center"> 휴가 신청하기</h2>
	<form align="center" action="vinsert.me" method="POST" >
	
	<input type="hidden" name="m_no" id="m_no" value="${mem.m_no }" readonly><br>
<%-- 	강의번호:<input type="text" name="lec_no"  id="lec_no" value="${param.lec_no }" readonly><br> --%>
	<%-- 강의명:<input type="text" name="title" id="title"value="${param.title }" readonly><br> --%>
	제목:<input type="text" id="vacation_title" name="vacation_title"><br>
	사유:<textarea name="reason"  id="reason" rows="4" cols="50" placeholder="사유입력"></textarea><br>
	<table style="text-align:center;float:center;">
			<thead style="text-align:center;float:center;">
				<tr>
					<td colspan=1 id='prevmonth'><</td>
					<td colspan=5><span id="yyyy">2019</span>년 <span id="mm">8</span>월</td>
					<td colspan=1 id='nextmonth'>></td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
				<!-- <input id="rlaalstkd" name=vacation_date> -->
				<div id="dateArea">
				</div>
	<button type="submit" id="submit">등록하기</button> 
	<button type="button" onclick="location.href='vlist.me';">목록으로</button>
	</form>
	
	
	
	
	
	

		<!-- footer -->
        <footer class="footer">
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	<script>
		var arr=[];
	
		$("#howdate").on("change", function(){
			var start_date = $("#testDatepicker").val()//20190101
			var yyyy= start_date.substr(0,4)
			var MM = parseInt(start_date.substr(4,2))-1
			var dd = parseInt(start_date.substr(6,2))
			var howdate = parseInt($(this).val())
			var today=new Date(yyyy,MM,dd+howdate)			
			console.log(today.getFullYear())
			console.log(today.getMonth()+1)
			console.log(today.getDate())
			console.log(today)
			
			var date = String(today.getDate());
			var zerodate = "";
			var message ="날짜를 선택해주세요"
		

			
			if(today.getDate() < 10){
				
				var zerodate ="0"+date
				
			}else{
				
				var zerodate = date
			}

			if(String(today.getFullYear()) == "NaN"){
				$("#totalVacation").val(message)
			}else{
				
			$("#totalVacation").val(String(today.getFullYear()) + String(today.getMonth()+1) + zerodate )
				
			}
			
			
		})
	
	</script>
	
	<script>
	
	var m_no = $("#m_no").val();
	var lec_no =$("#lec_no").val();
	var title = $("#title").val();
	console.log($("#title").val());
	
	
	var allData = {			
	"arrDate" : arr,
	"m_no" : m_no,
	"lec_no":lec_no,
	
	};
	
/*	
 $(function(){
		$("#submit").click(function(){
			$.ajax({
				url:"vinsertDate.me",
				dataType:"json",
				type:"post",
				data:allData,
				success: function(data){
					if(data==1){
						console.log(data);
					}else{
						console.log("실패");
						alert("날짜를 선택하세요");
						return false;
					}
				},
				error: function(){
					console.log("에러")
				}
			});
		})
	});
*/
	</script>
	
	
	
	
	
	
	
		<script>
	var holiday=['2019-06-06','2019-08-15','2019-09-12','2019-09-13','2019-09-14','2019-10-03','2019-10-09','2019-01-01','2019-05-05','2019-10-03','2019-12-25','2020-01-01'];
	//var arrr=[];
	
	function calend(yyyy,mm){
		var mm_lastday=new Date(yyyy,mm,0).getDate();
		var ddd_firstday=new Date(yyyy,mm-1,1).getDay();
	
		var tbody=$('tbody')
		tbody.empty()
	
		
		var str='';
		var x=0;
		var y=0;
		var count=1;
		for(j=0;j<6;j++){
			str+='<tr>'
			for(i=0;i<7;i++){
				if(j==0 && i<ddd_firstday){
					str+='<td></td>'
				} else if (count<=mm_lastday){
					str+='<td class="real" data-dd="'+count+'">'+(count++)+'</td>'		
				}
			}
			if(count>mm_lastday)break;
			str+='</tr>'
		}
		tbody.append(str)
		
		//오늘 이전날짜는 회색
		$('td.real').each(function(index,item){
			if(yyyy<today_yyyy){
				$(this).css('background','gray')
			}else if(yyyy==today_yyyy){
				if(mm<today_mm){
					$(this).css('background','gray')
				}else if(mm==today_mm){
					if($(this).data('dd')<today_dd){
						$(this).css('background','gray');
					}
				}
			}
		})
		
		//arrr[i]의 날짜에 지정된 예약날짜
		$('td.real').each(function(index,item){
			var mm = $('#mm').html(); mm = (mm < 10) ? '0' + mm : mm;
		    var dd = $(this).data('dd');
		    dd = (dd < 10) ? '0' + dd : dd;
			for(i=0;i<arr.length;i++){
				 if($('#yyyy').html()+'/'+mm+'/'+dd==arr[i]){
					$(this).css('background','blue').css('cursor','pointer')
					$(this).data('exist',true);
					
				 }
			}
			
		
		})
	}
	</script>

	<script>
	//arr채우기
	//var arrr=[];
 	/* var each_sc=new Date("${scc.class_day}")
	var each_sc_yyyy=each_sc.getFullYear();
	var each_sc_mm=each_sc.getMonth()+1;
	var each_sc_dd=each_sc.getDate();
	arr.push(each_sc_yyyy+'-'+each_sc_mm+'-'+each_sc_dd) */
	//var arrr=['2019-12-01','2019-12-02','2019-11-16','2019-11-18'];
	</script>
				
	<script>
	var today=new Date();
	var today_yyyy=today.getFullYear()
	var today_mm=today.getMonth()+1;
	var today_dd=today.getDate();
	
	var yyyy=today_yyyy;
	var mm=today_mm
	$('#yyyy').html(yyyy)
	$('#mm').html(mm)
	
	calend(yyyy,mm);
	
	$('#prevmonth').on('click',function(){
		mm--;
		if(mm==0){
			yyyy--;mm=12;
		}
		$('#yyyy').html(yyyy)
		$('#mm').html(mm)
		calend(yyyy,mm);
	})
	$('#nextmonth').on('click',function(){
		mm++;
		if(mm==13){
			yyyy++;mm=1;
		}
		$('#yyyy').html(yyyy)
		$('#mm').html(mm)
		calend(yyyy,mm);
	})
	$(document).on('click','td.real',function(){
		var $mm = $('#mm').html(); $mm = ($mm < 10) ? '0' + $mm : $mm;
	    var dd = $(this).data('dd'); dd = (dd < 10) ? '0' + dd : dd;
	    console.log(dd);
	    
	    
	    var idx=arr.indexOf($('#yyyy').html()+"/"+$mm+"/"+dd)
	    if(idx>-1){
	    	arr.splice(idx, 1)
	    }else{
		    arr.push($('#yyyy').html()+"/"+$mm+"/"+dd)
	    }
	    
	    
		
	    
	    //listClassdates_arr(arr)
	    console.log(arr)
	    $('#dateArea').html('')
	    var str=""
	    for(i=0;i<arr.length;i++){
	    	str+='<input name="dateArea" value="'+arr[i]+'"><br>'
	    }
	    $('#dateArea').append(str)
	    calend(yyyy,mm);
		
			

	});
	
	
	</script>
</body>
</html>