<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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


<%-- <table  align="center" border="1" cellspacing="0" width="700" method="post">
	<tr>
		<th>강의번호</th>
		<th>강의명</th>
		<th>시작일</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>휴가신청</th>
	</tr>
	
	<c:forEach items="${list }" var="c">
	<tr>
		<td>${c.lec_no }</td>
		<td>${c.title }</td>
		<td>${c.startdate }</td>
		<td>${c.dayofweek}</td>
		<td>${c.starttime }</td>
		<td><a href="vinsertForm.me?m_no=${c.m_no }&lec_no=${c.lec_no}&title=${c.title}">휴가신청하기</a></td>
	</tr>
	</c:forEach>
	 --%>
<button onclick="location.href='vlist.me';">내 휴가리스트</button>
	<div class="col-lg-6" align="center">
                        <div class="card" align="center">
                            <div class="card-body" align="center">
                                <h4 class="card-title">휴가를 쓸 수업</h4>
                                <h6 class="card-subtitle">${mem.name }의 강의</h6>
                                <div class="table-responsive" align="center">
                                    <table class="table color-table info-table">
                                        <thead align="center">
                                            <tr>
                                               <th>강의번호</th>
												<th>강의명</th>
												<th>시작일</th>
												<th>요일</th>
												<th>시작시간</th>
												<th>휴가신청</th>
                                            </tr>
                                        </thead>
                                        <tbody align="center">
                                        <c:forEach items="${list }" var="c">
										<tr>
											<td>${c.lec_no }</td>
											<td>${c.title }</td>
											<td>${c.startdate }</td>
											<td>${c.dayofweek}</td>
											<td>${c.starttime }</td>
											<td><span class="badge badge-warning"><a href="vinsertForm.me?m_no=${c.m_no }&lec_no=${c.lec_no}&title=${c.title}">휴가신청하기</a></span></td>
										</tr>
										</c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
		
	       <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->


	<%@ include file="../include/bjs.jsp" %>
	






</body>
</html>