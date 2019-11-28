<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

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
	<!-- End of Left-sidebar -->
<!-- <h1 align="center">학생 휴가 리스트 </h1> -->


<%-- 

<table align="center" border="1" cellspacing="0" width="700"> 
<tr>
	
	<th><input type="checkbox" id="checkbox">체크</th>
	<th>휴가번호</th>
	<th>강의번호</th>
	<th>휴가날짜</th>
	<th>학생명</th>
	<th >강의명</th>
	<th >제목</th>
	<th >선생님</th>
	<th>관리자</th>
	

</tr>

<c:forEach items="${ list }" var="v">
<input type="hidden" name="lec_no" id="lec_no" value="${v.lec_no }">
	<c:if test = "${v.tstatus ne 'N' and v.astatus ne 'Y'}">
		<tr>
			<td><input type="checkbox" id ="vl" class="check" name="vacationList" value="${ v.v_no }"></td>
			<td>${ v.v_no }</td>
			<td>${ v.lec_no }</td>
			<td>${fn:substring(v.vacationdate,0,10) }</td>
			<td>${v.name }</td>
			<td>${ v.title }</td>
			<td><a href="vDetail.me?v_no=${ v.v_no }&lec_no=${v.lec_no}">${ v.vacation_title }</a></td>
			<td>${v.tstatus }</td>
			<td>${v.astatus }</td>
			
			
		</tr>
		</c:if>
</c:forEach>
</table> --%>


	<button type="submit" id ="submit" style="display:none">일괄처리하기</button>
	
	<button type="submit" id ="submit2" style="display:none">처리하기</button>


<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">학생휴가관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">학생휴가관리</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
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
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">학생휴가관리</h4><!-- <a class="btn btn-primary float-right" href="vinsertForm.me">휴가작성하기</a><br> -->
                                <h6 class="card-subtitle">student vacation <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead>
                                      	<tr>
	
											<th><input type="checkbox" id="checkbox">체크</th>
											<th>휴가번호</th>
											<th>강의번호</th>
											<th>휴가날짜</th>
											<th>학생명</th>
											<th >강의명</th>
											<th >제목</th>
											<th >선생님</th>
											<th>관리자</th>
											
										
										</tr>
                                        </thead>
                                        <tbody >
                                        <c:forEach items="${ list }" var="v">
										<input type="hidden" name="lec_no" id="lec_no" value="${v.lec_no }">
											<c:if test = "${v.tstatus ne 'N' and v.astatus ne 'Y'}">
												<tr>
													<td><input type="checkbox" id ="vl" class="check" name="vacationList" value="${ v.v_no }"></td>
													<td>${ v.v_no }</td>
													<td>${ v.lec_no }</td>
													<td>${fn:substring(v.vacationdate,0,10) }</td>
													<td>${v.name }</td>
													<td>${ v.title }</td>
													<td><a href="vDetail.me?v_no=${ v.v_no }&lec_no=${v.lec_no}">${ v.vacation_title }</a></td>
													<td>${v.tstatus }</td>
													<td>${v.astatus }</td>
													
													
												</tr>
												</c:if>
										</c:forEach>
                                        
                                        </tbody>
                                    </table>
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




 <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	        </div>
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->
	<%@ include file="../include/bjs.jsp" %>


<script>
<%--
$( document ).ready( function() {
  $( '.check-all' ).click( function() {
    $( '.ab' ).prop( 'checked', this.checked );
  } );
} );
--%>





$(function(){

	var Multicheck =[];
	// 하나 혹은 다중선택 처리
	
	var lec_no = $("#lec_no").val()
	

	
	$(".check").click(function() {
		$("input[name=vacationList]:checked").each(function() {

			if($(this).prop("checked")){
				$("#submit2").show();
			}else{
				$("#submit2").hide();
			}

			var test = $(this).val();
			
			 alert(test);
			console.log(test); 
			Multicheck.push(test);
			
		});

	});
	
	var objectMulti = {
		"MultiList" : Multicheck,
		"lec_no":lec_no
	}	
	
	$("#submit2").click(function(){
		
		$.ajax({
			
			url:"multiPermission.ad",
			dataType:"json",
			type:"post",
			data:objectMulti,
			success: function(data){
				
				if(data==1){
					alert("수정완료");
					location.href="sVlist.ad";
				}else{
					alert("실패");
				}
			},
			error: function(){
				console.log("에러");
			}
			
			
		});
		
	});
	
	
	
	//-----------------------------------------------------------------------------------
	// 전체 처리
	var checkVno =[];
	
	 $("#checkbox").click(function(){ 
		 if($("#checkbox").prop("checked")){ 
			 $("input[name=vacationList]").prop("checked",true);
			 
		}else{
			$("input[name=vacationList]").prop("checked",false); 
	
		} 	
		 
		 
		 $("input[name=vacationList]:checked").each(function(){
				console.log($(this).val());
				checkVno.push($(this).val());
				
				if($(this).prop("checked")){
					$("#submit").show();
				}
			});
		 
	 });
	 
	 var objParam = {
		 "checkList" : checkVno
	 }
	 
	 
	 $("#submit").on("click" , function(){
		 
		 
	 $.ajax({
		 url : "permission.ad",
		 dataType : "json",
		 type : "post",
		 data : objParam,
		 success: function(data){
			 if(data== 1){
				 
			 alert("수정완료");
			 location.href="sVlist.ad";
			 }else{
				 alert("실패");
			 }
		 },
	 	 error: function(){
	 		 console.log("오류");
	 	 }
	 });
	 
});
});
</script>



</body>
</html>