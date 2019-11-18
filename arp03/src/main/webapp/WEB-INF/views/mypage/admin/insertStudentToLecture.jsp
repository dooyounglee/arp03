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
	<form action="addStudentToLecture.ad" method="post" autocomplete=off>
		학생
		<select id="student" name="s" size="10" multiple>
			<c:forEach var="s" items="${mlist }">
				<option value="${s.m_no }">${s.name }</option>
			</c:forEach>
		</select>
		
		선생
		<select id="teacher" name="t" size="10">
			<c:forEach var="t" items="${tlist }">
				<option value="${t.m_no }">${t.name }</option>
			</c:forEach>
		</select>
		
		강의
		<select id="lecture" name="lec" size="10">
		
		</select>
		<button>등록</button>
	</form>
	
	<script>
		$('#teacher').on('change',function(){
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
						$('#lecture').append('<option>강의가 없음<option>')
					}
				},
			})
		})
		
	</script>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>