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

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
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
                        <h3 class="text-themecolor mb-0 mt-0">Student in Lecture</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="memberList.ad">Member List</a></li>
                            <li class="breadcrumb-item active">Student in Lecture</li>
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
                    <div class="col-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">선생님과 강좌 선택</h4>
                                <h6 class="card-subtitle">선생님을 선택하시면 해당 선생님의 수업목록이 나옵니다.</h6>
                                <div class="row">
                                    <div class="col-lg-6 col-xlg-6">
                                    	<h5 class="p-2 rounded-title">Teacher</h5>
										<select id="teacher" class="form-control" size="10">
											<c:forEach var="t" items="${tlist }">
												<option value="${t.m_no }">${t.name }#${t.m_no }</option>
											</c:forEach>
										</select>
                                    </div>
                                    <div class="col-lg-6 col-xlg-6">
                                        <h5 class="p-2 rounded-title">Lecture</h5>
										<select id="lecture" class="form-control" size="10">
											<option>Not Exist</option>
										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">선택한 수업의 학생현황</h4>
                                <h6 class="card-subtitle">학생을 선택하고 좌우로 옮겨보세요.</h6>
                                <div class="row">
                                    <div class="col-lg-5 col-xlg-5">
                                        <h5 class="p-2 rounded-title">비수강 학생</h5>
                                        <select id="other" class="form-control" size="10" multiple>
											<option>Not Exist</option>
										</select>
                                    </div>
                                    <div class="col-lg-2 col-xlg-2" style="text-align:center;margin-top:auto;margin-bottom:auto;">
										<button onclick="removeStudent()"><i class="fas fa-angle-double-left"></i></button>
                                        <button onclick="insertStudent()"><i class="fas fa-angle-double-right"></i></button>
                                    </div>
                                    <div class="col-lg-5 col-xlg-5">
                                        <h5 class="p-2 rounded-title" id="ingCount">수강 학생</h5>
                                        <select id="ings" multiple class="form-control" size="10">
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
	
	<script>
        $(function () {
            // Switchery
            /* var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            $('.js-switch').each(function () {
                new Switchery($(this)[0], $(this).data());
            }); */
            // For select 2
            $(".select2").select2();
            $('.selectpicker').selectpicker();
            //Bootstrap-TouchSpin
            $(".vertical-spin").TouchSpin({
                verticalbuttons: true
            });
            var vspinTrue = $(".vertical-spin").TouchSpin({
                verticalbuttons: true
            });
            if (vspinTrue) {
                $('.vertical-spin').prev('.bootstrap-touchspin-prefix').remove();
            }
            $("input[name='tch1']").TouchSpin({
                min: 0,
                max: 100,
                step: 0.1,
                decimals: 2,
                boostat: 5,
                maxboostedstep: 10,
                postfix: '%'
            });
            $("input[name='tch2']").TouchSpin({
                min: -1000000000,
                max: 1000000000,
                stepinterval: 50,
                maxboostedstep: 10000000,
                prefix: '$'
            });
            $("input[name='tch3']").TouchSpin();
            $("input[name='tch3_22']").TouchSpin({
                initval: 40
            });
            $("input[name='tch5']").TouchSpin({
                prefix: "pre",
                postfix: "post"
            });
            // For multiselect
            $('#pre-selected-options').multiSelect();
            $('#optgroup').multiSelect({
                selectableOptgroup: true
            });
            $('#public-methods').multiSelect();
            $('#select-all').click(function () {
                $('#public-methods').multiSelect('select_all');
                return false;
            });
            $('#deselect-all').click(function () {
                $('#public-methods').multiSelect('deselect_all');
                return false;
            });
            $('#refresh').on('click', function () {
                $('#public-methods').multiSelect('refresh');
                return false;
            });
            $('#add-option').on('click', function () {
                $('#public-methods').multiSelect('addOption', {
                    value: 42,
                    text: 'test 42',
                    index: 0
                });
                return false;
            });
            $(".ajax").select2({
                ajax: {
                    url: "https://api.github.com/search/repositories",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        // parse the results into the format expected by Select2
                        // since we are using custom formatting functions we do not need to
                        // alter the remote JSON data, except to indicate that infinite
                        // scrolling can be used
                        params.page = params.page || 1;
                        return {
                            results: data.items,
                            pagination: {
                                more: (params.page * 30) < data.total_count
                            }
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                }, // let our custom formatter work
                minimumInputLength: 1,
                //templateResult: formatRepo, // omitted for brevity, see the source of this page
                //templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
            });
        });
        $('#public-methods').multiSelect('refresh');
    </script>
	
	
	
	
	
	
	
	
	
	
<%-- 	<jsp:include page="../../include/header.jsp"/>
	
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

	</select> --%>
	
	
	
	<script>
		var total=0;//총원
		var now=0;//현재인원
		
		$('#teacher').on('click change',function(){
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
							$('#lecture').append('<option value="'+data[i].lec_no+'">'+data[i].title+'#'+data[i].lec_no+'</option>')
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
					//alert("total="+total)
				}
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
					var flag=false;
					now=data.length
					$('#ings').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#ings').append('<option value="'+data[i].m_no+'">'+data[i].name+'#'+data[i].m_no+'</option>')
						}
					}else{
						$('#ings').html('<option>Not Exist</option>')
						now=0
						flag=true
					}
					if(i==data.length || flag){
						$('#ingCount').text('수강 학생('+now+'/'+total+')')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			getInfo($('#lecture').val())
			ingList($('#lecture').val())
			otherList($('#lecture').val())
		})
		$('#lecture').on('change',function(){
			getInfo($('#lecture').val())
			ingList($('#lecture').val())
			otherList($('#lecture').val())
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
					$('#other').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#other').append('<option value="'+data[i].m_no+'">'+data[i].name+'#'+data[i].m_no+'</option>')
						}
					}else{
						$('#other').html('<option>Not Exist</option>')
					}
				},
			})
		}
		
		
		function insertStudent(){
			var other=$('#other').val()
			for(i=0;i<other.length;i++){
				if(now>=total){
					alert("정원초과")
					break;
				}else if(now<total){
					$.ajax({
						url:'insertStudentToIng.lec',
						async:'true',
						type:'post',
						data:{
							m_no:parseInt(other[i]),
							lec_no:parseInt($('#lecture').val()),
						},
						success:function(data){
							now=now+1
							ingList($('#lecture').val())
							otherList($('#lecture').val())
							ws_mylec.send("mylec최신화");
						},
					})
				}
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
						ingList($('#lecture').val())
						otherList($('#lecture').val())
						ws_mylec.send("mylec최신화");
					},
				})
			}
		}
	</script>
	
	<%-- <jsp:include page="../../include/footer.jsp"/> --%>
</body>
</html>