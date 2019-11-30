<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/fullcalendar/core/main.css" rel='stylesheet'/>
<link href='${pageContext.request.contextPath}/resources/fullcalendar/daygrid/main.css' rel='stylesheet'/>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/daygrid/main.js'></script>
<link href='${pageContext.request.contextPath}/resources/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src="${pageContext.request.contextPath}/resources/fullcalendar/interaction/main.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/fullcalendar/timegrid/main.min.js"></script>

<style>
	html, body {
  		margin: 0;
  		padding: 0;
  		font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  		font-size: 14px;
}
	#external-events {
		  position: fixed;
		  z-index: 2;
		  top: 250px;
		  left: 30px;
		  width: 150px;
		  padding: 0 10px;
		  border: 2px solid #ccc;
		  background: #eee;
	}
	.demo-topbar + #external-events { /* will get stripped out */
	  	top: 60px;
	}
	#external-events .fc-event {
		  margin: 1em 0;
		  cursor: move;
	}
	#calendar-container {
		  position: relative;
		  z-index: 1;
		  margin-left: 200px;
	}
	#calendar {
		  max-width: 900px;
		  margin: 20px auto;
	}
	.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 700;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */   
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */        
                              
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        #xx{font-size: 28px;}
        #calendar:hover{cursor: pointer;}
        .card{
			margin-left:auto;
			margin-right: auto;
			/* width:1000px; */
		}
</style>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>    
</head>
<body class="fix-header card-no-border logo-center">
<%@ include file="../include/bhead.jsp"%>
<%@ include file="../include/bpreloader.jsp" %>

	<div id="main-wrapper">

	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	
	<div class="page-wrapper">
		<div class="container-fluid">
	
		<div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">캘린더</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">캘린더</li>
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
        
        <div class="row">
		<div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            
		<h1 align="center" class="card-title">Calendar</h1>
	<br>
	
	<!-- <div id="external-events">
    <p>
      <strong>Draggable Events</strong>
    </p>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div> -->
  
    <div id='calendar'></div><br>
    <!-- <input align="center" type="button" id="btnAddTest" value="일정추가"> -->
    </div>
    	</div>
	                   </div>
	                   </div>
	                   </div>
                         <!-- ============================================================== -->
            			<!-- End Container fluid  -->
            			<!-- ============================================================== -->
	                   
	                   <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	                   
    </div>
    
    </div>
	
	<%@ include file="../include/bjs.jsp" %>
    
    <div class="modal" id="eventt">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">일정 수정</h4>
                        <button type="button" id="xx" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                         <label><h6>내용</h6></label>
                     <input type="text" class="form-control form-control-line" name="title" id="eventTitle" required> </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light close" data-dismiss="modal">취소</button>
                        <button type="button" id="deleteC" class="btn btn-primary">삭제</button>
                        <button type="button" id="updateC" class="btn btn-primary">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
        </div>

    
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var Calendar = FullCalendar.Calendar;
	        var Draggable = FullCalendarInteraction.Draggable;
	     
	        //var containerEl = document.getElementById('external-events');
	        var calendarEl = document.getElementById('calendar');
	        var checkbox = document.getElementById('drop-remove');
	     
	        // initialize the external events
	        // -----------------------------------------------------------------
	     
	        /* new Draggable(containerEl, {
	          itemSelector: '.fc-event',
	          eventData: function(eventEl) {
	            return {
	              title: eventEl.innerText
	            };
	          }
	        }); */

	        // initialize the calendar
	        // -----------------------------------------------------------------

	        $(function(){
	        	getCalList();
	        	
		         $(document).on("click", ".close", function(){
		        	 $(".modal").css({"display":"none"});
		 		});
	        	
	      	});
	        
	        var $count = 0;
	        
	        function getCalList(){
	        	$count++;
	        	
	        	/* if($count > 1) {
        			$("#calendar").empty();
        		} */
	        	$("#calendar").empty();
				var resultEvents = [];
	        	
	        	$.ajax({
		   			url: 'calList.ca', 
		   			dataType:'json',
		   			data:{m_no:${mem.m_no}},
		   			success: function(data) {
		   				$.each(data,function(index, value){
		   					//calendar.addResource({title:value.title, start:value.start, end:value.end});
		   					//console.log(value.start);
		   					//console.log(value.end);
		   					/* var yyyy = value.start.substr(0,4);
		   				    var mm = value.start.substr(5,2);
		   				    var dd = value.start.substr(8,2); */
		   				    
		   				 	//var newStart = new Date(yyyy, mm-1, dd);
		   				 	//console.log("date형:" + newStart);
		   				 	console.log("end날짜 기본값 :" + value.end);
		   				 	var endy = Number(value.end.substr(0,4));
		   				 	var endm = Number(value.end.substr(5,2));
		   				 	var endd = Number(value.end.substr(8,2));
		   				 	
		   				 	var newEnd = new Date(endy, endm-1, endd);
 				
		   				 	//console.log("date형:" + newEnd);
		   				 	//console.log("date형일자:" + endd);
		   				 	//console.log("date형일자+1:" + endd+1);
		   			 	
		   				 	if(value.start != value.end) {
		   				 		var endf = endd + 1;	   				 		
		   				 		console.log("2일 이상 일정의 끝나는 년도 계산" + endy);
		   				 		console.log("2일 이상 일정의 끝나는 월 계산" + endm);
		   				 		console.log("2일 이상 일정의 끝나는 날짜 계산" + endf);
		   				 		
		   				 		if(endf == 31 && endm == 11) {
		   				 			endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 32 && endm == 12){
		   				 			endf = '01';
		   				 			endm = 1;
		   				 			endy = endy + 1;
		   				 			//console.log("12월 마지막날");
		   				 		} else if(endf == 32 && endm == 1){
		   				 			endf = '01';
	   				 				endm = endm + 1;
	   				 				//console.log("1월 마지막날");
		   				 		} else if(endy % 4 == 0 && endf == 30 && endm == 2) {
		   				 			endf = '01';
		   				 			endm = endm + 1;
		   				 			console.log("2월 윤달..");
		   				 		} else if(endy % 4 != 0 && endf == 29 && endm == 2) {
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 			console.log("2월 윤달 아닐때..");
		   				 		} else if(endf == 32 && endm == 3){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 31 && endm == 4){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 32 && endm == 5){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 31 && endm == 6){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 32 && endm == 7){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 32 && endm == 8){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 31 && endm == 9){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		} else if(endf == 32 && endm == 10){
			   				 		endf = '01';
		   				 			endm = endm + 1;
		   				 		}
		   				 		
		   				 		newEnd = new Date(endy, endm-1, endf);
		   					}
		   					//console.log("date형:" + newEnd.getFullYear().toString());
		   					
		   					console.log("end Month : " + endm);
		   				 	console.log("end date : " + newEnd);
		   					
		   					var y = newEnd.getFullYear().toString();
		   					var m = newEnd.getMonth().toString();
		   					var d = newEnd.getDate().toString();

	   				 		
	   				 		if(d == '1' || d == '2' || d == '3' || d == '4' || d == '5' || d == '6' || d == '7' || d == '8' || d == '9') {
	   				 			d = '0' + d;
	   				 		}
	   				 		
	   				 		if(endm == '1' || endm == '2' || endm == '3' || endm == '4' || endm == '5' || endm == '6' || endm == '7' || endm == '8' || endm == '9') {
	   				 			endm = '0' + endm;
	   				 		}
	   				 		
	   				 		console.log("최종 들어갈 년도 :" + y);
	   				 		console.log("최종 들어갈 월 : " + endm);
	   				 		console.log("최종 들어갈 일 : " + d);
		   					
		   					var ymd = (y + "-" + endm + "-" + d);
		   					console.log(index + ":" +  ymd);
		   					
		   					resultEvents.push({id:value.c_no, title:value.title, start:value.start, end:ymd});
		   					console.log(resultEvents);
		   					
		   				});
		   				
		   			}
		   		}).done(function(){
		   				getCalendar(resultEvents); 
		   		});
	        }
	        
	        function getCalendar(arr){
        		//console.log($count);
        		
	   			var calendar = new Calendar(calendarEl, {	
	                plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	                header: {
	                  left: 'prev,next today',
	                  center: 'title',
	                  right: 'dayGridMonth,timeGridWeek,timeGridDay'
	                },
	                editable: true,
	                droppable: true, // this allows things to be dropped onto the calendar
	                /* minTime: '00:00:00',
	                maxTime: '23:59:59', */
	                drop: function(info) {
	                  // is the "remove after drop" checkbox checked?
	                  if (checkbox.checked) {
	                    // if so, remove the element from the "Draggable Events" list
	                    info.draggedEl.parentNode.removeChild(info.draggedEl);
	                  }
	                },
	        		  events: arr,
	        		eventClick: function(info) {
	        	            //event.title = "CLICKED!";
	        	            //$('#calendar').fullCalendar('updateEvent', event);
	        	          	//window.alert("이벤트클릭");
	        	          	console.log(info.event.id);
	        	          	console.log(info.event.start);
	        	          	console.log(info.event.end);
	        	          	//console.log(calendar.getEventById('1').title);
	        	          	$(".modal").css({"display":"block"});
	        	          	$("#eventTitle").val(info.event.title);
	        	          	
	        	          	$("#updateC").on('click', function(){
	        	          		$.ajax({
	        	        	    	url:'updatetitle.ca',
	 	                            type:'post',
	 	                            data:{c_no:info.event.id, title:$("#eventTitle").val()},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		//console.log("성공");
	 	                          		//alert("일정 변경 성공!");
	 	                          		location.reload();
	 	                          		//getCalList();
	 	                          	  } else {
	 	                          		  alert("일정 변경에 실패했습니당");
	 	                          	  } 
	 	                            	//console.log("성공");
	 	                            },
	 	                            error:function(){
	 	                                console.log("ajax 통신 실패");
	 	                            }
	        	        	    });
	        	          	});
	        	          	
	        	          	$("#deleteC").on('click', function(){
	        	          		$.ajax({
	        	        	    	url:'deleteCal.ca',
	 	                            type:'post',
	 	                            data:{c_no:info.event.id},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		//console.log("성공");
	 	                          		/* alert("일정 삭제 완료"); */
	 	                          		location.reload();
	 	                          		//getCalList();
	 	                          	  } else {
	 	                          		  alert("일정 변경에 실패했습니당");
	 	                          	  } 
	 	                            	//console.log("성공");
	 	                            },
	 	                            error:function(){
	 	                                console.log("ajax 통신 실패");
	 	                            }
	        	        	    });
	        	          	});
	        	          
	        	         },
	        	         
	        	     eventResize: function(info) {
	        	        	    console.log(info.event.title + " end is now " + info.event.end);
	        	        	    console.log(info.event.start);
	        	        	    console.log(info.event.id);
	        	        	    
	        	        	    var newStart = (info.event.start.toISOString()).substr(0, 10);
	        	        	    
	        	        	    var yyyy = newStart.substr(0,4);
			   				    var mm = newStart.substr(5,2);
			   				    var dd = newStart.substr(8,2);
			   				 	var d = Number(dd) + 1;
			   				 	
			   				 	if(d == 32 && mm == '10') {
			   				 		d = 1;
			   				 		mm = '11';
			   				 		//console.log("11월테스트");
			   				 	} else if(d == 32 && mm == '11') {
			   				 		d = 1;
			   				 		mm = '12';
			   				 		//console.log("12월테스트");
			   				 	} else if(d == 32 && mm == '12') {
			   				 		d = 1;
		   				 			mm = '1';
		   				 			yyyy = Number(yyyy) + 1;
		   				 			//console.log("yyyy : " + yyyy);
		   				 			//console.log("1월테스트");
			   				 	} else if(d == 32 && mm == '01') {
				   				 	d = 1;
		   				 			mm = '2';
			   				 	} else if(d == 30 && mm == '02' && Number(yyyy) % 4 == 0) {
				   				 	d = 1;
		   				 			mm = '3';
			   				 	} else if(d == 29 && mm == '02' && Number(yyyy) % 4 != 0) {
				   				 	d = 1;
		   				 			mm = '3';
			   				 	} else if(d == 32 && mm == '03') {
				   				 	d = 1;
		   				 			mm = '4';
			   				 	} else if(d == 31 && mm == '04') {
				   				 	d = 1;
		   				 			mm = '5';
			   				 	} else if(d == 32 && mm == '05') {
				   				 	d = 1;
		   				 			mm = '6';
			   				 	} else if(d == 31 && mm == '06') {
				   				 	d = 1;
		   				 			mm = '7';
			   				 	} else if(d == 32 && mm == '07') {
				   				 	d = 1;
		   				 			mm = '8';
			   				 	} else if(d == 32 && mm == '08') {
				   				 	d = 1;
		   				 			mm = '9';
			   				 	} else if(d == 31 && mm == '09') {
				   				 	d = 1;
		   				 			mm = '10';
			   				 	}
	        	        	    
			   				 	console.log("월 : " + mm);
			   				    console.log("일  : " + d)
			   				 	var a = (yyyy + "-" + mm + "-" + d);
			   				    console.log("시작날짜: " + a);
	        	        	    
	        	        	    var newEnd = (info.event.end.toISOString()).substring(0, 10);
	        	        	    //console.log("newStart" + newStart);
	        	        	    console.log("newEnd" + newEnd);
	        	        	    $.ajax({
	        	        	    	url:'updatedate.ca',
	 	                            type:'post',
	 	                            data:{c_no:info.event.id, m_no:${mem.m_no}, title:info.event.title, start:a, end:newEnd},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		console.log("성공");
	 	                          		//getCalList();
	 	                          		location.reload();
	 	                          	  } else {
	 	                          		  alert("일정 추가에 실패했습니당");
	 	                          	  } 
	 	                            	//console.log("성공");
	 	                            },
	 	                            error:function(){
	 	                                console.log("ajax 통신 실패");
	 	                            }
	        	        	    });
	        	        	    
	        	       },
	        	       
	        	       eventDrop: function(info) {
	        	           console.log(info.event.title);
	        	           console.log(info.event.start.toISOString());
	        	           //console.log(info.event.end.toISOString());
	        	           var newStart = (info.event.start.toISOString()).substr(0, 10);
       	        	    
       	        	    	var yyyy = newStart.substr(0,4);
		   				    var mm = newStart.substr(5,2);
		   				    var dd = newStart.substr(8,2);
		   				 	var d = Number(dd) + 1;
		   				 	
		   				 if(d == 32 && mm == '10') {
		   				 		d = 1;
		   				 		mm = '11';
		   				 		//console.log("11월테스트");
		   				 	} else if(d == 32 && mm == '11') {
		   				 		d = 1;
		   				 		mm = '12';
		   				 		//console.log("12월테스트");
		   				 	} else if(d == 32 && mm == '12') {
		   				 		d = 1;
	   				 			mm = '1';
	   				 			yyyy = Number(yyyy) + 1;
	   				 			//console.log("yyyy : " + yyyy);
	   				 			//console.log("1월테스트");
		   				 	} else if(d == 32 && mm == '01') {
			   				 	d = 1;
	   				 			mm = '2';
		   				 	} else if(d == 30 && mm == '02' && Number(yyyy) % 4 == 0) {
			   				 	d = 1;
	   				 			mm = '3';
		   				 	} else if(d == 29 && mm == '02' && Number(yyyy) % 4 != 0) {
			   				 	d = 1;
	   				 			mm = '3';
		   				 	} else if(d == 32 && mm == '03') {
			   				 	d = 1;
	   				 			mm = '4';
		   				 	} else if(d == 31 && mm == '04') {
			   				 	d = 1;
	   				 			mm = '5';
		   				 	} else if(d == 32 && mm == '05') {
			   				 	d = 1;
	   				 			mm = '6';
		   				 	} else if(d == 31 && mm == '06') {
			   				 	d = 1;
	   				 			mm = '7';
		   				 	} else if(d == 32 && mm == '07') {
			   				 	d = 1;
	   				 			mm = '8';
		   				 	} else if(d == 32 && mm == '08') {
			   				 	d = 1;
	   				 			mm = '9';
		   				 	} else if(d == 31 && mm == '09') {
			   				 	d = 1;
	   				 			mm = '10';
		   				 	}

		   				    var a = (yyyy + "-" + mm + "-" + d);
		   				    
	        	           // 하나짜리 일정
	        	           if(info.event.end == null) {
	        	        	   $.ajax({
	        	        	    	url:'movedate.ca',
	 	                            type:'post',
	 	                            data:{c_no:info.event.id, start:a, end:a},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		console.log("성공");
	 	                          		//getCalList();
	 	                          		location.reload();
	 	                          	  } else {
	 	                          		  alert("일정 이동에 실패했습니당");
	 	                          	  } 
	 	                            	//console.log("성공");
	 	                            },
	 	                            error:function(){
	 	                                console.log("ajax 통신 실패");
	 	                            }
	        	        	    });
	        	           } else {
	        	        	   
	        	        	   var newEnd = (info.event.end.toISOString()).substring(0, 10);
		        	          	console.log("드래그용 newEnd" + newEnd);
	        	        	   
	        	        	   $.ajax({
	        	        	    	url:'movedate.ca',
	 	                            type:'post',
	 	                            data:{c_no:info.event.id, start:a, end:newEnd},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		console.log("성공");
	 	                          		//getCalList();
	 	                          		location.reload();
	 	                          	  } else {
	 	                          		  alert("일정 이동에 실패했습니당");
	 	                          	  } 
	 	                            	//console.log("성공");
	 	                            },
	 	                            error:function(){
	 	                                console.log("ajax 통신 실패");
	 	                            }
	        	        	    });
	        	           }

	        	       }
	       
	        	         
	              });
	            
	   			calendar.render();
	   			
	             // calendarId = new FullCalendar.Calendar(calendarEl, calProps);
	   			calendar.on('dateClick', function(info) {
	              	var title = prompt("일정 추가");
	              	  //console.log(info);
	              	if(title == ""){
						alert("일정명을 작성해주세요!");
						return false;
					}
	              	  if(title != null) {
	              		  $.ajax({
	                            url:'insert.ca',
	                            type:'post',
	                            async: false,
	                            data:{m_no:${mem.m_no}, title:title, start:info.dateStr, end:info.dateStr},
	                            success:function(data){
	                          	  if(data == "success") {
	                          		  console.log("성공");
	                          		//getCalList();
	                          		location.reload();
	                          	  } else {
	                          		  alert("일정 추가에 실패했습니당");
	                          	  }  
	                            },
	                            error:function(){
	                                console.log("ajax 통신 실패");
	                            }
	                  	  });  
	              	  }
	              });
        	}

	        
	    });
        
    </script>
</body>
</html>