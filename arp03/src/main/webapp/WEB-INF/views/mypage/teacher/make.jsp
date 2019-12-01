<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
        <div class="page-wrapper">



        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Apply Lecture</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="applyList.lec">Apply List</a></li>
                            <li class="breadcrumb-item active">Apply Lecture</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%-- <%@ include file="../../include/blecturemenu.jsp" %> --%>
                	
                    <!-- <div class="col-lg-9 col-xlg-4 col-md-8"> -->
                    <div class="col-lg-9 col-xlg-9 col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex no-block align-items-center">
                                    <div>
                                        <h4 class="card-title">Default Basic Forms</h4>
                                        <h6 class="card-subtitle"> All bootstrap element classies </h6>
                                    </div>
                                </div>
                                <form class="form" action="make.lec" method="post" autocomplete=off>
                                    <div class="form-group mt-4 row">
                                        <label class="col-md-2 col-form-label">강의명</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="text" name="title">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-search-input" class="col-md-2 col-form-label">시작일</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="date" name="startdate" id="startdate">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-email-input" class="col-md-2 col-form-label">시작시간</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="time" name="starttime">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-url-input" class="col-md-2 col-form-label">수업시간(분)</label>
                                        <div class="col-md-10">
                                            <input class="form-control" name="inghour">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-tel-input" class="col-md-2 col-form-label">강의내용</label>
                                        <div class="col-md-10">
                                            <input class="form-control" name="content">
                                        </div>
                                    </div>
                                    <!-- <div class="form-group row">
                                        <label for="example-password-input" class="col-md-2 col-form-label">수정사유</label>
                                        <div class="col-md-10">
                                            <input class="form-control" name="updatecomment">
                                        </div>
                                    </div> -->
                                    <div class="form-group row">
                                        <label for="example-number-input" class="col-md-2 col-form-label">학생정원</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="number" name="headcount">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-datetime-local-input" class="col-md-2 col-form-label">총회차</label>
                                        <div class="col-md-10">
                                            <input class="form-control" name="nth" id="nth">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="example-date-input" class="col-md-2 col-form-label">장소</label>
                                        <div class="col-md-10">
                                            <input class="form-control" name="place">
                                        </div>
                                    </div>
                                    <div class="form-group row">
	                                    <label class="col-md-2 col-form-label">요일</label>
	                                    <div class="col-md-10">
		                                    <div class="demo-checkbox">
			                                    <input type="checkbox" id="md_checkbox_1" class="chk-col-red" name="week" value="0">
			                                    <label for="md_checkbox_1" style="min-width: 70px;">일</label>
			                                    <input type="checkbox" id="md_checkbox_2" class="chk-col-pink" name="week" value="1">
			                                    <label for="md_checkbox_2" style="min-width: 70px;">월</label>
			                                    <input type="checkbox" id="md_checkbox_3" class="chk-col-purple" name="week" value="2">
			                                    <label for="md_checkbox_3" style="min-width: 70px;">화</label>
			                                    <input type="checkbox" id="md_checkbox_4" class="chk-col-deep-purple" name="week" value="3">
			                                    <label for="md_checkbox_4" style="min-width: 70px;">수</label>
			                                    <input type="checkbox" id="md_checkbox_5" class="chk-col-indigo" name="week" value="4">
			                                    <label for="md_checkbox_5" style="min-width: 70px;">목</label>
			                                    <input type="checkbox" id="md_checkbox_6" class="chk-col-blue" name="week" value="5">
			                                    <label for="md_checkbox_6" style="min-width: 70px;">금</label>
			                                    <input type="checkbox" id="md_checkbox_7" class="chk-col-light-blue" name="week" value="6">
			                                    <label for="md_checkbox_7" style="min-width: 70px;">토</label>
			                                </div>
	                                    </div>
	                                </div>
	                                <button class="btn btn-success">요청</button>
	                                <div id="chooseClassdate1" style="float:left;display:none">
		
									</div>
                                </form>
                            </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xlg-3 col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex no-block align-items-center">
                                    <div>
                                        <h4 class="card-title">Default Basic Forms</h4>
                                        <h6 class="card-subtitle"> All bootstrap element classies </h6>
                                    </div>
                                </div>
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
                            </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
		<!-- 총회차:<input name="nth" id="nth" value="10"><br> -->
		요일:
		<!-- <input type="checkbox" name="week" value=0>일
		<input type="checkbox" name="week" value=1>월
		<input type="checkbox" name="week" value="2">화
		<input type="checkbox" name="week" value="3">수
		<input type="checkbox" name="week" value="4">목
		<input type="checkbox" name="week" value="5">금
		<input type="checkbox" name="week" value="6">토 -->
		<br>
		장소:<input name="place"><br>
		
		<br>
		
		<!-- <table style="text-align:center;float:left;">
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
		</table> -->
	
		<div id="chooseClassdate" style="float:left;">
		
		</div>
		
		<br clear="both">
		
		<button>요청</button>
	</form>
	
	
	
	
	
	<script>
		var arr=[];
		
		function listClassdates_arr(arr){
			if(arr.length!=$('#nth').val()){
				$('#nth').css('border-color','red')
			}else{
				$('#nth').css('border-color','#ced4da')
			}
			arr.sort()
			var str='';
			for(i=0;i<arr.length;i++){
				str+='<input type="date" class="form-control col-10" name="classdate" value="'+arr[i]+'">';
				str+='<button class="btn btn-danger removeDateBtn">X</button><br>'
			}
			$('#chooseClassdate').html('')
			$('#chooseClassdate').append(str)
			$('#chooseClassdate1').html('')
			$('#chooseClassdate1').append(str)
		}
		
		function listClassdates(){
			arr=[];
			var c=0;
			var limit=$('#nth').val();
			var start=$('#startdate').val();
			var ddd=new Date(start).getDay();
			//$('input[name="week"]').prop('checked',false)
			$('input[name="week"]').eq(ddd).prop('checked',true)
			
			//하나라도 없으면 더 못하게
			if(start==""){
				alert("시작날짜입력해주세요.")
				return;
			}else{
				
			}
			
			var week=[];
			$('input[name="week"]:checked').each(function(){
				week.push(parseInt($(this).val()))
				console.log(week)
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
		
		$(document).on('click','.removeDateBtn',function(){
			var idx=arr.indexOf($(this).prev().val())
			arr.splice(idx, 1)
			listClassdates_arr(arr)
			calend(yyyy,mm);
		})
		$('input[name="startdate"]').on('input',listClassdates)
		$('input[name="week"]').on('input',listClassdates)
		$('#nth').on('focusout',listClassdates)
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