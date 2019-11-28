<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
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
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">학생을 강좌로 넣엉주기</h4>
                                <h6 class="card-subtitle">인원제한시켜야 하는데</h6>
                                <div class="row">
                                    <div class="col-lg-2 col-xlg-2 mb-4">
                                    	<h5 class="p-2 rounded-title">Teacher</h5>
                                        <select id="teacher" name="t" size="10" style="width:100%;">
											<c:forEach var="t" items="${tlist }">
												<option value="${t.m_no }">${t.name }(${t.m_no })</option>
											</c:forEach>
										</select>
                                    </div>
                                    <div class="col-lg-2 col-xlg-2">
                                        <h5 class="p-2 rounded-title">Lecture</h5>
                                        <select id="lecture" name="lec" size="10" style="width:100%;">
											<option>Not Exist</option>
										</select>
                                    </div>
                                    <div class="col-lg-2 col-xlg-2">
                                        <h5 class="p-2 rounded-title" id="ingCount">수강중인 학생</h5>
                                        <select id="ings" name="s" size="10" style="width:100%;" multiple>
											<option>Not Exist</option>
										</select>
                                    </div>
                                    <div class="col-lg-1 col-xlg-1" style="text-align:center;margin-top:auto;margin-bottom:auto;">
                                        <button onclick="insertStudent()"><<</button>
										<button onclick="removeStudent()">>></button>
                                    </div>
                                    <div class="col-lg-2 col-xlg-2">
                                        <h5 class="p-2 rounded-title">다른 학생</h5>
                                        <select id="other" name="s" size="10" style="width:100%;" multiple>
											<option>Not Exist</option>
										</select>
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
            <%@ include file="../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../../include/header.jsp"/>
	
	<h1>학생을 강의에 꽂아주기</h1>
	
	선생
	<select id="teacher" name="t" size="10" style="width:100px;">
		<c:forEach var="t" items="${tlist }">
			<option value="${t.m_no }">${t.name }</option>
		</c:forEach>
	</select>
	
	강의
	<select id="lecture" name="lec" size="10" style="width:100px;">
	
	</select>
	
	수강중인학생
	<select id="ings" name="s" size="10" style="width:100px;" multiple>

	</select>
	
	<button onclick="insertStudent()"><<</button>
	<button onclick="removeStudent()">>></button>
	
	다른학생
	<select id="other" name="s" size="10" style="width:100px;" multiple>

	</select>
	
	
	
	<script>
		var total=0;//총원
		var now=0;//현재인원
		
		$('#teacher').on('click',function(){
			$.ajax({
				url:'tlist.lec',
				type:'post',
				data:{
					m_no:$(this).val(),
				},
				dataType:'json',
				success:function(data){
					$('#lecture').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#lecture').append('<option value="'+data[i].lec_no+'">'+data[i].title+'('+data[i].lec_no+')'+'</option>')
						}
					}else{
						$('#lecture').html('<option>Not Exist</option>')
					}
				},
			})
		})
		
		function getInfo(lec_no){//getLectureInfo
			$.ajax({
				url:'getInfo.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					total=data.headcount
				},
			})
		}
		function ingList(lec_no){
			$.ajax({
				url:'inglist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					now=data.length
					$('#ings').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#ings').append('<option value="'+data[i].m_no+'">'+data[i].name+'('+data[i].m_no+')'+'</option>')
						}
					}else{
						$('#ings').html('<option>Not Exist</option>')
						now=0
					}
					$('#ingCount').text('수강중인 학생('+now+'/'+total+')')
				},
			})
		}
		$('#lecture').on('click',function(){
			ingList($('#lecture').val())
			getInfo($('#lecture').val())
			
		})
		
		function otherList(lec_no){
			$.ajax({
				url:'otherlist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					console.log(data)
					$('#other').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#other').append('<option value="'+data[i].m_no+'">'+data[i].name+'('+data[i].m_no+')'+'</option>')
						}
					}else{
						$('#other').html('<option>Not Exist</option>')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			otherList($('#lecture').val())
		})
		
		function insertStudent(){
			var other=$('#other').val()
			var flag=false;
			for(i=0;i<other.length;i++){
				if(now>=total){
					alert("정원초과")
					break;
				}
				$.ajax({
					url:'insertStudentToIng.lec',
					type:'post',
					data:{
						m_no:parseInt(other[i]),
						lec_no:parseInt($('#lecture').val()),
					},
					success:function(data){
						console.log("<<성공")
						if(now<total){
							ingList($('#lecture').val())
							otherList($('#lecture').val())
						}
					},
				})
			}
		}
		function removeStudent(){
			var ings=$('#ings').val()
			for(i=0;i<ings.length;i++){
				$.ajax({
					url:'insertStudentToOther.lec',
					type:'post',
					data:{
						m_no:parseInt(ings[i]),
						lec_no:parseInt($('#lecture').val()),
					},
					success:function(data){
						console.log(">>성공")
						ingList($('#lecture').val())
						otherList($('#lecture').val())
					},
				})
			}
		}
	</script>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>