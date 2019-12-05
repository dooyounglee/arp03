<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="include/bhead.jsp"%>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<style>
 .main_wrap{
 	background-image:url('resources/mainImage/top_bg.jpg');
 	background-color:#d7cebd;
 	height:644px;
 	position:absolute;
	z-index:2;
	width:100%;
	text-align:center;
 }
#div_cont{
	width:100%;
	clear:both;
	position:relative;
	overflow:hidden;
}
.txt{
	position:absolute;
	z-index:2;
	width:100%;
	text-align:center;
}





/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}


#wrapper{
    width:100%;
    margin:50px auto;
    height:500px;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;
    margin-top:0;
}

#slider-wrap{
    width:100%;
    height:500px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%;
    height:500px;
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:1250px;
   	height:500px;  
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
 	height: 100%;
}


/*btns*/
.btns{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
    
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
    min-width:20px;
    margin-top:450px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
    top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
   opacity:1;
   box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}

</style>

		
</head>

<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->
        
        <!-- Page wrapper  -->
        <div class="page-wrapper">
        
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor">Home</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">Home</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center" style="padding-left:30%;">
                        <jsp:include page="question/qRealTimeFree.jsp"></jsp:include>
                        <!-- <div class="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                <div class="chart-text m-r-10">
                                    <h6 class="m-b-0"><small>THIS MONTH</small></h6>
                                    <h4 class="m-t-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                <div class="chart-text m-r-10">
                                    <h6 class="m-b-0"><small>LAST MONTH</small></h6>
                                    <h4 class="m-t-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i
                                        class="ti-settings text-white"></i></button>
                            </div>
                        </div> -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                
                
                <!-- sira -->


				<div class="row-14">
					<div id="container" style="padding-bottom: 0px !important;">
						<div id="wrapper">
							<div id="slider-wrap">
								<ul id="slider">
									<li data-color="#1abc9c"><img
										style="width: 1250px; height: 500px;"
										src="resources/mainImage/mainp.png"></li>

									<li data-color="#3498db"><img
										style="width: 1250px; height: 500px;"
										src="resources/mainImage/배너4.png"></li>

									<li data-color="#9b59b6"><img
										style="width: 1250px; height: 500px;"
										src="resources/mainImage/배너3.png">
									</li>

									<li data-color="#34495e"><img
										style="width: 1250px; height: 500px;"
										src="resources/mainImage/배너5.png">
									</li>

									<li data-color="#e74c3c"><img
										style="width: 1250px; height: 500px;"
										src="resources/mainImage/배너6.png">
									</li>

								</ul>

								<!--controls-->
								<div class="btns" id="next">
									<i class="fa fa-arrow-right"></i>
								</div>
								<div class="btns" id="previous">
									<i class="fa fa-arrow-left"></i>
								</div>
								<div id="counter"></div>

								<div id="pagination-wrap">
									<ul>
									</ul>
								</div>
								<!--controls-->
							</div>
						</div>
						
						
	<script>
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();


	$(document).ready(function(){
	    
	    
	    /*****************
	     BUILD THE SLIDER
	    *****************/
	    //set width to be 'x' times the number of slides
	    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	    
	    //next slide    
	    $('#next').click(function(){
	        slideRight();
	    });
	    
	    //previous slide
	    $('#previous').click(function(){
	        slideLeft();
	    });
	    
	    
	    
	    /*************************
	     //*> OPTIONAL SETTINGS
	    ************************/
	    //automatic slider
	    var autoSlider = setInterval(slideRight, 3000);
	    
	    //for each slide 
	    $.each($('#slider-wrap ul li'), function() { 

	       //create a pagination
	       var li = document.createElement('li');
	       $('#pagination-wrap ul').append(li);    
	    });
	    
	    //counter
	    countSlides();
	    
	    //pagination
	    pagination();
	    
	    //hide/show controls/btns when hover
	    //pause automatic slide when hover
	    $('#slider-wrap').hover(
	      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
	    );
	    
	    

	});//DOCUMENT READY
	    


	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	    pos--;
	    if(pos==-1){ pos = totalSlides-1; }
	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
	    
	    //*> optional
	    countSlides();
	    pagination();
	}


	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	    pos++;
	    if(pos==totalSlides){ pos = 0; }
	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	    
	    //*> optional 
	    countSlides();
	    pagination();
	}



	    
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	    $('#counter').html(pos+1 + ' / ' + totalSlides);
	}

	function pagination(){
	    $('#pagination-wrap ul li').removeClass('active');
	    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	</script>

						<!-- //visual -->
						<!-- list -->


						<div class="con_wrap">
							<dvi class="img_wrap mt90">
							<img src="resources/mainImage/4.png" alt=""></dvi>
							<div class="list_wrap mt50">
								<ul class="con_list">
								</ul>
							</div>
						</div>
						<!-- //list -->
					</div>
				</div>

				<!-- Row -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                            	<h3 class="card-title" style="font-weight:bold"><img style="width:27px; height:27px;" src="resources/mainImage/공지사항.png">&nbsp;공지사항
                                <a class="btn btn-success float-right" href="nlist.ad">더보기</a>
                                </h3>
                                <table class="table table-hover">
                                	<thead>
                                		<tr>
		                                	<th></th>
	                                	</tr>
                                	</thead>
                                	<tbody>
                                		<c:forEach var="n" begin="0" end="4" items="${nlist }">
                                			<tr>
			                                	<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a>&nbsp;<img style="width:13px; height:13px;" src="resources/mainImage/6.png"></td>
		                                	</tr>
                                		</c:forEach>
                                	</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                             <c:if test="${empty mem}">
                             <h3 class="card-title" style="font-weight:bold">자유게시판
                             	<a class="btn btn-success float-right" href="blist.do">더보기</a>
                             <h6 style="color:gray">로그인시 이용이 가능합니다.</h6>
                             </h3>
                             <table class="table table-hover">
                             <tr>
                               	<th style="font-weight:600; color:white; background:#FFCD12">Title</th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="background:#FFCD12"></th>
                               	<th style="font-weight:600; color:white; background:#FFCD12">writer</th>
		                      </tr>
		                      </table>
                                <div>
                                	<img src="resources/mainImage/5.png" style="width:100%;">
                                </div>
                               	</c:if>
                               	<c:if test="${!empty mem}">
                                <h3 class="card-title" style="font-weight:bold">자유게시판
                                	<a class="btn btn-success float-right" href="blist.do">더보기</a>
                                </h3>
                               		<table class="table table-hover">
	                                	<thead>
	                                		<tr>
			                                	<th style="font-weight:600; color:white; background:#FFCD12">Title</th>
			                                	<th style="font-weight:600; color:white; background:#FFCD12">writer</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody>
	                                		<c:forEach var="b" begin="0" end="4" items="${blist }">
	                                			<tr>
				                                	<td><a href="bdetail.do?b_no=${ b.b_no }">${ b.title } <b>[${ b.rcount }]</b>&nbsp;<img style="width:13px; height:13px;" src="resources/mainImage/6.png"></a></td>
				                                	<td>익명</td>
			                                	</tr>
	                                		</c:forEach>
	                                	</tbody>
	                                </table>
                               	</c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->

            </div>
            <!-- End Container fluid  -->
            
            <!-- footer -->
            <footer class="footer">
                <%@ include file="include/bfooter.jsp" %>
            </footer>
            <!-- End footer -->
        
        </div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->


	<%@ include file="include/bjs.jsp" %>
	






<%-- 	<jsp:include page="include/header.jsp"></jsp:include>
index

	<script>
        function nwindow(){
            var url="test";
            window.open(url,"","width=400,height=400,left=600");
        }
        function dwindow(){
            var url="insert.de";
            window.open(url,"","width=400,height=400,left=600");
        }
    </script>
    <input type="button" value="자식을 불러라"  onclick="nwindow()"/>
    <input type="text" value="뭘주려나..." name="get" id="get"/><br>
    
    <input type="button" value="신고"  onclick="dwindow()"/>
    
    
	<jsp:include page="include/footer.jsp"></jsp:include> --%>
</body>
</html>