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
                                <h4 class="card-title">회원관리</h4>
                                <a class="btn btn-success float-right" href="insertMemberToLecture.ad">회원을 강좌로 넣기</a>
                                <h6 class="card-subtitle"><a class="btn btn-success" href="insertMember.ad">회원등록</a></code></h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>email</th>
                                                <th>phone</th>
                                                <th>Role</th>
                                                <th>강퇴</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${list }">
                                        		<tr>
	                                        		<td>${m.m_no }</td>
	                                                <td><a href="DetailStudent.ad?m_no=${m.m_no }">${m.name }</a></td>
	                                                <td>${m.email }</td>
	                                                <td>${m.phone }</td>
	                                                <td>
	                                                	<c:if test="${m.typee eq 'a'}">
	                                                		<span class="badge badge-danger">admin</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 's'}">
	                                                		<span class="badge badge-info">member</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 't'}">
	                                                		<span class="badge badge-warning">teacher</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 'm'}">
	                                                		<span class="badge badge-success">manager</span>
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                	<c:if test="${m.status eq 'Y'}">
	                                                		<button class="btn btn-danger" onclick="banish(${m.m_no})">강퇴</button>
	                                                	</c:if>
	                                                	<c:if test="${m.status eq 'N'}">
	           	                                     		<button class="btn btn-primary" onclick="banishCancle(${m.m_no})">강퇴취소</button>
	                                                	</c:if>
	                                                	<c:if test="${m.status eq 'A'}">
	                                                		유저가 인증하기 전
	           	                                     		<%-- <button class="btn btn-primary" onclick="accept(${m.m_no})">승인</button> --%>
	                                                	</c:if>
	                                                </td>
												</tr>
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
	
	<h1>회원관리</h1>
	<a href="insertMember.ad">회원등록</a><br>
	<a href="insertMemberToLecture.ad">학생을 강의에 꽂아주기</a><br>
	<c:forEach var="m" items="${list }">
		<a href="DetailStudent.ad?m_no=${m.m_no }">${m }</a>
		<button onclick="banish(${m.m_no})">강퇴</button><button onclick="banishCancle(${m.m_no})">강퇴취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="m_no">
	</form>
	<script>
		function banish(m_no){
			var formm=$('#form').attr('action','banish.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
		function banishCancle(m_no){
			var formm=$('#form').attr('action','banishCancle.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
		/* function accept(m_no){
			var formm=$('#form').attr('action','acceptMember.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		} */
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>