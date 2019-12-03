<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
</head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<body class="fix-header card-no-border logo-center">
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var = "d"/>
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
                        <h3 class="text-themecolor mb-0 mt-0">Forms</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Form</li>
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
                	
                    <div class="col-lg-9 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">만족도 평가</h4>
                                <div class="table-responsive">
                                	<form action="insertsurvey.ma" id="frm">
                                    <table class="table table-hover no-wrap">
                                    	<thead>
                                    		<tr>
                                    		<th><input class="form-control" type="text" name="title" placeholder="제목" required></th>
                                    			<th><p>과목명 : ${lec.title}</p></th>
                                    			
												<th><p >선생님 : ${mem.name }</p></th>
												
												<th><p >작성 날짜 : ${d }</p></th>
													
												
												<th><input type="hidden" name="lec_no" value="${lec.lec_no }">
													<input type="hidden" name="m_no" value="${mem.m_no }">
													<input type="hidden" name="enrolldate" value="${d }">
												</th>	
                                    		</tr>
                                    	</thead>
                                        <tbody id="tbody">
                                     
                                        	<tr>
                                        		<td colspan="4">
                                        		
                                        			<div id="div">
                                        			
                                        			</div>
                                        		</td>
                                        	</tr>
                                        	<tr>
                                        		<td>
                                        			<button class =" btn btn-success" id="insertquestion" type="button">질문추가</button>
													<button class = "btn btn-success" id="submitquestion" type="submit">등록</button>
													<button class =" btn btn-inverse" id="deletequestion" type="button">질문삭제</button>
													<button class = "btn btn-inverse"type="reset">질문 다시만들기</button>
												</td>
											</tr>
                                        </tbody>
                                    </table>
                                    </form>
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
	
 

<script>
	$(document).ready(function(){
		var lastq=0;
		var removesuccess=0;
		var q=1;
		$("#insertquestion").click(function(){
			var table = $("<table></table>").attr("id", "table");
			var tr = $("<tr></tr>").attr("class", "tr");
			var td = $("<td></td>").attr("class", "td");
			var div =$("<div></div>").attr("id", "div"+lastq);
			var input = $("<input><br><br>").attr("placeholder", "질문"+q).attr("name", "question["+lastq+"]").attr("required", true).attr("id", "question["+lastq+"]").attr("class","form-control");
			/* var hid = $("<input>").attr("type", "hidden").attr("name", "sq_no["+lastq+"]").attr("value", q);
			$("#div").append(hid); */
			$("#div").append(div);
			$("#div"+lastq).append(input);
			/* .append(table).append(tr).append(td) */
			removesuccess=lastq;
			lastq+=1;
		
			q+=1;	
		});
		$("#deletequestion").click(function(){
			if(lastq>0){
		/* 	var emp = confirm("확인을 누르시면 질문이 모두 사라집니다.");
			if(emp==true){
			
			$("#div").empty(); 
		}*/
			
			$("#div").children().eq(removesuccess).remove();
			lastq-=1;
			removesuccess-=1;
			q-=1;
			}
		});	
	/* 	$("#submitquestion").click(function(){		
			var qla=$("<input>").attr("type", "hidden").attr("value", lastq).attr("name", "qlast");
			$("#div").append(qla);
			$("#frm").submit();
		}); */
	});


</script>
</body>
</html>