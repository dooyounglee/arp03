<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="${pageContext.request.contextPath}/resources/js/signature_pad.min.js" type="text/javascript"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css">
</head>
<body>

<%@ include file="../include/bhead.jsp"%>
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
	<br><br><br><br>
	<h1 align="center">휴가 상세보기</h1>
	<br>
<c:if test ="${mem.typee eq 's'}">
	<table border="1px">
	<tr>
	<th>선생님</th>
	<th>관리자</th>
	</tr>
	<tr>
	 	<td>
			 <c:if test = "${ v.tstatus eq 'N'}">
			 처리중
	  		 </c:if>
			 <c:if test = "${ v.tstatus eq 'B'}">
			 반려
	  		 </c:if>
	  	 	<c:if test ="${v.tstatus eq 'Y' }">
	  	 	<input type="text" id="txt" style="border-radius: 5px;" readonly>
	  	 </c:if>
	 	</td>
	<td>
		<c:if test = "${ v.astatus eq 'N'}">
			 처리중
  		</c:if>
		<c:if test ="${ v.astatus eq 'Y' }">
			승인
		</c:if>
	
	</td>
	</tr>
	</table>
</c:if>
	<c:if test ="${mem.typee eq 'a'}">
	
	<table border="1px">
	<tr>
	<th>선생님</th>
	</tr>
	<tr>
	 	<td>
			 <c:if test = "${ v.tstatus eq 'N'}">
			 처리중
	  		 </c:if>
			 <c:if test = "${ v.tstatus eq 'B'}">
			 반려
	  		 </c:if>
	  	 	<c:if test ="${v.tstatus eq 'Y' }">
	  	 	<img src ="resources/image/sign.png" width="200" height="100">
	  	 </c:if>
	 	</td>
	</tr>
	
	</table>
	</c:if>
	<input type="hidden" value="${v.v_no }">
	<table align="center" border="1px">
	<tr>
		<td colspan="2">${v.vacation_title}</td>
	</tr>
	<tr>
		
		<td>작성자</td>
		<td>${v.name}</td>
	</tr>
	<tr>
		<td>사유</td>
		<td>${v.reason }</td>
	</tr>	
	<tr>
		<td>휴가시작날짜</td>
		<td>${ fn:substring(v.start_date,0,10) }</td>
	</tr>
	<tr>
		<td>끝나는날짜</td>
		<td></td>
	</tr>
	<tr>
		<td>일수</td>
		<td>${v.date_count }일</td>
	</tr>
	
	<c:if test="${v.tstatus eq 'Y' && v.astatus eq 'Y'}">
		<td>출력하기</td>
		<td><button onclick="myvacation()">인쇄</button></td>
	</c:if>
	
	<tr>
	<c:if test="${v.tstatus eq 'B'}">
		
		<td>반려사유</td>
		<td>${v.companion_reason }</td>
	</c:if>
	
	</tr>
	</table>
	
	<c:if test="${mem.typee eq 't' }">
	<button onclick="location.href='sVlist.te';">리스트로돌아가기</button>
	
	<a onclick="location.href='permission.te?v_no=${v.v_no }'" style="cursor:pointer">허가</a>
	<!--<button id="sign">사인하기</button>  -->
	<a onclick="window.open('companiForm.me?v_no=${v.v_no}',width=300, height=300)" style="cursor:pointer">반려</a>
	
	<!-- iframe으로 가져오기 -->
	
 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#bs-example-modal-lg">Large modal</button>

<div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
 <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                              <iframe id="sof" name="sof" src="signature-pad.te" width="100%" height="400"></iframe>
											<div id="signature-pad" class="m-signature-pad">
									      		<div class="m-signature-pad--body" id="signDiv">
									          		<canvas id="signText"></canvas>
									      		</div>
											       <div class="m-signature-pad--footer">
											           <div class="description">사인해 주세요~</div>
											           <button type="button" class="button clear" data-action="clear">지우기</button>
											           <button type="button" class="button save" data-action="save">저장</button>
											       </div>
									  		</div> 
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div>                               

<%-- <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#centermodal">Center modal</button>
<div class="modal fade" id="centermodal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myCenterModalLabel">Center modal</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                               <div id="signature-pad" class="m-signature-pad">
										        <div class="m-signature-pad--body">
										            <canvas></canvas>
										        </div>
										        <div class="m-signature-pad--footer">
										            <div class="description">사인해 주세요~</div>
										            <button type="button" class="button clear" data-action="clear">지우기</button>
										            <button type="button" class="button save" data-action="save">저장</button>
										        </div>
										    </div>
                                           </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div> --%>

  	


	 </c:if>
	
	<c:if test="${mem.typee eq 's' }">
	<button onclick="location.href='vlist.me';" align="center">리스트로 돌아가기</button>
	
	<c:if test="${v.tstatus eq 'N'}">
	<a href="vupdateForm.me?v_no=${ v.v_no }">수정하기</a>
	</c:if>
	<c:if test="${v.tstatus eq 'B'}">
	<a href="vdelete.me?v_no=${ v.v_no }" >삭제하기</a>
	</c:if>
	</c:if>
	
	            <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->
	<%@ include file="../include/bjs.jsp" %>
	
	 <!--  헤더 제이쿼리 충돌 방지  -->
	
	
	<!-- <script>
	
	var jq132 = jQuery.noConflict();

	
	</script> -->
	
<script>

$("#signText").click(function(){
	alert("ㅋㅋㅋ");
})


function myvacation() {
	  window.print("#tb");
	  
	}
		
	var canvas = $("#signature-pad canvas")[0];
	var sign = new SignaturePad(canvas, {
	    minWidth: 1,
	    maxWidth: 5,
	    penColor: "rgb(0, 0, 0)"
	});
	 
	$("[data-action]").on("click", function(){
	    if ( $(this).data("action")=="clear" ){
	        sign.clear();
	    }
	    else if ( $(this).data("action")=="save" ){
	        if (sign.isEmpty()) {
	            alert("사인해 주세요!!");
	        } else {
	            $.ajax({
	                url : "save.jsp",
	                method : "post",
	                dataType : "json",
	                data : {
	                    sign : sign.toDataURL()
	                },
	                success : function(r){
	                    alert("저장완료 : " + r.filename);
	                    sign.clear();
	                },
	                error : function(res){
	                    console.log(res);
	                }
	            });
	        }
	    }
	});
	 
	 
	function resizeCanvas(){
	    var canvas = $("#signature-pad canvas")[0];
	
	    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
	    canvas.width = canvas.offsetWidth * ratio;
	    canvas.height = canvas.offsetHeight * ratio;
	    canvas.getContext("2d").scale(ratio, ratio);
	}
 	 
	$(window).resize( function(){
	    resizeCanvas();
	});
	 
	resizeCanvas();


	




</script>
	

</body>
</html>