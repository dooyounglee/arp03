<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../include/header.jsp"/>
	
	<h1>학생을 강의에 꽂아주기</h1>
	
	선생
	<select id="teacher" name="t" size="10">
		<c:forEach var="t" items="${tlist }">
			<option value="${t.m_no }">${t.name }</option>
		</c:forEach>
	</select>
	
	강의
	<select id="lecture" name="lec" size="10">
	
	</select>
	
	수강중인학생
	<select id="ings" name="s" size="10" multiple>

	</select>
	
	<button onclick="insertStudent()"><<</button>
	<button onclick="removeStudent()">>></button>
	
	다른학생
	<select id="other" name="s" size="10" multiple>

	</select>
	
	
	
	<script>
		$('#teacher').on('click',function(){
			$.ajax({
				url:'tlist.lec',
				type:'post',
				data:{
					m_no:$(this).val(),
				},
				dataType:'json',
				success:function(data){
					$('#lecture').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#lecture').append('<option value="'+data[i].lec_no+'">lec_no='+data[i].lec_no+'</option>')
						}
					}else{
						$('#lecture').html('<option>강의가 없음<option>')
					}
				},
			})
		})
		
		function ingList(lec_no){
			$.ajax({
				url:'inglist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					console.log(data)
					$('#ings').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#ings').append('<option value="'+data[i].m_no+'">m_no='+data[i].m_no+'</option>')
						}
					}else{
						$('#ings').html('<option>없음<option>')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			console.log($('#teacher').val())
			ingList($('#lecture').val())
		})
		
		function otherList(lec_no){
			$.ajax({
				url:'otherlist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					console.log(data)
					$('#other').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#other').append('<option value="'+data[i].m_no+'">m_no='+data[i].m_no+'</option>')
						}
					}else{
						$('#other').html('<option>없음<option>')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			otherList($('#lecture').val())
		})
		
		function insertStudent(){
			console.log("<<성공")
			$.ajax({
				url:'insertStudentToIng.lec',
				type:'post',
				data:{
					m_no:parseInt($('#other').val()),
					lec_no:parseInt($('#lecture').val()),
				},
				success:function(data){
					console.log("<<성공")
					ingList($('#lecture').val())
					otherList($('#lecture').val())
				},
			})
		}
		function removeStudent(){
			console.log(">>성공")
			$.ajax({
				url:'insertStudentToOther.lec',
				type:'post',
				data:{
					m_no:parseInt($('#ings').val()),
					lec_no:parseInt($('#lecture').val()),
				},
				success:function(data){
					console.log(">>성공")
					ingList($('#lecture').val())
					otherList($('#lecture').val())
				},
			})
		}
	</script>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>