<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
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
                        <h3 class="text-themecolor mb-0 mt-0">Forms</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no}">${ lec.title }</a></li>
                            <li class="breadcrumb-item active">질문게시판</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end" align="right;">
                           
                            <%@ include file="qRealTime.jsp" %>
                            
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
                <!-- 수강페이지 메뉴 -->
                	<%@ include file="../include/blecturemenu.jsp" %>
                   
                    <div class="col-lg-10">
                        <div class="card">
                            <div class="card-body">
                            <br>
                                <h4 class="card-title" align="center">${ lec.lec_no }번 강의_${ lec.title } 게시판</h4>
                                <h6 class="card-subtitle" align="right" style="color:black;">
                                	<%-- 총 게시글 갯수 : ${ pi.listCount }&nbsp;&nbsp;&nbsp;페이지 : ${ pi.currentPage } / ${ pi.maxPage }
	                                 &nbsp;&nbsp; --%>
	                                 
	                                 <c:if test="${ !empty mem }">
										<span><button class="btn waves-effect waves-light btn-info" style="align:right; cursor:pointer;" onclick="location.href='qWriteForm.qu'">글쓰기</button></span>
									 </c:if>
                                </h6>
                                <script>
                                	var ArrayList = [];
                                	jQuery.ajax({
                        				url:"questionList2.aj",
                        				dataType:"json",
                        				success:function(data){
                        					console.log(data);
                        					ArrayList = data;
                        					
                        					
                        				},
                        				error:function(){
                        					console.log("ajax 통신 실패");
                        				}
                        			});
                                	
                                	//제목검색용
                                		function searchSelect(){
                                		var Category1 = $('#Category1').val();
                                		var searchSelectContent = $("#searchSelectContent").val();
                                		$.ajax({
                            				url:"questionList3.aj",
                            				dataType:"json",
                            				data:{
                            					Category1:Category1,
                            					searchSelectContent:searchSelectContent
                            				},
                            				success:function(data){
                            					console.log(data);
                            					ArrayList = data;
                            					
                            				},
                            				error:function(){
                            					console.log("ajax 통신 실패");
                            				}
                            			});
                                	}
                                	
                                	
                                </script>
                                
                                

                                <script>
                                
                                function page(pNo){
                                	
                                	$tbody = $("#dlendud tbody").eq(0);
                                	$tbody.html("");
                                	console.log($tbody.length);
                                	
                                	var st=(pNo-1)*5 
                                	var str=""
                                	
                                	if ( ArrayList == null ){
                                		str+='<tr align="center">';
                                		str+='<td>게시글이 없습니다.</td>';
                                		str+='</tr>';
                                		$tbody.append(str);
                                	}
									/*< tr>
										<td colspan="7">게시글이 없습니다.</td>
									</tr> */
                                	
                                	
                                	for(i=0;i<5;i++){
                                		str+='<tr>';
                                		str+='<td>'+ArrayList[st+i].q_no+'</td>';
                                		str+='<td style="max-width:300px;">'+
                                		"<a href='qdetail.qu?q_no="+ArrayList[st+i].q_no+"'>" + 
                                				ArrayList[st+i].title+"</a>"
                                		+'</td>';
                                		str+='<td>'+ArrayList[st+i].name+'</td>';
                                		str+='<td>'+ArrayList[st+i].regdate+'</td>';
                                		str+='<td>'+ArrayList[st+i].vcount+'</td>';
                                		if(ArrayList[st+i].fileox =='Y'){
                                			str+='<td><img width="15" src="resources/siraFile/클립2.svg"></td>';
                                		};
										if(ArrayList[st+i].fileox != 'Y'){
											str+='<td>'+ArrayList[st+i].fileox+'</td>';
										};
										str+='<td>'+ArrayList[st+i].isreply+'</td>';
                                		str+='</tr>';
                                		
                                	/* 	if(ArrayList == 5){
                                			return;
                                		} */
                                		
                                	}
                                	$tbody.append(str);
                                }
                                
                                </script>
                                <div class="table-responsive">
                                    <table id="dlendud" class="table color-bordered-table muted-bordered-table">
                                        <thead>
                                            <tr align="center">
												<th>번호</th>
												<th>제목</th>
												<th>회원이름</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>첨부파일</th>
												<th>답변여부</th>
											</tr>
                                        </thead>
                                        <tbody id="tbody">
                                        	<%-- <c:if test="${ empty qList }">
												<tr align="center">
													<td colspan="7">게시글이 없습니다.</td>
												</tr>
											</c:if>
											
											<c:forEach items="${ qList }" var="q">
												<tr align="center">
													<td>${ q.q_no }</td>
													<td style="max-width:300px;">
														<a href="qdetail.qu?q_no=${ q.q_no }">${ q.title }</a>
													</td>
													<td>${ q.name }</td>
													<td>${ q.regdate }</td>
													<td>${ q.vcount }</td>
													
													<c:if test="${ q.fileox eq 'Y' }">
														<td><img width="15" src="resources/siraFile/클립2.svg"></td>
													</c:if>
													<c:if test="${ q.fileox ne 'Y' }">
														<td>${ q.fileox } </td>
													</c:if>
													<td>${ q.isreply }</td>
												</tr>
											</c:forEach> --%>
											
											
						<%-- <c:if test="${ !empty qList }"> --%>
							<!-- 페이징 -->
							<%-- <tr align="center" height="20">
								<td colspan="7">
									<!-- 이전 -->
									<c:if test="${ pi.currentPage eq 1 }">
										 이전 &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url value="question.qu" var="before">
											<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
											<c:param name="lec_no" value="${ lec.lec_no }"/>
										</c:url>
										<a href="${ before }"> 이전 </a>
									</c:if> --%>
									<!-- 페이지 -->
										<%-- <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
												<font color="red" size="4"> ${ p } </font>
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
												<c:url value="question.qu" var="page">
													<c:param name="currentPage" value="${ p }"/>
													<c:param name="lec_no" value="${ lec.lec_no }"/>
													<c:param name="m_no" value="${ mem.m_no }"/>
													<c:param name="Category1" value="Category3"/>
												</c:url>
												<a href="${ page }"> ${ p } </a>
											</c:if>
										</c:forEach> --%>
									<!-- 다음 -->
									<%-- <c:if test="${ pi.currentPage eq pi.maxPage}">
										 다음 &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage &&  pi.maxPage eq pi.endPage }">
										<c:url value="question.qu" var="after">
											<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
											<c:param name="lec_no" value="${ lec.lec_no }"/>
										</c:url>
										<a href="${ after }"> 다음 </a>
									</c:if>
								</td>
							</tr>
						</c:if>
                                  --%>
                                
                                        </tbody>
                                    </table>
                                 
                                 
          <div align="center">                       
          <ul id="pageul" class="pagination" align="center">
		
		<!-- <tr align="center" height="20">
			<td colspan="5"> -->
				<!-- 이전 -->
					<li class="page-item"><a class="page-link">이전</a></li>
				<!-- 페이지 -->
						<li style="cursor:pointer" class="page-item"><a class="page-link" onclick="page(1)">1</a></li>
						<li style="cursor:pointer" class="page-item"><a class="page-link" onclick="page(2)">2</a></li>
						<li style="cursor:pointer" class="page-item"><a class="page-link" onclick="page(3)">3</a></li>
				<!-- 다음 -->
					<li class="page-item"><a class="page-link">다음</a></li>
			<!-- </td>
		</tr> -->
			</ul>
			</div>
           
                                </div>
                                <!-- 검색창 -->
                                <br>
                                <div class="input-group">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2">
                                     <select id="Category1" class="form-control custom-select" name="Category1" data-placeholder="Choose a Category" tabindex="1">
                                         <option value="Category1">제목</option>
                                         <option value="Category2">내용</option>
                                      	 <option value="Category3">내가 쓴 글</option>
                                         <option value="Category4">작성자</option>
                                     </select>
                                 </div>
                                    <input type="text" id="searchSelectContent" class="col-lg-4 form-control" name="searchSelectContent" placeholder="Search for...">
                                    <div class="input-group-append col-lg-2">
                                    <button id="searchSelectBtn" class="btn btn-warning" onclick="searchSelect()" type="button">Search</button>
                                    </div>
                                </div>
                                <br>
                                
                                
                                
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

		<script>
/* 			function searchSelect(){
				if($("#searchSelectContent").val().trim() != ""){
					
				}else{
					alert("검색창에 입력해주세요.");
					return false;
				}
			}; */
		</script>







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

<%-- 	<jsp:include page="../include/footer.jsp"/> --%>
</body>
</html>