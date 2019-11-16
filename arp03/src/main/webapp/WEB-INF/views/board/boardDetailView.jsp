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
	<table align="center" width="600" border="1" cellspacing="0" id="rtb">
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

			$(document).on("click", "#rr", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				$parent_no = $(this).parent().parent().children().eq(0).text();
				
				$("#rtb tbody:last").append("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button id='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
			});
			
			$(document).on("click", "#rrsb", function(){
				//console.log($("#reContent").val());
				//console.log($parent_no);
				
				$.ajax({
					url:"reinsert.do",
					data:{content:$("#reContent").val(), b_no:${b.b_no}, m_no:${mem.m_no}, parent_no:$parent_no},
					success:function(data){
						if(data == "success") {
							getReplyList();
						} else {
							alert("댓글 작성에 실패했습니당");
						}
					}, error:function(){
						console.log("ajax 통신 실패");
					}	
				
				});
			});
			
			$(document).on("click", "#del", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				var $r_no = $(this).parent().parent().children().eq(0).text();
				//console.log($td1.eq(0).text());
							
				$.ajax({
					url:"deleteReply.do",
					data:{r_no:$r_no},
					success:function(data){
						//console.log("삭제 성공");
						getReplyList();
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				});
			});
			
			$(document).on("click", "#alt", function(){
				//console.log("수정ㄱㄱ");
				var $content = $(this).parent().parent().children().eq(1);
				var $btns = $(this).parent().parent().children().eq(3);
				
				var $reContent = $("<textarea cols='30' name='reContent' id='reContent'>" + $content.text() + "</textarea>");
				
				$content.replaceWith($reContent);
				$("#reContent").focus();
				
				var $reBtns = $('<input type="button" id="alert" value="등록"/>' + '<input type="button" class="cancel" value="취소"/>');
				
				/* $reBtns += $submit;
				$reBtns += $cancel; */
				
				$btns.replaceWith($reBtns);
				
			});
			
			$(document).on("click", "#alert", function(){
				
				var $r_no = $(this).parent().children().eq(0).text();
				/* console.log($r_no);
				console.log($("#reContent").val()); */
				
				$.ajax({
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
			
			$(document).on("click", ".cancel", function(){
				getReplyList();
			});
			
		
		});
		
		function getReplyList(){
			$.ajax({
				url:"replyList.do",
				data:{b_no:${b.b_no}},
				dataType:"json",
				success:function(data){
					console.log(data);
					$tbody = $("#rtb tbody");
					$tbody.html("");
					
					$("#rCount").text("댓글(" + data.length + ")");
					
					if(data.length > 0){ // 댓글이 존재할 경우
						$.each(data, function(index, value) { // value == data[index]
							// 작성자 내용 작성일
						$tr = $("<tr>");
						$td = $("<td>");
						
						$rnoTd = $("<td>").text(value.r_no);
						$rrnoTd = $("<td>").text("ㄴ");
							
						$contentTd = $("<td width='250'>").text(value.content);
						$dateTd = $("<td>").text(value.update_date);
						
						$rreply = $('<input type="button" id="rr" value="re"/>');
						$altB = $('<input type="button" id="alt" value="alt"/>');
						$deleteB = $('<input type="button" id="del" value="del"/>');
						
						if(value.status == 'N') {
							$rnoTd = $("<td>").text("");
							$contentTd = $("<td width='250'>").text("사용자가 삭제한 댓글입니다.");
							$dateTd = $("<td>").text("");
						}
						
						if(value.depth == 1) {
							$tr.append($rnoTd);
						} else {
							$tr.append($rrnoTd);
						}
						
						$tr.append($contentTd);
						$tr.append($dateTd);
						
						
						if(value.depth == 1 && value.status == 'Y') {
							$tr.append($td.append($rreply));
						}
						
						if(value.m_no == ${mem.m_no} && value.status == 'Y') {
							$tr.append($td.append($altB));
							$tr.append($td.append($deleteB));
						}
						
						$tbody.append($tr);
							
						});
					} else {
						$tr = $("<tr>");
						
						$contentTd = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
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