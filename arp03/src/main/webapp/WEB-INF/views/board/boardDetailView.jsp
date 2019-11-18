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
	<table align="center" width="600" border="1" cellspacing="0" id="rtb" class="paginated">
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
			
			$clicked = 0;

			$(document).on("click", ".rr", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				$parent_no = $(this).parent().parent().children("#hrno").val();
				
				//$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
				
				if($clicked%2 == 0) {
					$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
				} else {
					$(this).parent().parent().next().remove();
				}
				//console.log($clicked);
				$clicked++;
				//console.log($clicked);
			});
			
			$(document).on("click", ".rrsb", function(){
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
			
			$(document).on("click", ".del", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				//var $r_no = $(this).parent().parent().children().eq(0).text();
				//console.log($td1.eq(0).text());
				var $r_no = $(this).parent().parent().children("#hrno").val();
							
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
			
			$(document).on("click", ".alt", function(){
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
				
				//var $r_no = $(this).parent().children().eq(0).text();
				/* console.log($r_no);
				console.log($("#reContent").val()); */
				var $r_no = $(this).parent().children("#hrno").val();
				
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
			$clicked = 0;
			$.ajax({
				url:"replyList.do",
				data:{b_no:${b.b_no}},
				dataType:"json",
				success:function(data){
					//console.log(data);
					$tbody = $("#rtb tbody");
					$tbody.html("");
					
					//$("#rCount").text("댓글(" + data.length + ")");
					$rcount = 0;
					
					if(data.length > 0){ // 댓글이 존재할 경우
						$.each(data, function(index, value) { // value == data[index]
						
						$tr = $("<tr>");
						$td = $("<td>");
						
						//$rnoTd = $("<td>").text(value.r_no);
						$rrnoTd = $("<td>").text("ㄴ");
							
						$contentTd = $("<td width='250'>").text(value.content);
						$dateTd = $("<td>").text(value.update_date);
						
						$rreply = $('<input type="button" class="rr" value="re"/>');
						$altB = $('<input type="button" class="alt" value="alt"/>');
						$deleteB = $('<input type="button" class="del" value="del"/>');
						$hrno = $('<input type="hidden" id="hrno" value="' + value.r_no + '"/>');
						
						if(value.depth == 1) {
							$contentTd = $("<td colspan='2' width='250'>").text(value.content);
						} else {
							$tr.append($rrnoTd);
						}
						
						if(value.status == 'N') {
							//$rnoTd = $("<td>").text("");
							$contentTd = $("<td colspan='2'>").text("사용자가 삭제한 댓글입니다.");
							$dateTd = $("<td>").text("");
							$rcount = $rcount + 1;
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
						
						$tr.append($hrno);
						$tbody.append($tr);
						
						});
					
						page();
					} else {
						$tr = $("<tr>");
						
						$contentTd = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					//console.log($rcount);
					$("#rCount").text("댓글(" + (data.length - $rcount) + ")");
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function page(){ 
				var reSortColors = function($table) {
				  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
				  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
				 };
				 $('table.paginated').each(function() {
				  var pagesu = 10;  //페이지 번호 갯수
				  var currentPage = 0;
				  var numPerPage = 10;  //목록의 수
				  var $table = $(this);    
				  
				  //length로 원래 리스트의 전체길이구함
				  var numRows = $table.find('tbody tr').length;
				  //Math.ceil를 이용하여 반올림
				  var numPages = Math.ceil(numRows / numPerPage);
				  //리스트가 없으면 종료
				  if (numPages==0) return;
				  //pager라는 클래스의 div엘리먼트 작성
				  var $pager = $('<td align="center" id="remo" colspan="4"><div class="pager"></div></td>');
				  
				  var nowp = currentPage;
				  var endp = nowp+10;
				  
				  //페이지를 클릭하면 다시 셋팅
				  $table.on('repaginate', function() {
				  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
				  
				   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				   $("#remo").html("");
				   
				   if (numPages > 1) {     // 한페이지 이상이면
				    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
				     nowp = 0;     // 1부터 
				     endp = pagesu;    // 10까지
				    }else{
				     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
				     endp = nowp+pagesu;   // 10까지
				     pi = 1;
				    }
				    
				    if (numPages < endp) {   // 10페이지가 안되면
				     endp = numPages;   // 마지막페이지를 갯수 만큼
				     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
				    }
				    if (nowp < 1) {     // 시작이 음수 or 0 이면
				     nowp = 0;     // 1페이지부터 시작
				    }
				   }else{       // 한페이지 이하이면
				    nowp = 0;      // 한번만 페이징 생성
				    endp = numPages;
				   }
				   // [처음]
				   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').on('click', {newPage: page},function(event) {
				          currentPage = 0;   
				          $table.trigger('repaginate');  
				          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
				      }).appendTo($pager).addClass('clickable');
				    // [이전]
				      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').on('click', {newPage: page},function(event) {
				          if(currentPage == 0) return; 
				          currentPage = currentPage-1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				    // [1,2,3,4,5,6,7,8]
				   for (var page = nowp ; page < endp; page++) {
				    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
				     currentPage = event.data['newPage'];
				     $table.trigger('repaginate');
				     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				     }).appendTo($pager).addClass('clickable');
				   } 
				    // [다음]
				      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').on('click', {newPage: page},function(event) {
				    if(currentPage == numPages-1) return;
				        currentPage = currentPage+1;
				    $table.trigger('repaginate'); 
				     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				    // [끝]
				   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').on('click', {newPage: page},function(event) {
				           currentPage = numPages-1;
				           $table.trigger('repaginate');
				           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				     
				     $($(".page-number")[2]).addClass('active');
				reSortColors($table);
				  });
				   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
				   $pager.appendTo($table);
				   $table.trigger('repaginate');
				 });

		}
	</script>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>