<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../../include/bsidebar.jsp" %>
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
                <!-- Row -->
                <div class="row">
                
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../../../include/blecturemenu.jsp" %>
                	
                    <!-- column -->
                    <div class="col-9">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙제</h4>
                                <c:if test="${mem.typee eq 't' }">
                                <button class="btn btn-success" onclick="add()">숙제 추가</button><br>
                                </c:if>
                                <div id="homeworkArea">
									<div id="homeworkContent">
		                                <div class="table-responsive">
		                                    <table class="table">
		                                        <thead>
		                                            <tr>
		                                                <th>#</th>
		                                                <th>문제</th>
		                                                <th>제출일</th>
		                                                <th>정답확인(선생님이 마감 버튼 누르면 나타나게)</th>
		                                                <c:if test="${mem.typee eq 't' }">
		                                                <th>삭제</th>
														</c:if>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
		                                        	<c:forEach var="hw" items="${list }">
		                                        		<tr>
			                                        		<td>${hw.hw_no }</td>
			                                                <td><a href="getHomework.lec?hw_no=${hw.hw_no }">${hw.title }</a></td>
			                                                <td>${hw.enddate }</td>
			                                                <td><button class="btn btn-success" onclick="answer(${hw.hw_no })">정답확인</button></td>
															<c:if test="${mem.typee eq 't' }">
															<td><button class="btn btn-success" onclick="del(${hw.hw_no })">삭제</button></td>
															</c:if>
														</tr>
													</c:forEach>
		                                        </tbody>
		                                    </table>
		                                </div>
		                    		</div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
<button onclick="add()">숙제 추가</button>
<div id="homeworkArea">
	<div id="homeworkContent">
<c:forEach var="hw" items="${list }">
	<a href="getHomework.lec?hw_no=${hw.hw_no }">${hw }</a>
	<%-- <button onclick="solve(${hw.hw_no })">문제풀기</button> --%>
	<button onclick="answer(${hw.hw_no })">정답확인</button>
	<button onclick="del(${hw.hw_no })">삭제</button><br>
</c:forEach>
	</div>
</div>
<script>
	function add(){
		var url="homework.te";
        window.open(url,"","width=400,height=400,left=600");
	}
	function answer(hw_no){
		location.href="checkAnswer.hw?hw_no="+hw_no
	}
	function del(hw_no){
		$.ajax({
			url:'delHomework.lec',
			type:'post',
			data:{
				hw_no:hw_no,
			},
			success:function(data){
				$('#homeworkArea').load('homeworklist.lec #homeworkContent')
			},
		})
	}
</script>
</body>
</html>