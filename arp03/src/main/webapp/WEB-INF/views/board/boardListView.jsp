<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/bhead.jsp"%>
<style>
	/* .col-lg-10, #page{
		margin-left:auto;
		margin-right: auto;
	} */
	/* .card{
		margin-left:auto;
		margin-right: auto;
	} */
	/* #searchArea{
		width:100%;
		margin-left:auto;
		margin-right:auto;
		margin-top:0.5rem;
	}
	#realSearch{
		margin-left:35%;
		margin-right:35%;
		width:100%;
	} */
</style>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
</head>
<body class="fix-header card-no-border logo-center">
	
	<%@ include file="../include/bpreloader.jsp" %>
	
	<div id="main-wrapper">
	
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->

	<div class="page-wrapper">
	
		<div class="container-fluid">
	
	             <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">자유게시판</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">자유게시판</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center" style="padding-left:30%;">
                        <jsp:include page="../question/qRealTimeFree.jsp"></jsp:include>
                    </div>
                </div>
	
	<div class="row">
	<div class="col-12">
                        <div class="card">
                            <div class="card-body">
	
	<h4 align="left" style="color:black">자유 게시판</h4>
	<div align="left">
		<button class="btn waves-effect waves-light btn-info" onclick="location.href='binsertForm.do';">글쓰기</button>
	</div>
	<h6 class="card-subtitle"></h6>
	<div class="row">
			<div class="col-lg-12">
					
						<div class="table-responsive">
	<table align="center" cellspacing="0" class="table color-table muted-table text-center">
		<thead>
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>댓글수</th>
		</tr>
		</thead>
		<c:forEach items="${ list }" var="b">
			<tr>
				<td>${ b.b_no }</td>
				<td><a href="bdetail.do?b_no=${ b.b_no }">${ b.title }</a></td>
				<td>익명</td>
				<td>${ b.regdate }</td>
				<td>${ b.vcount }</td>
				<td>${ b.rcount }</td>
			</tr>
		</c:forEach>
		
		<c:if test="${pi.listCount eq 0}">
			<tr>
			<td align="center" colspan="6">존재하는 게시글이 없습니다.</td>
			</tr>
		</c:if>
		</table>
		</div>
		
		</div>
		<!-- 페이징 처리 -->
		<div id="page" class="text-center" style="float:none; margin:0 auto">
		<ul id="pageul" class="pagination">
		<c:if test="${pi.listCount ne 0}">
		<!-- <tr align="center" height="20">
			<td colspan="5"> -->
				<!-- 이전 -->
				<c:if test="${ pi.currentPage eq 1 }">
					<li class="page-item"><a class="page-link">이전</a></li>
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="blist.do" var="prev">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ prev }">이전</a></li>
				</c:if>
				<!-- 페이지 -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<li class="page-item"><a class="page-link">${ p }</a></li>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="blist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ page }"> ${ p } </a></li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					<li class="page-item"><a class="page-link">다음</a></li>
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="blist.do" var="next">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ next }">다음</a></li>
				</c:if>	
			<!-- </td>
		</tr> -->
		</c:if>
		</ul>
		</div>
					<div id="searchArea" class="text-center col-lg-12" align="center" style="float:none; margin:0 auto;">
						<form id="searchDo" action="search.do" method="get">
                                            <div align="center" id="realSearch" class="input-group text-center" style="margin-right:35%; margin-left:35%; width:100%">
                                            	<select class="col-md-1 custom-select" id="searchCondition" name="condition">
                                                <option value=1>제목</option>
                                                <option value=2>제목+내용</option>
                                            	</select>
                                                    <input type="text" id="searchform" class="form-control col-sm-2" name="search">
                                             <div class="input-group-append">
                                            <button class="btn btn-info" type="button" onclick="check();">검색</button>
                                     </div>
                         </div>
						</form>	
					</div>
				
		</div>
	</div>
	
	                            </div>
                        </div>
                        
                        </div>
                        
                        </div>
                         <!-- ============================================================== -->
            			<!-- End Container fluid  -->
            			<!-- ============================================================== -->
                        
                        <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
                        
                        
</div>
	</div>
	
	<%@ include file="../include/bjs.jsp" %>
	<script>
	function check(){
		if($("#searchform").val().trim() == ""){
			alert("내용을 입력해주세요.");
			return false;
		} 
		$("#searchDo").submit();
	}
	</script>
</body>
</html>