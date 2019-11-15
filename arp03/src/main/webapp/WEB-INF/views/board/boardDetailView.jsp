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
			<td colspan="2" align="center">${ b.b_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ b.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${ b.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="">신고</button>
				<c:if test="${ mem.m_no eq b.m_no }">
					<button type="button" onclick="location.href='bupdateView.do?id=${b.b_no}';">수정</button>
					<button type="button" onclick="location.href='bdelete.do?id=${b.b_no}';">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<!-- 댓글 등록 부분 -->
	<table align="center" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td><button id="rBtn">등록</button></td>
		</tr>
	</table>
	<!-- 댓글 목록 부분 -->
	<table align="center" width="500" border="1" cellspacing="0" id="rtb">
		<thead>
			<tr>
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		$(function(){
			getReplyList();
			
			$("#rBtn").on("click", function(){
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
			
			$(document).one("click", "#rr", function(){
				console.log($(this).parent().parent().next());
				$("#rtb tbody:last").append("<tr><td colspan='3'><textarea cols='50' rows='3' id='reContent'></textarea></td><td><button>등록</button></td></tr>")
			});
			
		});
		
		function getReplyList(){
			$.ajax({
				url:"replyList.do",
				data:{b_no:${b.b_no}},
				dataType:"json",
				success:function(data){
					//console.log(data);
					$tbody = $("#rtb tbody");
					$tbody.html("");
					
					$("#rCount").text("댓글(" + data.length + ")");
					
					if(data.length > 0){ // 댓글이 존재할 경우
						$.each(data, function(index, value) { // value == data[index]
							// 작성자 내용 작성일
						$tr = $("<tr>");
						$td = $("<td>");
						
						$writerTd = $("<td>").text("익명");
						$contentTd = $("<td width='250'>").text(value.content);
						$dateTd = $("<td>").text(value.regdate);
						
						$rreply= $('<input type="button" id="rr" value="대댓"/>');
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$tr.append($td.append($rreply));
						
						$tbody.append($tr);
							
						});
					} else {
						$tr = $("<tr>");
						
						$contentTd = $("<td colspan='4'>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>