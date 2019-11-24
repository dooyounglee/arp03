<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
	
	<!-- 수식 -->
	<script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
      });
    </script>
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<body class="fix-header card-no-border logo-center">

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
                <c:set var="aaa" value="make"/>
				<c:set var="p_no" value="0"/>
				<c:set var="col" value="12"/>
				<c:if test="${!empty p }">
					<c:set var="aaa" value="edit"/>
					<c:set var="p_no" value="${p.p_no }"/>
					<c:set var="col" value="8"/>
				</c:if>

                <!-- Row -->
                <div class="row">
                    <div class="col-${col } mt-4">
                        <h4 class="mb-0">Problem</h4>
                        <p class="text-muted mt-0"></p>
                        <div class="card card-body">
                            <form class="form-horizontal mt-4" action="${aaa }.pro" method="post" autocomplete=off>
                            	<input type="hidden" name="p_no" value="${p_no }">
                                <div class="form-group">
                                	<label>Problem</label>
                                    <textarea id="prob" class="form-control" rows="3" name="problem">${p.problem }</textarea>
		                            <iframe id=iframe name="prob" src="preview" height="100px" width="100%"></iframe>
                                </div>
	                            <div class="form-group">
	                            	<label>How To Solve</label>
                                    <textarea id="solve" class="form-control" rows="3" name="solve">${p.solve }</textarea>
		                            <iframe id=iframe name="solve" src="preview" height="100px" width="100%"></iframe>
                                </div>
                                <div class="form-group row">
                                	<div class="col-6">
	                                	<label>Solution</label>
	                                    <textarea id="solution" class="form-control" rows="1" name="solution">${p.solution }</textarea>
	                                    <iframe id=iframe name="solution" src="preview" height="45px" width="100%"></iframe>
		                            </div>
		                            <div class="col-6">
		                            	<label>Variables</label>
                                    	<input type="text" class="form-control col-12" placeholder="ㄱ,ㄴ,ㄷ" name="keyval" value="${p.keyval }">
		                            </div>
                                </div>
                                <button class="btn btn-success">완료</button>
                            </form>
                        </div>
                    </div>
                    <c:if test="${!empty p }">
                    <div class="col-4 mt-4">
                        <h4 class="mb-0">Variables</h4>
                        <p class="text-muted mt-0"></p>
                        <div class="card card-body">
                        	<div class="form-group">

								<c:if test="${empty vlist }">
									<h3 class="mb-0">변수를 추가 하세요.</h3>
								</c:if>
								<button class="btn btn-primary" id="addBtn">추가</button>
								<div id="variablesArea">
									<div id="variablesContent">
										<c:forEach var="v" items="${vlist }">
											<input class="form-control col-8" name="val" value="${v.val }">
											<button class="btn btn-success" onclick="editBtn(this,${v.v_no })">수정</button>
											<button class="btn btn-danger" onclick="delBtn(this,${v.v_no })">삭제</button><br>
										</c:forEach>
									</div>
								</div>
							</div>
                        </div>
                    </div>
					</c:if>
                </div>
                <!-- End of Row -->
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<h1>문제만들기</h1>
	
	<c:set var="aaa" value="make"/>
	<c:set var="p_no" value="0"/>
	<c:if test="${!empty p }">
		<c:set var="aaa" value="edit"/>
		<c:set var="p_no" value="${p.p_no }"/>
	</c:if>
	
	<form action="${aaa }.pro" method="post" autocomplete=off>
		<input type="hidden" name="p_no" value="${p_no }">
		문제:<input name="problem" value="${p.problem }"><br>
		정답:<input name="solution" value="${p.solution }"><br>
		해설:<input name="solve" value="${p.solve }"><br>
		key값:<input name="keyval" value="${p.keyval }"><br>

		<button>만들기</button>
	</form>
	
	<c:if test="${!empty p }">
		<button id="addBtn">추가</button>
		<div >
			<c:forEach var="v" items="${vlist }">
				<input name="val" value="${v.val }"><button onclick="editBtn(this,${v.v_no })">수정</button><button onclick="delBtn(this,${v.v_no })">삭제</button><br>
			</c:forEach>
		</div>
	</c:if>
	
	<script>
		$('#addBtn').click(function(){
			$('#variablesContent').append('<input class="form-control col-8" name="val">&nbsp;<button class="btn btn-warning" onclick="okBtn(this)">확인</button>&nbsp;<button class="btn btn-info" id="cancleBtn">취소</button><br>')
		})
		
		$(document).on('click','#cancleBtn',function(){
			$(this).next().remove()
			$(this).prev().remove()
			$(this).prev().remove()
			$(this).remove()
		})
		
		function okBtn(this_){
			$.ajax({
				url:'ok.val',
				type:'post',
				data:{
					p_no:${p.p_no },
					val:$(this_).prev().val(),
				},
				success:function(data){
					//$(this_).text('수정')
					$('#variablesArea').load('edit.pro?p_no=${p.p_no } #variablesContent')
				},
			})
		}
		
		function delBtn(this_,v_no){
			$.ajax({
				url:'del.val',
				type:'post',
				data:{
					v_no:v_no,
				},
				success:function(data){
					$('#variablesArea').load('edit.pro?p_no=${p.p_no } #variablesContent')
				},
			})
		}
		
		function editBtn(this_,v_no){
			$.ajax({
				url:'edit.val',
				type:'post',
				data:{
					v_no:v_no,
					val:$(this_).prev().val(),
				},
				success:function(data){
					$('#variablesArea').load('edit.pro?p_no=${p.p_no } #variablesContent')
				},
			})
		}
	</script>
	
	
	<textarea id="math" rows="10" cols="50"></textarea><br>
	<iframe id=iframe name="math" src="preview" height="500px" width="100%">
	
	</iframe>
	
	<form action="preview" name="form1" target="math">
		<input type="hidden" id="mathinput" name="math">
	</form>
	<script>
		$('#mathinput').val($('#prob').val())
		document.form1.target="prob"
		document.form1.submit()
		$('#mathinput').val($('#solve').val())
		document.form1.target="solve"
		document.form1.submit()
		$('#mathinput').val($('#solution').val())
		document.form1.target="solution"
		document.form1.submit()
			
		$('#prob').on('input',function(){
			$('#mathinput').val($(this).val())
			document.form1.target="prob"
			document.form1.submit()
		})
		$('#solve').on('input',function(){
			$('#mathinput').val($(this).val())
			document.form1.target="solve"
			document.form1.submit()
		})
		$('#solution').on('input',function(){
			$('#mathinput').val($(this).val())
			document.form1.target="solution"
			document.form1.submit()
		})
	</script>
</body>
</html>