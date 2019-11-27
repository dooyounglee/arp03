<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#formdiv{
		border: 1px solid black;
		padding:20px;
		padding-left:60px;
		padding-right:60px;
		text-align:left;
		color:black;
		width:700px;
		margin-left:auto;
		margin-right:auto;

	}	
	
	.card{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
	
	}
	
	#bor{
		margin:0px;	
	}
	
	#regDate{
	float:right;
	color :gray;
	font-size:13px;
	}
	
	#content{
	border:1px;
		width:450px;
		height:230px;
	}
	#file,a{
	font-size:15px;
	}
	#btn{
		text-align:right;
		margin-left:auto;
		margin-right:auto;
		width:600px;
	}
	
	
	
</style>
<body>




<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<body>
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
	<br><br><br>
	
	
	<h1 align="center">게시글 상세보기</h1>
	
<%-- 	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center" border="1px" >
	
		<tr>
			<td colspan="2" align="center">${ n.n_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ n.title }</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<td>관리자</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>${ n.content }</td>		
		</tr>
		
	</table> --%>
	
	
	
	<div class="page-wrapper">
		<div class="row page-titles">
	</div>
	<div align="center">
	<div class="card">
	<br><br>
	
	
	
	<div id="formdiv" align="center">
	<p align="center" style="font-size: 15px ">${ n.n_no }번 글 </p>
	<!-- <label>제목 : </label> -->
	${ n.title }	
	<label id="bor" style="color: lightgray">---------------------------------------------------------------------------</label>
	<div>
	<label>${ b.name}</label>	
	
	<label id="regDate">${ n.regdate }</label>
	</div>
	<div id="content">
	${ n.content }	
	</div>

	</div>
	<br>
	<c:if test="${mem.id eq 'admin' }">
	<div align="right"  id="btn">
	
	<button onclick="location.href= 'nlist.ad';" align="center">리스트로 돌아가기</button>
	<a href="nupdateForm.ad?n_no=${ n.n_no }">수정하기</a>
	<a href="ndelete.ad?n_no=${ n.n_no }" >삭제하기</a>
	</div>
	</c:if>
	<br><br>
	
	
	<br><br><br><br>
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