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

ul,li{

display:inline;

}

</style>
<body>
	<%@ include file="../include/bhead.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
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
<br><br><br>
<h2 align="center">FAQ 입니다</h2>

<c:if test="${ mem.id eq 'admin' }">
	<button onclick="location.href='finsertForm.ad';">작성하기</button>
</c:if>
<nav align="center">
<ul >
	<li><a href="flist.ad" class="mt-2 waves-effect waves-dark btn btn-primary btn-md btn-rounded">전체</a></li>
	<li><a href="fcategory.ad?category=로그인" class="mt-2 waves-effect waves-dark btn btn-primary btn-md btn-rounded">로그인</a></li>
	<li><a href="fcategory.ad?category=수강"  class="mt-2 waves-effect waves-dark btn btn-primary btn-md btn-rounded">수강</a></li>
	<li><a href="fcategory.ad?category=홈페이지" class="mt-2 waves-effect waves-dark btn btn-primary btn-md btn-rounded">홈페이지</a></li>
	<li><a href="fcategory.ad?category=기타" class="mt-2 waves-effect waves-dark btn btn-primary btn-md btn-rounded">기타</a></li>
</ul>
</nav>
<br>
  <div class="col-lg-6" align="center" style="margin:auto">
                        <div class="card" align="center">
                            <div class="card-body" align="center">
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                   
                                        <thead align="center">
                                         <tr>
											<th>category</th>
											<th colspan="3" width="300">Question</th>
										</tr>
                                        </thead>
                                         <c:forEach items="${ list }" var="f">
                                        <tbody align="center"> 
                                        <tr>
                                        	<td>
                                        	<c:if test ="${f.category eq '수강' }">
                                        		<span class="badge badge-danger">${f.category }</span>
                                        	</c:if>
                                        	<c:if test="${ f.category eq '로그인' }">
												<span class="badge badge-warning">${f.category }</span>
                                        	</c:if>	
                                    		<c:if test="${ f.category eq '홈페이지' }">
                                    			<span class="badge badge-info">${f.category }</span>
                                    		</c:if>
											</td>
											<td colspan="3"  class="question" style="cursor:pointer">${ f.question }</td>
										</tr>       	
                                            <tr>
												<td colspan="3" style="display:none" style="cursor:pointer" class="table-active">
													${f.answer } 
													<c:if test="${ mem.id eq 'admin' }">
													<a href="fdelete.ad?faq_no=${ f.faq_no }" >삭제하기</a>
													</c:if>
												</td>
											</tr>
                                        </tbody>
                                        </c:forEach>
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
	
<script>

$(function(){
	
		$(".question").on("click" , function(){
			
			var this_answer=$(this).parent().next().children().eq(0); // 질문의 답변
			
			if($(this_answer).css("display")=="table-cell"){
				
				$(".table-active").hide()
			}else{
				$(".table-active").hide()
				$(this_answer).show()
				
				
			}
			/* //다 접기
			var this_answer=$(this).parent().next().children().eq(0);
			$(".answer").each(function(index,item){
				if($(this)!=this_answer)alert("ddd")
			})
			this_answer.toggle() */
		});
	
		$(".answer").on("click" , function(){
			
			
		});
	
});


</script>
</body>
</html>