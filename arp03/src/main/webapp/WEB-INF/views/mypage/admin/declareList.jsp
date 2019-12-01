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
                        <h3 class="text-themecolor mb-0 mt-0">Declare List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Declare List</li>
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
                                <h4 class="card-title">신고관리</h4>
                                <h6 class="card-subtitle">Add class <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>m_no</th>
                                                <th>kind</th>
                                                <th>obj</th>
                                                <th>obj_no</th>
                                                <th>regdate</th>
                                                <th>okdate</th>
                                                <th>status</th>
                                                <th>status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="d" items="${list }">
                                        		<tr>
	                                        		<td>${d.d_no }</td>
	                                        		<td>${d.m_no }</td>
	                                        		<td>${d.kind }</td>
	                                                <td>${d.obj }</td>
	                                                <td>${d.obj_no }</td>
	                                                <td>${d.regdate }</td>
	                                                <td>${d.okdate }</td>
	                                                <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#info-header-modal" onclick="fillModal(${d.d_no })">보기</button></td>
	                                                <td><button class="btn btn-success" onclick="ok(${d.d_no})">처리완료</button></td>
												</tr>
											</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>m_no</th>
                                                <th>kind</th>
                                                <th>obj</th>
                                                <th>obj_no</th>
                                                <th>regdate</th>
                                                <th>okdate</th>
                                                <th>status</th>
                                                <th>status</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <script>
								   		$('#zero_config').DataTable();
								    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                
                <!-- Info Header Modal -->
                <div id="info-header-modal" class="modal fade" tabindex="-1" role="dialog"
                    aria-labelledby="info-header-modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header modal-colored-header bg-info">
                                <h4 class="modal-title text-white" id="info-header-modalLabel">신고내용</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <h5 class="mt-0">Info Background</h5>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio,
                                    dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta
                                    ac consectetur ac, vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.
                                    Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor
                                    auctor.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light"
                                    data-dismiss="modal">Close</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
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
        
        
        
        
        
        
        
        
        
        
        

	<form id="form" method='post'>
		<input type="hidden" name="d_no">
	</form>
	<script>
		function ok(d_no){
			var formm=$('#form').attr('action','okDeclare.ad')
			formm.children('input').eq(0).val(d_no)
			formm.submit();
		}
		function fillModal(d_no){
			$.ajax({
				url:'get.de',
				type:'post',
				data:{
					d_no:d_no,
				},
				dataType:'json',
				success:function(data){
					var kind;
					if(data.kind==0){
						kind='영리목적/홍보'
					}else if(data.kind==1){
						kind='불법정보'
					}else if(data.kind==2){
						kind='음란성/선정성'
					}else if(data.kind==3){
						kind='욕설/인신공격'
					}else if(data.kind==4){
						kind='개인정보노출'
					}
					var obj=data.obj=="b"?"게시글":"댓글"
					$('#info-header-modal .modal-body').children().eq(0).text(obj+" "+data.obj_no+"번")
					$('#info-header-modal .modal-body').children().eq(1).text(kind)
					$('#info-header-modal .modal-body').children().eq(2).text(data.content)
				},
			})
		}
	</script>
</body>
</html>