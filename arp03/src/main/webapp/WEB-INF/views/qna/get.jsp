<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
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
                        <h3 class="text-themecolor mb-0 mt-0">Q&A</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Q&A</li>
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
                                <h4 class="card-title">문의내용</h4>
                                <h6 class="card-subtitle">Just add <code>form-material</code> class to the form that's
                                    it.</h6>
                                
                                    <div class="form-group">
                                        <label>제목</label>
                                        <p>${qna.title }</p>
                                    </div>
                                    <div class="form-group">
                                        <label>작성자</label>
                                        <p>${qna.name }</p>
                                    </div>
                                    <div class="form-group">
                                        <label>내용</label>
                                        <p>${qna.content }</p>
                                    </div>
                                    <c:if test="${!empty qna.answer }">
                                    <div class="form-group">
                                        <label>답변</label>
                                        <p>${qna.answer }</p>
                                    </div>
                                    </c:if>
                                    <c:if test="${mem.typee eq 'a' }">
                                    <a class="btn btn-success" href="qnaList.ad">목록</a>
                                    </c:if>
                                    <c:if test="${mem.typee eq 's' || mem.typee eq 't'}">
                                    <a class="btn btn-success" href="mylist.qna">목록</a>
                                    </c:if>
                                    <button type="button" class="btn btn-success" onclick="del(${qna.qna_no})">삭제</button>
                                <c:if test="${empty qna.answer && mem.typee eq 'a' }">
                                <form id="answerForm" class="form-material mt-4" action="answerQna.ad" method="post" autocomplete=off>
                                	<input type="hidden" name="qna_no" value="${qna.qna_no }">
                                    <div class="form-group">
                                        <label>답변</label>
                                        <textarea class="form-control" rows="5" name="answer"></textarea>
                                    </div>
                                    <button type="button" class="btn btn-success" onclick="ok()">답</button>
                                </form>
                                </c:if>
                                <script>
                                	function ok(){
                                		var answer=$('#answerForm textarea').eq(0).val()
                                		if(answer==""){
                                			alert("답변내용이 비어 있어요.")
                                			return;
                                		}
                                		$('#answerForm').submit()
                                	}
                                </script>
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
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../include/header.jsp"/>
	
	${qna }<br>
	<form action="answerQna.ad" method="post" autocomplete=off>
		<input type="hidden" name="qna_no" value="${qna.qna_no }">
		<input name="answer"><button>답</button><br>
	</form>
	<button onclick="del(${qna.qna_no})">삭제</button><br>
	
	<form id="form" method='post'>
		<input type="hidden" name="qna_no">
	</form>
	<script>
		function del(qna_no){
			var formm=$('#form').attr('action','del.qna')
			formm.children('input').eq(0).val(qna_no)
			formm.submit();
		}
	</script>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>