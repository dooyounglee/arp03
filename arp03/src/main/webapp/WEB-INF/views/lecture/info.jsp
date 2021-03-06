<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center" onselectstart="return false" ondragstart="return false">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
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



        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Lecture Info</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no }">${lec.title }</a></li>
                            <li class="breadcrumb-item active">강의계획</li>
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
                	<%@ include file="../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-10 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title" id="1">${lec.title } 강의계획 입니다.</h1>
                                <h4 class="card-title mt-4" id="22">담당 선생님</h4>
                                <p>${lec.name }</p>
                                <h4 class="card-title mt-4" id="3">개강일</h4>
                                <p>${lec.startdate.split(' ')[0] }</p>
                                <h4 class="card-title mt-4" id="4">강의시간</h4>
                                <p>${lec.starttime.split(' ')[1] }~${lec.inghour }분</p>
                                <h4 class="card-title mt-4" id="5">강의 소개</h4>
                                <p>${lec.content }</p>
                                <h4 class="card-title mt-4" id="6">참여인원</h4>
                                <p>${lec.cnt } / ${lec.headcount }</p>
                                <h4 class="card-title mt-4" id="6">총 회차</h4>
                                <p>${lec.nth }</p>
                                <h4 class="card-title mt-4" id="6">장소</h4>
                                <p>${lec.place }</p>
                                <h4 class="card-title mt-4" id="6">요일</h4>
                                <p>${lec.dayofweek }</p>
                                <h4 class="card-title mt-4" id="6">수업날짜</h4>
                                <div class="row">
                                	<div class="col-3">
                                		<c:forEach var="cd" items="${list }" varStatus="i">
			                                <p>${i.count}회차: ${cd.classdate.split(' ')[0] }</p>
		                                </c:forEach>
                                	</div>
                                	<div class="col-9">
                                		<table class="pd-0" style="text-align:center;">
											<thead>
												<tr>
													<td colspan=1 id='prevmonth'><</td>
													<td colspan=5><span id="yyyy">2019</span>년 <span id="mm">8</span>월</td>
													<td colspan=1 id='nextmonth'>></td>
												</tr>
												<tr>
													<td width="50px" height="50px">일</td>
													<td width="50px" height="50px">월</td>
													<td width="50px" height="50px">화</td>
													<td width="50px" height="50px">수</td>
													<td width="50px" height="50px">목</td>
													<td width="50px" height="50px">금</td>
													<td width="50px" height="50px">토</td>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
                                	</div>
                                </div>
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
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	<jsp:include page="../include/header.jsp"/>
	<h1>${lec.title } 강의계획</h1>
	${lec }
	
	<jsp:include page="../include/footer.jsp"/>
	
	<script>
		var arr=[];
		
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
					str+='<td height="50px"></td>'
				} else if (count<=mm_lastday){
					str+='<td class="real" data-dd="'+count+'" height="50px">'+(count++)+'</td>'		
				}
			}
			if(count>mm_lastday)break;
			str+='</tr>'
		}
		tbody.append(str)
		
		//오늘 이전날짜는 회색
/* 		$('td.real').each(function(index,item){
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
		}) */
		
		//arr[i]의 날짜에 지정된 예약날짜
		$('td.real').each(function(index,item){
			var mm = $('#mm').html(); mm = (mm < 10) ? '0' + mm : mm;
		    var dd = $(this).data('dd'); dd = (dd < 10) ? '0' + dd : dd;
			for(i=0;i<arr.length;i++){
				if($('#yyyy').html()+'-'+mm+'-'+dd==arr[i]){
					$(this).css('background','blue').css('color','white')
					$(this).data('exist',true);
				}
			}
		})
	}
	</script>
	<script>
		var arr=[];
	</script>
	<c:forEach var="cd" items="${list }" varStatus="i">
		<script>
			arr.push("${cd.classdate.split(' ')[0] }")
		</script>
    </c:forEach>
				
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
	</script>
</body>
</html>