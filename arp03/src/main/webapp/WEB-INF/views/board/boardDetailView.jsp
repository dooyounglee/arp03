<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btns{display: inline-block;}
	#title{align:center; height:100px;}
	#demo-foo-pagination{width:700px;}
	#formdiv{
		<!--border: 1px solid black;-->
		padding:20px;
		padding-left:60px;
		padding-right:60px;
		text-align:left;
		color:black;
		width:900px;
		height:auto;
		margin-left:auto;
		margin-right:auto;

	}	
	.card{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
		width:1000px;
	}
	#bor{
		margin:0px;	
	}
	#regDate{
		float:right;
		color :gray;
		font-size:13px;
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
	#reTb{text-align:center}
	
	.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */   
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */        
                              
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<%@ include file="../include/bhead.jsp"%>
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
		<div class="row page-titles">
		</div>
		<div class="col-12">
                        <div class="card">
                            <div class="card-body">
	<br>
	<div id="formdiv" align="center">
	<p align="center" style="font-size: 15px ">${ b.b_no }번 글</p>
	${ b.title }		<br>
	<label id="bor" style="color: lightgray">---------------------------------------------------------------------------</label>
	<div>
	
	<label id="regDate">${ b.regdate }</label>
	</div>
	<div id="content">
	${ b.content }	
	</div>
	<br>
	<div id="btns" align="center">
		<button type="button" class="btn waves-effect waves-light btn-rounded btn-danger" onclick="declareBoard();">신고</button>
				<c:if test="${ mem.m_no eq b.m_no }">
					<button class="btn waves-effect waves-light btn-rounded btn-info" type="button" onclick="location.href='bupdateView.do?b_no=${b.b_no}';">수정</button>
					<button class="btn waves-effect waves-light btn-rounded btn-info" type="button" onclick="deleteCheck();">삭제</button>
				</c:if>
	</div>
	
	<br>
	<br>
	<div class="card-body">
	<!-- 댓글 등록 부분 -->
	<!-- <div class="card"> -->
	<div id="re">
	<table id="reTb" width="600px" align="center" cellspacing="0">
		<tr>
		
			<td><textarea cols="60" rows="3" id="rContent"></textarea></td>
			<td><button class="btn waves-effect waves-light btn-info" id="rBtn">등록</button></td>
		</tr>
	</table>
	<!-- </div> -->
	<!-- 댓글 목록 부분 -->
	<br>
	<!-- <div class="table-responsive card"> -->
	<table id="demo-foo-pagination" align="center" cellspacing="0" style="color:black">
		<thead>
			<tr>
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
	<!-- </div> -->
	</div>
		</div>
	</div>
		</div>
	 </div>
	 <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	</div>
	
	
	</div>
	
	<%@ include file="../include/bjs.jsp" %>
	
	<!-- 신고 모달 창 -->
	<div class="modal" id="declareBModal">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">신고하기</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                    <div class="card-body">
                                <div class="demo-radio-button">
                                    <input name="kind" type="radio" id="radio_1" value="1">
                                    <label for="radio_1">영리목적/홍보</label>
                                    <input name="kind" type="radio" id="radio_2" value="2">
                                    <label for="radio_2">불법정보</label>
                                    <input name="kind" type="radio" id="radio_3" value="3">
                                    <label for="radio_3">음란성/선정성</label>
                                    <input name="kind" type="radio" id="radio_4" value="4">
                                    <label for="radio_4">욕설/인신공격</label>
                                    <input name="kind" type="radio" id="radio_5" value="5">
                                    <label for="radio_5">개인정보노출</label>
                                    <h6>신고사유</h6>
                                    <input name="content" id="declareContents" type="text" required>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light close" data-dismiss="modal">취소</button>
                        <button type="button" id="declareB" class="btn btn-primary">신고하기</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
        </div>
        
        
        <div class="modal" id="declareRModal">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">신고하기</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                    <div class="card-body">
                                <div class="demo-radio-button">
                                    <input name="kind" type="radio" id="radio_1" value="1">
                                    <label for="radio_1">영리목적/홍보</label>
                                    <input name="kind" type="radio" id="radio_2" value="2">
                                    <label for="radio_2">불법정보</label>
                                    <input name="kind" type="radio" id="radio_3" value="3">
                                    <label for="radio_3">음란성/선정성</label>
                                    <input name="kind" type="radio" id="radio_4" value="4">
                                    <label for="radio_4">욕설/인신공격</label>
                                    <input name="kind" type="radio" id="radio_5" value="5">
                                    <label for="radio_5">개인정보노출</label>
                                    <h6>신고사유</h6>
                                    <input name="content" id="declareContents" type="text" required>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light close" data-dismiss="modal">취소</button>
                        <button type="button" id="declareR" class="btn btn-primary">신고하기</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
        </div>
	
	<script>
		function declareBoard(){
			 //var url="insertForm.de";
			/*  var obj = "b";
			 var obj_no = ${b.b_no};
	         window.open(url,"","width=500,height=500,left=600"); */
	         
	        var form = document.createElement("form");
			form.setAttribute("method", "post");          
			form.setAttribute("action", "insertForm.de");
			form.setAttribute("target", "reportForm")
				
			document.body.appendChild(form);
				
			var input_id = document.createElement("input");
				
			input_id.setAttribute("type", "hidden");

			input_id.setAttribute("name", "obj");
			input_id.setAttribute("value", "b");

			form.appendChild(input_id);
				
			var input_id2 = document.createElement("input");
				
			input_id2.setAttribute("type", "hidden");

			input_id2.setAttribute("name", "obj_no"); 
			input_id2.setAttribute("value", ${b.b_no});

			form.appendChild(input_id2);
				
			var wintype = "width=500, height=430, left=600, resizable=no";
			open("", "reportForm", wintype);
				
			form.submit();
	     
		}
	
		function deleteCheck() {
			var rst = confirm("정말 삭제하시겠습니까?");
			if(rst) {
				location.href='bdelete.do?b_no=${b.b_no}';
			}
		}
	
		$(function(){
			getReplyList();
			
			// 신고 모달창용 function
			/* $(document).on("click", "#dBoard", function(){
	        	 $("#declareBModal").css({"display":"block"});
	 		});
			
			$(document).on("click", ".close", function(){
	        	 $(".modal").css({"display":"none"});
	 		});
			
			$(document).on("click", "#declareB", function(){
				var kind=$('input[name="kind"]:checked').val()
				
	 			$.ajax({
					url:'insert.de',
					type:'post',
					data:{
						kind:kind,
						content:$('#declareContents').val(),
						obj:"b",
						obj_no:${ b.b_no }
					},
					success:function(data){
						$(".modal").css({"display":"none"});
					},
				})
	 		}); 
			
			$(document).on("click", "#declareR", function(){
				var kind=$('input[name="kind"]:checked').val()
				
	 			$.ajax({
					url:'insert.de',
					type:'post',
					data:{
						kind:kind,
						content:$('#declareContents').val(),
						obj:"r",
						obj_no:obj_no
					},
					success:function(data){
						$(".modal").css({"display":"none"});
					},
				})
	 		});
			
			*/
			
			$(document).on("click", ".dec", function(){
				var form = document.createElement("form");
				form.setAttribute("method", "post");          
				form.setAttribute("action", "insertForm.de");
				form.setAttribute("target", "reportForm")
					
				document.body.appendChild(form);
					
				var input_id = document.createElement("input");
					
				input_id.setAttribute("type", "hidden");

				input_id.setAttribute("name", "obj");    
				input_id.setAttribute("value", "r");       

				form.appendChild(input_id);
				
				var $r_no = $(this).parent().parent().children("#hrno").val();	
				var input_id2 = document.createElement("input");
					
				input_id2.setAttribute("type", "hidden");

				input_id2.setAttribute("name", "obj_no");      
				input_id2.setAttribute("value", $r_no);

				form.appendChild(input_id2);
					
				var wintype = "width=500, height=430, left=600, resizable=no";
				open("", "reportForm", wintype);
					
				form.submit();
			});
			
			jQuery("#rBtn").on("click", function(){
				var content = $("#rContent").val();
				if(content == ""){
					alert("댓글을 작성해주세요!");
					return false;
				}
				// 내용, 작성자 아이디, 게시판 번호
				$.ajax({
					url:"rinsert.do",
					data:{content:$("#rContent").val(), b_no:${b.b_no}, m_no:${mem.m_no}},
					success:function(data){
						
						if(data == "success") {
							getReplyList();
							$("#rContent").val("");
						} else {
							alert("댓글 작성에 실패했습니당");
						}
						
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
			
			$clicked = 0;

			jQuery(document).on("click", ".rr", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				$parent_no = $(this).parent().parent().children("#hrno").val();
				
				//$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
				
				if($clicked%2 == 0) {
					$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb btn waves-effect waves-light btn-rounded btn-outline-info btn-xs'>등록</button>" + "<input type='button' class='cancel btn waves-effect waves-light btn-rounded btn-outline-secondary btn-xs' value='취소'/></td></tr>");
				} else {
					$(this).parent().parent().next().remove();
				}
				//console.log($clicked);
				$clicked++;
				//console.log($clicked);
			});
			
			jQuery(document).on("click", ".rrsb", function(){
				//console.log($("#reContent").val());
				//console.log($parent_no);
				
				$.ajax({
					url:"reinsert.do",
					data:{content:$("#reContent").val(), b_no:${b.b_no}, m_no:${mem.m_no}, parent_no:$parent_no},
					success:function(data){
						if(data == "success") {
							getReplyList();
						} else {
							alert("대댓글 작성에 실패했습니당");
						}
					}, error:function(){
						console.log("ajax 통신 실패");
					}	
				
				});
			});
			
			jQuery(document).on("click", ".del", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				//var $r_no = $(this).parent().parent().children().eq(0).text();
				//console.log($td1.eq(0).text());
				var $r_no = $(this).parent().parent().children("#hrno").val();
				var $depth = $(this).parent().parent().children("#depth").val();
							
				var rst = confirm("정말 삭제하시겠습니까?");
				if(rst) {
					$.ajax({
						url:"deleteReply.do",
						data:{r_no:$r_no, depth:$depth},
						success:function(data){
							//console.log("삭제 성공");
							getReplyList();
						}, error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}
			});
			
			jQuery(document).on("click", ".alt", function(){
				//console.log("수정ㄱㄱ");
				//var $content = $(this).parent().parent().children(".content").text();
				var $content=$(this).parent().parent().children(".content");	
			 	//var $contentText= $content.text();
				//console.log($content);
				var $btns = $(this).parent();
				console.log($btns);
				
				var $reContent = $("<textarea cols='30' name='reContent' id='reContent'>" + $content.text() + "</textarea>");
				
				$content.replaceWith($reContent);
				$("#reContent").focus();
				
				var $reBtns = $('<input type="button" class="modify btn waves-effect waves-light btn-rounded btn-outline-info btn-xs" value="등록"/>' + '<input type="button" class="cancel cancel btn waves-effect waves-light btn-rounded btn-outline-secondary btn-xs" value="취소"/>');
				
				/* $reBtns += $submit;
				$reBtns += $cancel; */
				
				$btns.replaceWith($reBtns);
				
			});
			
			jQuery(document).on("click", ".modify", function(){
				
				//var $r_no = $(this).parent().children().eq(0).text();
				/* console.log($r_no);
				console.log($("#reContent").val()); */
				var $r_no = $(this).parent().children("#hrno").val();
				
				jQuery.ajax({
					url:"updateReply.do",
					data:{content:$("#reContent").val(), r_no:$r_no},
					success:function(data){
						console.log("수정 성공");
						getReplyList();
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				})
				
			});
			
			jQuery(document).on("click", ".cancel", function(){
				getReplyList();
			});
			
		
		});
		$count = 0;
		function getReplyList(currentPage){
			$clicked = 0;
			jQuery.ajax({
				url:"replyList.do",
				data:{b_no:${b.b_no}, currentPage:currentPage},
				dataType:"json",
				success:function(data){
					console.log(data.list);
					console.log(data.pi);
					$tbody = jQuery("#demo-foo-pagination tbody");
					$tbody.html("");
					$pageinfo = data.pi;
					//$("#rCount").text("댓글(" + data.length + ")");
					$rcount = 0;
					
					if(data.list.length > 0){ // 댓글이 존재할 경우
						jQuery.each(data.list, function(index, value) { // value == data[index]
						
						$tr = jQuery("<tr>");
						$td = jQuery("<td>");
						
						$rnoTd = $("<td>").text("익명");
						$rrnoTd = jQuery("<td>").text("┖>");
							
						$contentTd = $("<td class='content' width='250'>").text(value.content);
						$dateTd = jQuery("<td width='180'>").text(value.update_date);
						
						$rreply = jQuery('<input type="button" class="rr btn waves-effect waves-light btn-rounded btn-outline-info btn-xs" value="답댓글"/>');
						$altB = jQuery('<input type="button" class="alt btn waves-effect waves-light btn-rounded btn-outline-secondary btn-xs" value="수정"/>');
						$deleteB = jQuery('<input type="button" class="del btn waves-effect waves-light btn-rounded btn-outline-secondary btn-xs" value="삭제"/>');
						$decB = $('<input type="button" class="dec btn waves-effect waves-light btn-rounded btn-outline-danger btn-xs" value="신고"/>');
						$hrno = jQuery('<input type="hidden" id="hrno" value="' + value.r_no + '"/>');
						$depth = jQuery('<input type="hidden" id="depth" value="' + value.depth + '"/>');
						
						if(value.depth == 1) {
							$tr.append($rnoTd);
						} else {
							$tr.append($rrnoTd);
						}
						
						if(value.status == 'N') {
							//$rnoTd = $("<td>").text("");
							$contentTd = jQuery("<td>").text("사용자가 삭제한 댓글입니다.");
							$dateTd = jQuery("<td>").text("");
							$rcount++;
						}
						
						if(value.status == 'D') {
							//$rnoTd = $("<td>").text("");
							$contentTd = jQuery("<td>").text("신고로 삭제된 댓글입니다.");
							$dateTd = jQuery("<td>").text("");
						}
						
						$tr.append($contentTd);
						$tr.append($dateTd);
						//$tr.append($hrno);
						
						if(value.depth == 1 && value.status == 'Y') {
							$tr.append($td.append($rreply));
						}
						
						if(value.m_no == ${mem.m_no} && value.status == 'Y') {
							$tr.append($td.append($altB));
							$tr.append($td.append($deleteB));
						}
						
						if(value.status == 'Y') {
							$tr.append($td.append($decB));	
						}
						
						$tr.append($hrno);
						$tr.append($depth);
						$tbody.append($tr);
						
						});
					if($count == 0) {
						page(data.pi);
					} else {
						/* var $lastRow = jQuery("#demo-foo-pagination:last");
						console.log();
						$lastRow.append("<tr><td id='pagetd' align='center' colspan='4'>"); */
						//$("#pagetd").append("안녕하세요");
						$("#pagetd").empty();
						page(data.pi);
					}
						$count++;
						//console.log($count);
					} else {
						$tr = $("<tr>");
						
						$contentTd = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					//console.log((data.length - $rcount));
					$("#rCount").text("댓글(" + data.pi.listCount + ")");
					if($pageinfo.currentPage == 1) {
						$("#lt").attr("disabled", true);
					} else {
						$("#lt").attr("disabled", false);
					}
					if($pageinfo.currentPage == $pageinfo.maxPage) {
						$("#rt").attr("disabled", true);
					} else {
						$("#rt").attr("disabled", false);
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function page(e){ 
			//$("#rtb> :last").append("<tr><td colspan='4'>헤헤</td></tr>")
			var $lastRow = jQuery("#demo-foo-pagination:last");
			var $leftbtn = jQuery("<div class='leftbtn btns'>");
			var $ltlt = jQuery("<button id='ltlt' class='btn btn-secondary'>").text("<<");
			var $lt = jQuery("<button id='lt' class='btn btn-secondary'>").text("<");
			$lastRow.append("<tr><td id='pagetd' align='center' colspan='4'>");
			//$pagetd = $("#pagetd");
			$leftbtn.append($ltlt).append($lt);
			console.log($lastRow);
			$("#pagetd").append($leftbtn);
			var $rightbtn = jQuery("<div class='rightbtn btns'>");
			var $gt = jQuery("<button id='rt' class='btn btn-secondary'>").text(">");
			var $gtgt = jQuery("<button id='rtrt' class='btn btn-secondary'>").text(">>");
			$rightbtn.append($gt).append($gtgt);
			for (var i = e.startPage; i <= e.endPage; i++) {
					var btn = jQuery("<button class='btns numbtn btn btn-secondary'>").text(i);
					$("#pagetd").append(btn);
				}
				//$lastRow.append(btn);
			
			$("#pagetd").append($rightbtn);
			$lastRow.append("</td></tr>");
			//$(".tagactive").attr("disabled", true);
			
		}
		
		jQuery(document).on("click", "#rtrt", function(){
			getReplyList($pageinfo.endPage);
			//console.log($pageinfo.endPage);
		});
		
		jQuery(document).on("click", "#ltlt", function(){
			getReplyList(1);
		});
		
		jQuery(document).on("click", "#lt", function(){
			getReplyList(($pageinfo.currentPage) - 1);
		});
		
		jQuery(document).on("click", "#rt", function(){
			getReplyList(($pageinfo.currentPage) + 1);
		});
		
		jQuery(document).on("click", ".numbtn", function(){
			//console.log($(this).text());
			getReplyList($(this).text());
		});
		
	</script>
	

</body>
</html>