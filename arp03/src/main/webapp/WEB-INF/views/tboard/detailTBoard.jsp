<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] list = request.getParameterValues("bfList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center">
	<tr>
			<td colspan="2" align="right">
				<c:if test="${ mem.m_no eq b.m_no }">
					<a href="tbupdateView.do?b_no=${ b.b_no }">수정하기</a>
					<a href="tbdelete.do?b_no=${ b.b_no }">삭제하기</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">${ b.b_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ b.title }</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<td>${ b.m_no }</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>${ b.content }</td>		
		</tr>
		<tr>
			<td>첨부파일</td>
			<td >
				<c:if test="${ !empty bfList}">
				<c:forEach items="${ bfList }" var="bl">
					<a href="${ pageContext.servletContext.contextPath }/resources/tbuploadFiles/${bl.rename_filename}" download="${ bl.original_filename }">${ bl.original_filename }</a>
					<br>
				
				</c:forEach>
				
				</c:if>
			</td>		
		</tr>
		
	</table>
	<button type="button" onclick="location.href='tblist.do';">목록으로</button>
	
	<br><br>
	
		<table align="center" width="600" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td><button id="rBtn">등록하기</button></td>
		</tr>
	</table>
	
	<!-- 댓글 목록 부분 -->	
	<table align="center" width="600" border="1" cellspacing="0" id="rtb">
		<thead>
			<tr>
				<td colspan="3"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<script>
		$(function(){
			getReplyList();
			
	
		// 댓글등록하기 버튼 
		$("#rBtn").on("click", function(){
				var content = $("#rContent").val();
				var b_no= ${b.b_no};
				var m_no = ${mem.m_no}; 
				console.log(content);
				console.log(b_no);
				console.log(m_no);
				
				$.ajax({
					url:"trinsert.do",
					data:{content:content,
						  b_no:b_no,
						  m_no:m_no},
			        success:function(data){
			        	
			    		if(data == "success"){
			    			getReplyList();
							$("#rContent").val("");
						}else{
							alert("댓글 작성 실패");
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
		
		// 수정버튼을 눌렀을때
		$(document).on("click",".upBtn",function(){
			
			console.log("44");
			console.log($(this).parent().parent().children(".content").text());
			console.log($(this).parent().parent().children())
			// content자리가 textarea로 변경되게 
			 var upContent=$(this).parent().parent().children(".content");	
			 var contentText= upContent.text();
			 
		 	upContent.replaceWith( '<textarea id="upcontent">'+contentText+'</textarea>' );
		 	
		 	var delNo =$(this).parent().parent().children(".delBtn");
		 	// 삭제버튼, 수	정버튼 안보이고 등록버튼 보임
		 	delNo.hide(); // 삭제버튼
		 	$(this).hide(); // 수정버튼
			$(this).parent().parent().children("#subBtn").show();		// 등록버튼	
		 	$(this).parent().parent().children("#reBtn").hide();	// 답글버튼
		 				
		});
		
		// 등록버튼 눌렀을때
		$(document).on("click",".subBtn", function(){
			
			var updateContent =	$(this).parent().parent().children("#upcontent");
			
			console.log(updateContent);
			
			$(this).parent().hide(); // 등록버튼 td삭제
		 	$(".upBtn").show();		 // 수정버튼
		 	$(this).parent().parent().children(".delBtn").show(); // 삭제버튼
			
		 	var r_no = $(this).parent().parent().children("#r_no").val();
		 	console.log("r_no"+r_no);
		 	
		 	$.ajax({
				url:"tbReplyUpdate.do",
				data:{b_no:${b.b_no},
					  r_no:r_no,
					  content:updateContent.val()
					},
				success:function(data){
				if(data=="success"){
					
					console.log("성공")
					getReplyList();
					
					/* updateContent.replaceWith("<td >"+updateContent.val()+"</td>"); */
					
				
				}else{
					console.log("댓글수정실패");
				}
				},error:function(){
					console.log("수정 ajax 통신 실패");
				}
					
			}); 
		});
		
		
		
		// 답글버튼 눌렀을때 
		$(document).on("click",".re",function(){
			
			/* var updateContent =	$(this).parent().parent().children("#upcontent"); */
			var updateContent = $(this).parent().parent().children(".content");
			var name = $(this).parent().parent().children(".name").text();
			console.log(name);
			updateContent.parent().after("<tr><td>┖></td><td><textarea></textarea></td><td><button class='resubBtn'>등록</button></td></tr>");
			
			
		});
		
		// 대댓글 등록 버튼 눌렀을때 
		$(document).on("click",".resubBtn", function(){
			
			var r_no = $(this).parent().parent().prev().children("#r_no").val();
			console.log("r_no"+r_no);
			var content = $(this).parent().prev().children().val();  /********************/
			console.log(content);
			
			
			
			  $.ajax({
				url:"reReplyInsert.do",
				data:{parent_no: r_no,
					  content:content,
					  b_no:${b.b_no},
					  m_no:${mem.m_no}},
					  success:function(data){
						  
						  if(data=="success"){
							  
							  getReplyList();
							} else {
								alert("댓글 작성에 실패했습니다");
							}
						}, error:function(){
							console.log("ajax 통신 실패");
						}	
						  
				});	
		
		});
		
		
		 
	/* 	 // 대댓글 삭제 버튼을 눌렀을때
		 $(document).on("click",".delReBtn", function(){
			 
			 $.ajax({
				 url:"deleteRe.do",
				 data:{r_no:r_no,
					   b_no:${b.b_no},
					   parent_no: r_no,
					   success:function(data){
							  
							  if(data=="success"){
								  
								  getReplyList();
								} else {
									alert("댓글 삭제에 실패했습니다");
								}
							}, error:function(){
								console.log("ajax 통신 실패");
							}	
					   
					 }
		
			 });
		 
		 }); */
		 
		 

		 // 댓글 삭제버튼 눌렀을때
		 $(document).on("click",".delBtn", function(){
			 var r_no = $(this).parent().parent().children("#r_no").val();
			 var depth = $(this).parent().parent().children(".depth").val();
		
			 		 console.log(r_no);
					 console.log(depth);
				
					 
					 $.ajax({
						 url:"deleteBtn.do",
						 data:{r_no:r_no,
							   depth:depth},
							   success:function(data){
									  
									  if(data=="success"){
										  
										  getReplyList();
										} else {
											alert("댓글 삭제에 실패했습니다");
										}
									}, error:function(){
										console.log("ajax 통신 실패");
									}
							   
						
								
						 
					 });
				 
				 
		 });
			 
		
		

	/* 	// 제목을 눌렀을때 대댓글
		$contentTd.hover(function() {
			console.log($(this).parent().text());
			  $(this).css("color", "blue");
			}, function(){
			  $(this).css("color", "black");
			});
		$contentTd.on("click", function(){
			
			$(this).parent().after("<tr><td>"+r_no+"</td><td><textarea></textarea></td></tr>");
			})
		
			
		});	 */
	
	function getReplyList(){
			
			$.ajax({
				url:"treplyList.do",
				data:{b_no:${b.b_no}},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tbody = $("#rtb tbody");	
					$tbody.html("");
					
					$("#rCount").text("댓글(" + data.length + ")");
					
					if(data.length > 0){ // 댓글이 존재할 경우
						
						// 반복문을 통해서 한 행씩 추가될 수 있도록
						$.each(data, function(index, value){ // value == data[index]
							// 작성자 내용 작성일
							$tr = $("<tr></tr>");
							
							$writerTd = $("<td width='100' class='name'></td>").text(value.name);
							$writerReTd = $("<td>┖>"+"  "+value.name+"</td>");
							$contentTd = $("<td class='content'></td>").text(value.content);
							$dateTd = $("<td></td>").text(value.regdate);
							$upBtn = $("<td><button class='upBtn'>수정</button></td>");
							$delBtn = $("<td><button class='delBtn'>삭제</button></td>");
							$upForm =$("<textarea></textarea>");
							$subBtn = $("<td id='subBtn'><button class='subBtn'>등록</button></td>");
							$r_no = $("<input type='hidden' id='r_no' class='r_no'>").val(value.r_no);
							$depth = $("<input type='hidden' class='depth'>").val(value.depth);
							$reBtn = $("<td id='reBtn'><button class='re'>답글</button></td>");
							$delString = $("<td>삭제된 댓글입니다.</td>");
							$parent_no = $("<input type='hidden'  class='parent_no'>").val(value.parent_no);
							
						
							
						
							if(value.depth == 1){				// 댓글
								$tr.append($writerTd);
								
								var status = value.status;
								if(status == "N"){			//삭제된 댓글일때
								$tr.append($delString);
								}else{											
							
									$tr.append($contentTd);
								}
							}else{
								
								$tr.append($writerReTd);
								$tr.append($contentTd);
							
							}
							$tr.append($dateTd);
							if(${mem.m_no} == value.m_no){
								$tr.append($upBtn);
								$tr.append($delBtn);
							}
							
							$tr.append($subBtn);
							$tr.append($depth);
							$tr.append($r_no);
							if(value.depth == 1){
								$tr.append($reBtn);
							}
							$tr.append($parent_no);
			
							
							$subBtn.hide(); 
							
							$tbody.append($tr);
				
							
						});
				
			
							
						}else{ // 댓글이 존재하지 않을 경우
						
						$tr = $("<tr></tr>");
						
						$contentTd = $("<td colspan='3'></td>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
	}  
		
		});
		
			
	 
	</script>
	

</body>
</html>