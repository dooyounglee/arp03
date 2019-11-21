<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			console.log($(this).parent().parent().children().eq(1).text());
			// content자리가 textarea로 변경되게 
			 var upContent=$(this).parent().parent().children().eq(1);	
			 var contentText= upContent.text();
			 
		 	upContent.replaceWith( '<textarea>'+contentText+'</textarea>' );
		 	
		 	var delNo =$(this).parent().parent().children().eq(4);
		 	// 삭제버튼, 수	정버튼 안보이고 등록버튼 보임
		 	delNo.hide();
		 	$(this).hide();
		 	$(this).parent().parent().children().eq(5).show();							
		});
		
		// 등록버튼 눌렀을때
		$(document).on("click",".subBtn", function(){
			
			var updateContent =	$(this).parent().parent().children().eq(1);
			
			console.log($(this).parent().parent().children().eq(3));
			
			$(this).parent().hide();
		 	$(".upBtn").show();
		 	$(this).parent().parent().children().eq(4).show();
			
		 	var r_no = $(this).parent().parent().children().eq(6).val();
		 	console.log(r_no);
		 	
		 	$.ajax({
				url:"tbReplyUpdate.do",
				data:{b_no:${b.b_no},
					  r_no:r_no,
					  content:updateContent.val()
					},
				success:function(data){
					
	
				
				if(data=="success"){
					
					
					updateContent.replaceWith("<td >"+updateContent.val()+"</td>");
					
				
				}else{
					console.log("댓글수정실패");
				}
				},error:function(){
					console.log("수정 ajax 통신 실패");
				}
					
			}); 
		});
		
		$(document).on("click",".re",function(){
			
			var updateContent =	$(this).parent().parent().children().eq(1);
			updateContent.parent().after("<tr><td>┖></td><td><textarea></textarea></td><td><button class='resubBtn'>등록</button></td></tr>");
			
			
		});
		
		// 대댓글 등록버튼을 누르면 
		 $(document).on("click",".resubBtn", function(){
			 $.ajax
		 })
		

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
							
							$writerTd = $("<td width='50'></td>").text(value.m_no);
							$contentTd = $("<td></td>").text(value.content);
							$dateTd = $("<td></td>").text(value.regdate);
							$upBtn = $("<td><button class='upBtn'>수정</button></td>");
							$delBtn = $("<td><button>삭제</button></td>");
							$upForm =$("<textarea></textarea>");
							$subBtn = $("<td><button class='subBtn'>등록</button></td>");
							$r_no = $("<input type='hidden' class='r_no'>").val(value.r_no);
							$reBtn = $("<td><button class='re'>답글</button></td>");
							
							
					
						
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($upBtn);
							$tr.append($delBtn);
							$tr.append($subBtn);
							$tr.append($r_no);
							$tr.append($reBtn);
			
							
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