<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<nav class="navbar top-navbar navbar-expand-md navbar-light">
	    <!-- ============================================================== -->
	    <!-- Logo -->
	    <!-- ============================================================== -->
	    <div class="navbar-header">
	        <a class="navbar-brand" href="/${cp}">
	            <!-- Logo icon -->
	            <b>
	                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
	                <!-- Dark Logo icon -->
	                <img src="/${cp }/resources/material-pro/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
	                <!-- Light Logo icon -->
	                <img src="/${cp }/resources/material-pro/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
	            </b>
	            <!--End Logo icon -->
	            <!-- Logo text -->
	            <span class="light-logo" style="font-weight:bold;color:white;">
	             <!-- dark Logo text -->
	             <%-- <img src="/${cp }/resources/material-pro/assets/images/logo-text.png" alt="homepage" class="dark-logo" /> --%>
	             <!-- Light Logo text -->    
	             <%-- <img src="/${cp }/resources/material-pro/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /> --%>
	             KH수학교육원</span> </a>
	             <!-- <span class="dark-logo" style="font-weight:bold;color:white;font-size:1em;">KH정보교육원</span> -->
	    </div>
	    <!-- ============================================================== -->
	    <!-- End Logo -->
	    <!-- ============================================================== -->
	    <div class="navbar-collapse">
	        <!-- ============================================================== -->
	        <!-- toggle and nav items -->
	        <!-- ============================================================== -->
	        <ul class="navbar-nav mr-auto mt-md-0">
	            <!-- This is  -->
	            <li class="nav-item">
	            	<a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a>
	            </li>
	            <!-- ============================================================== -->
	            <!-- Search -->
	            <!-- ============================================================== -->
	            <!-- <li class="nav-item hidden-sm-down search-box">
	                <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
	                <form class="app-search">
	                    <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
	            </li> -->
			<!-- ============================================================== -->
			<!-- Messages -->
			<!-- ============================================================== -->
			<!-- <li class="nav-item dropdown">
	            	<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            		<i class="mdi mdi-account" style="color:white;"></i>:1명
	            	</a>
	            </li> -->
			<li class="nav-item mega-dropdown"><a
				class="nav-link text-muted" aria-haspopup="true"
				aria-expanded="false"> <i class="mdi mdi-account"
					style="color: white;"></i> <span id="user_count"
					style="color: white;">: 1명</span>
			</a></li>
			<!-- ============================================================== -->
			<!-- End Messages -->
			<!-- ============================================================== -->
		</ul>
		<!-- ============================================================== -->
		<!-- User profile and search -->
		<!-- ============================================================== -->
		<ul class="navbar-nav my-lg-0">
			<!-- ============================================================== -->
			<!-- Comment -->
			<!-- ============================================================== -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark"
				href="" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="mdi mdi-message"></i>
					<div class="notify">
						<!-- <span class="heartbit"></span> <span class="point"></span> -->
					</div>
			</a>

				<div class="dropdown-menu dropdown-menu-right mailbox scale-up">
					<ul>
						<li>
							<div class="drop-title">Notifications</div>
						</li>
						<li>
							<div class="message-center">
								<!-- Message -->
								<a href="#">
									<div class="btn btn-danger btn-circle">
										<i class="fa fa-link"></i>
									</div>
									<div class="mail-contnet">
										<h5>Luanch Admin</h5>
										<span class="mail-desc">Just see the my new admin!</span> <span
											class="time">9:30 AM</span>
									</div>
								</a>
								<!-- Message -->
								<a href="#">
									<div class="btn btn-success btn-circle">
										<i class="ti-calendar"></i>
									</div>
									<div class="mail-contnet">
										<h5>Event today</h5>
										<span class="mail-desc">Just a reminder that you have
											event</span> <span class="time">9:10 AM</span>
									</div>
								</a>
								<!-- Message -->
								<a href="#">
									<div class="btn btn-info btn-circle">
										<i class="ti-settings"></i>
									</div>
									<div class="mail-contnet">
										<h5>Settings</h5>
										<span class="mail-desc">You can customize this template
											as you want</span> <span class="time">9:08 AM</span>
									</div>
								</a>
								<!-- Message -->
								<a href="#">
									<div class="btn btn-primary btn-circle">
										<i class="ti-user"></i>
									</div>
									<div class="mail-contnet">
										<h5>Pavan kumar</h5>
										<span class="mail-desc">Just see the my admin!</span> <span
											class="time">9:02 AM</span>
									</div>
								</a>
							</div>
						</li>
						<li><a class="nav-link text-center"
							href="javascript:void(0);"> <strong>Check all
									notifications</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul>
				</div></li>
			<!-- ============================================================== -->
			<!-- End Comment -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Messages -->
			<!-- ============================================================== -->
			<c:if test="${ !empty mem}">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
				href="" id="2" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="mdi mdi-email"></i>
					<div class="notify">
						<span id="heart" class=""></span> <span id="point" class=""></span>
					</div>
			</a>
				<div class="dropdown-menu mailbox dropdown-menu-right scale-up"
					aria-labelledby="2">
					<ul>
							 <li>
	                            <div class="drop-title"><div align="right"><a id="ad"  href="sendMsgFrom.do" style="font-size:13px" >쪽지보내기</a></div></div>
	                        </li> 
						<li>
							<div class="message-center"></div>
						</li>
						<li><a class="nav-link text-center"
							href="javascript:void(0);"  id="see"><strong>쪽지함으로</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul>
				</div></li>
			</c:if>
			<!-- ============================================================== -->
			<!-- End Messages -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Profile -->
			<!-- ============================================================== -->

			<li class="nav-item dropdown"><c:if test="${empty mem }">
					<a
						class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
						href="login.me" />login</a>
				</c:if> <c:if test="${!empty mem }">
					<a
						class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
						href="" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><img
						src="/${cp }/resources/material-pro/assets/images/users/1.jpg"
						alt="user" class="profile-pic" /></a>
					<div class="dropdown-menu dropdown-menu-right scale-up">
						<ul class="dropdown-user">
							<li>
								<div class="dw-user-box">
									<div class="u-img">
										<img
											src="/${cp }/resources/material-pro/assets/images/users/1.jpg"
											alt="user">
									</div>
									<div class="u-text">
										<h4>${mem.name }</h4>
										<p class="text-muted">${mem.email}<!-- <a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f98f988b8c97b99e94989095d79a9694">[email&#160;protected]11</a> -->
										</p>
										<a href="profile.html"
											class="btn btn-rounded btn-danger btn-sm">View Profile</a>
									</div>
								</div>
							</li>
							<li role="separator" class="divider"></li>
							<li><a href="myInfo.me"><i class="ti-user"></i> My
									Profile</a></li>
							<li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
							<li><a href="#"><i class="ti-email"></i> Inbox</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#"><i class="ti-settings"></i> Account
									Setting</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.me"><i class="fa fa-power-off"></i>
									Logout</a></li>
						</ul>
					</div>
				</c:if></li>
			<!-- ============================================================== -->
			<!-- Language -->
			<!-- ============================================================== -->
			<!-- <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="flag-icon flag-icon-us"></i></a>
	                    <div class="dropdown-menu dropdown-menu-right scale-up"> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-in"></i> India</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-fr"></i> French</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-cn"></i> China</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-de"></i> Dutch</a> </div>
	                </li> -->
		</ul>
	</div>
</nav>

<script>

	var m_no = '${mem.m_no}'
		
		var wsa = new WebSocket(
		"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/arp/Echo");

			wsa.onopen = function() {
				console.log('헤더 커넥션 open');
			
				wsa.onmessage = function(event) {
					console.log("이벤트데이타" + event.data);
			
					if (m_no == event.data) {
					
			
						$("#heart").attr("class", "heartbit");
						$("#point").attr("class", "point");
			
						
						alert("새로운 메시지가 있습니다");
						list(); // 새로운 메시지가오면 리스트 새로
					}
				}
			
			};
			
			wsa.onclose = function(event) {
				console.log('close');
			
			};
			
			wsa.onerror = function(event) {
				console.log('error');
			};

		


		


	
	

	$("#see").on("click", function() {
		
		window.location.href="listMsg.do"



		$.ajax({ // 알람을 확인했을때 N으로 변경
			url : "updateAlram.do",
			data:{m_no:m_no},
			success:function(data){
				if(data=="success"){
					$("#heart").attr("class", "");
					$("#point").attr("class", "");
					$(".message-center").append(" <div class='drop-title' align='center'><label>새로운메시지가 없습니다.</label></div>")
				}else{
					console.log("알람상태변경실패");
				}
				
				
			}

		});
		
		$(".message-center").children().remove();

	})

	function list() {
		console.log("리스트실행되여");
		$.ajax({
					url : "selectNList.do",
					data : {
						m_no : m_no
					},

					dataType : "json",
					success : function(data) {
							$(".message-center").children().remove();
			
						if (data.length > 0) {

							$.each(data,function(index, value) {
	
									$a = $("<a class='border-bottom d-block text-decoration-none py-2 px-3'></a>").attr("href",'detailMsg.do?ms_no='+value.ms_no);
									$img = $("<div class='user-img position-relative d-inline-block mr-2 mb-3'><img src='/${cp }/resources/image/mailicon1.png' alt='user' class='img-circle'></div>")
									$con = $(
											"<div class='mail-contnet d-inline-block align-middle'>")
											.text(value.title);
									$h5 = $(
											"<h5 class='name1'></h5>")
											.text(value.s_no);
									$desc = $("<span class='mail-desc font-12 text-truncate overflow-hidden text-nowrap d-block'></span> ")
									$time = $("<span class='time font-12 mt-1 text-truncate overflow-hidden text-nowrap d-block'></span> </div></a>").text(value.s_date);
	
									$con.append($h5);
									$con.append($desc);
									$con.append($time);
	
									$a.append($img)
									$a.append($con);
	
									$(".message-center").append($a);
									console.log("alram"+value.alram)
									if(value.alram == 'N'){
										$("#heart").attr("class", "heartbit");
										$("#point").attr("class", "point");
									}
	
								});

					}else{
						$(".message-center").append("<div class='drop-title' align='center'><label>새로운메시지가 없습니다.</label></div>")
					}
						
				}
			})
			
}
	
if( ${mem ne null}){

	list(); // 들어오자마자 list 새로 불러오기
}

</script>



