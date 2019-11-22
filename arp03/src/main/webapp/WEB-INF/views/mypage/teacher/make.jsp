<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../../include/header.jsp"/>
	
	<form action="make.lec" method="post" autocomplete=off>
		<input type="hidden" value="">
		강의명:<input name="title"><br>
		시작일:<input type="date" name="startdate" id="startdate"><br>
		시작시간:<input name="starttime"><br>
		몇시간:<input name="inghour"><br>
		강의내용:<input name="content"><br>
		수정사유:<input name="updatecomment"><br>
		학생정원:<input name="headcount"><br>
		총회차:<input name="nth" id="nth" value="10"><br>
		요일:
		<input type="checkbox" name="week" value=0>일
		<input type="checkbox" name="week" value=1>월
		<input type="checkbox" name="week" value="2">화
		<input type="checkbox" name="week" value="3">수
		<input type="checkbox" name="week" value="4">목
		<input type="checkbox" name="week" value="5">금
		<input type="checkbox" name="week" value="6">토
		<br>
		장소:<input name="place"><br>
		
		<br>
		
		<table style="text-align:center;float:left;">
			<thead>
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
	
		<div id="chooseClassdate" style="float:left;">
		
		</div>
		
		<br clear="both">
		
		<button>요청</button>
	</form>
	
	
	
	
	
	<script>
		var arr=[];
		
		function listClassdates_arr(arr){
			arr.sort()
			var str='';
			for(i=0;i<arr.length;i++){
				str+='<input type="date" name="classdate" value="'+arr[i]+'"><br>'
			}
			$('#chooseClassdate').html('')
			$('#chooseClassdate').append(str)
		}
		
		function listClassdates(){
			console.log("list")
			arr=[];
			var c=0;
			var limit=$('#nth').val();
			var start=$('#startdate').val();
			var ddd=new Date(start).getDay();
			console.log(ddd)
			$('input[name="week"]').eq(ddd).prop('checked',true)
			
			var week=[];
			$('input[name="week"]:checked').each(function(){
				week.push(parseInt($(this).val()))
			})
			
			for(i=0;i<limit;i++){
				for(j=0;j<week.length;j++){
					if(i==0 && ddd<=week[j]){
						if(holiday.indexOf(date_add(start, 7*i+week[j]-ddd))==-1){
							arr.push(date_add(start, 7*i+week[j]-ddd))
						}
					}else if(i!=0){
						if(holiday.indexOf(date_add(start, 7*i+week[j]-ddd))==-1){
							arr.push(date_add(start, 7*i+week[j]-ddd))
						}
					}
					if(arr.length>=limit)break;
				}
				if(arr.length>=limit)break;
			}
			
			listClassdates_arr(arr)
			calend(yyyy,mm);
		}
		
		$('input[name="startdate"]').on('input',listClassdates)
		$('input[name="week"]').on('input',listClassdates)
		$('#nth').on('input',listClassdates)
		$(document).on('input','input[name="classdate"]',function(){
			arr=[];
			$('input[name="classdate"]').each(function(){
				arr.push($(this).val())
			})
			listClassdates_arr(arr)
			calend(yyyy,mm);
		})
		
		function date_add(sDate, nDays) {
		    var yy = parseInt(sDate.substr(0, 4), 10);
		    var mm = parseInt(sDate.substr(5, 2), 10);
		    var dd = parseInt(sDate.substr(8), 10);
		
		    d = new Date(yy, mm - 1, dd + nDays);
		    yy = d.getFullYear();
		    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
		    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
		    return '' + yy + '-' +  mm  + '-' + dd;
		}
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
						$(this).css('background','gray')
					}
				}
			}
		})
		
		//arrr[i]의 날짜에 지정된 예약날짜
		$('td.real').each(function(index,item){
			var mm = $('#mm').html(); mm = (mm < 10) ? '0' + mm : mm;
		    var dd = $(this).data('dd'); dd = (dd < 10) ? '0' + dd : dd;
			for(i=0;i<arr.length;i++){
				if($('#yyyy').html()+'-'+mm+'-'+dd==arr[i]){
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
/* 	var each_sc=new Date("${scc.class_day}")
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
	    
	    var idx=arr.indexOf($('#yyyy').html()+"-"+$mm+"-"+dd)
	    if(idx>-1){
	    	arr.splice(idx, 1)
	    }else{
		    arr.push($('#yyyy').html()+"-"+$mm+"-"+dd)
	    }
	    listClassdates_arr(arr)
	    calend(yyyy,mm);

			
		/*	$.ajax({
				url:'/class/classInfosubclass',
				async:false,
				type:'POST',
				data:{
					class_date:$('#yyyy').text()+'-'+mm+'-'+dd,
					class_no:$('#class_no').val(),
				},
				//dataType: 'application/json;charset=utf-8',
				dataType:'json',
				//contentType:"application/json;charset=utf-8",
				success:function(data){
					console.log(data)
					$('#clicked_subclass').text('')
					for(i=0;i<data.length;i++){
						$('#clicked_subclass').text($('#clicked_subclass').text()+JSON.stringify(data[i]))
					}
				}
			})*/
	})
	</script>
			
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>