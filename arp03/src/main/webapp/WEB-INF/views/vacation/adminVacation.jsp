<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">학생 휴가 리스트 </h1>
<jsp:include page= "../include/header.jsp"/>



<table align="center" border="1" cellspacing="0" width="700"> 
<tr>
	<th><input type="checkbox" id="checkbox">체크</th>
	<th>휴가번호</th>
	<th>강의번호</th>
	<th>학생명</th>
	<th >강의명</th>
	<th >제목</th>
	<th>휴가시작일</th>
	<th>휴가끝나는일</th>
	<th>일수</th>
	<th >선생님</th>
	

</tr>

<c:forEach items="${ list }" var="v">
	<c:if test = "${v.tstatus ne 'N' and v.astatus ne 'Y'}">
		<tr>
			<td><input type="checkbox" id ="vl" class="check" name="vacationList" value="${ v.v_no }"></td>
			<td>${ v.v_no }</td>
			<td>${ v.lec_no }</td>
			<td>${v.name }</td>
			<td>${ v.title }</td>
			<td><a href="vDetail.me?v_no=${ v.v_no }">${ v.vacation_title }</a></td>
				<td id="endDate"></td>
			<td>${v.tstatus }</td>
			
			
		</tr>
		</c:if>
</c:forEach>
</table>


	<button type="submit" id ="submit" style="display:none">일괄처리하기</button>
	
	<button type="submit" id ="submit2" style="display:none">처리하기</button>

<script>
<%--
$( document ).ready( function() {
  $( '.check-all' ).click( function() {
    $( '.ab' ).prop( 'checked', this.checked );
  } );
} );
--%>





$(function(){

	var Multicheck =[];
	// 하나 혹은 다중선택 처리
	
	
	
	$(".check").click(function() {
		$("input[name=vacationList]:checked").each(function() {

			if($(this).prop("checked")){
				$("#submit2").show();
			}else{
				$("#submit2").hide();
			}

			var test = $(this).val();
			// alert(test);
			console.log(test); 
			Multicheck.push(test);
			
		});

	});
	
	var objectMulti = {
		"MultiList" : Multicheck
	}
	
	$("#submit2").click(function(){
		
		$.ajax({
			
			url:"multiPermission.ad",
			dataType:"json",
			type:"post",
			data:objectMulti,
			success: function(data){
				
				if(data==1){
					alert("수정완료");
					location.href="sVlist.ad";
				}else{
					alert("실패");
				}
			},
			error: function(){
				console.log("에러");
			}
			
			
		});
		
	});
	
	
	
	//-----------------------------------------------------------------------------------
	// 전체 처리
	var checkVno =[];
	
	 $("#checkbox").click(function(){ 
		 if($("#checkbox").prop("checked")){ 
			 $("input[name=vacationList]").prop("checked",true);
			 
		}else{
			$("input[name=vacationList]").prop("checked",false); 
	
		} 	
		 
		 
		 $("input[name=vacationList]:checked").each(function(){
				console.log($(this).val());
				checkVno.push($(this).val());
				
				if($(this).prop("checked")){
					$("#submit").show();
				}
			});
		 
	 });
	 
	 var objParam = {
		 "checkList" : checkVno
	 }
	 
	 
	 $("#submit").on("click" , function(){
		 
		 
	 $.ajax({
		 url : "permission.ad",
		 dataType : "json",
		 type : "post",
		 data : objParam,
		 success: function(data){
			 if(data== 1){
				 
			 alert("수정완료");
			 location.href="sVlist.ad";
			 }else{
				 alert("실패");
			 }
		 },
	 	 error: function(){
	 		 console.log("오류");
	 	 }
	 });
	 
});
});
</script>



</body>
</html>