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
<%@ include file="../include/bhead.jsp"%>
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
</style>    
</head>
<body>
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	
	<div class="page-wrapper">
		<div class="row page-titles">
		</div>
	<div align="center" class="card">
	<h1 class="card-title">Calendar</h1>
	</div>
	<br>
	
	<div id="external-events">
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
  </div>
    <div id='calendar'></div><br>
    <input align="center" type="button" id="btnAddTest" value="일정추가">
    </div>
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var Calendar = FullCalendar.Calendar;
	        var Draggable = FullCalendarInteraction.Draggable;
	     
	        var containerEl = document.getElementById('external-events');
	        var calendarEl = document.getElementById('calendar');
	        var checkbox = document.getElementById('drop-remove');
	     
	        // initialize the external events
	        // -----------------------------------------------------------------
	     
	        new Draggable(containerEl, {
	          itemSelector: '.fc-event',
	          eventData: function(eventEl) {
	            return {
	              title: eventEl.innerText
	            };
	          }
	        });

	        // initialize the calendar
	        // -----------------------------------------------------------------
	     	
	        
	        $(function(){
	        	getCalList();
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
		   				 	
		   				 	var endy = value.end.substr(0,4);
		   				 	var endm = value.end.substr(5,2);
		   				 	var endd = value.end.substr(8,2);
		   				 	
		   				 	var newEnd = new Date(endy, endm, endd);
 				
		   				 	//console.log("date형:" + newEnd);
		   				 	//console.log("date형일자:" + endd);
		   				 	//console.log("date형일자+1:" + endd+1);
		   			 	
		   				 	if(value.start != value.end) {
		   				 		var endf = Number(endd) + 1;
		   				 		newEnd = new Date(endy, endm, endf);
		   					}
		   					//console.log("date형:" + newEnd.getFullYear().toString());
		   					
		   					console.log("end Month : " + endm);
		   				 	console.log("end date : " + newEnd);
		   					
		   					var y = newEnd.getFullYear().toString();
		   					var m = newEnd.getMonth().toString();
		   					var d = newEnd.getDate().toString();
		   					
		   					var ymd = (y + "-" + m + "-" + d);
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
        		console.log($count);
        		
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
	        	        	    
			   				    var a = (yyyy + "-" + mm + "-" + d);
			   				    console.log(a);
	        	        	    
	        	        	    var newEnd = (info.event.end.toISOString()).substring(0, 10);
	        	        	    //console.log("newStart" + newStart);
	        	        	    console.log("newEnd" + newEnd);
	        	        	    $.ajax({
	        	        	    	url:'update.ca',
	 	                            type:'post',
	 	                            async: false,
	 	                            data:{c_no:info.event.id, m_no:${mem.m_no}, title:info.event.title, start:a, end:newEnd},
	 	                            success:function(data){
	 	                          	   if(data == "success") {
	 	                          		console.log("성공");
	 	                          		getCalList();
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
	       
	        	         
	              });
	            
	   			calendar.render();
	   			
	             // calendarId = new FullCalendar.Calendar(calendarEl, calProps);
	   			calendar.on('dateClick', function(info) {
	              	var title = prompt("일정 추가");
	              	  console.log(info);
	              	  
	              	  if(title != null) {
	              		  $.ajax({
	                            url:'insert.ca',
	                            type:'post',
	                            async: false,
	                            data:{m_no:${mem.m_no}, title:title, start:info.dateStr, end:info.dateStr},
	                            success:function(data){
	                          	  if(data == "success") {
	                          		  console.log("성공");
	                          		getCalList();
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