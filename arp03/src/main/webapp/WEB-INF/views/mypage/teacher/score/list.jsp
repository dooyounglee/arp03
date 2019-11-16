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
	<jsp:include page="../../../include/header.jsp"/>
	<h1>성적</h1>

	<table border=1>
		<thead>
			<tr>
				<th></th>
				<c:forEach var="e" items="${elist }">
					<th width="100px">${e.title }</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${mlist }">
				<tr>
					<td>${m.m_no }</td>
					<c:forEach var="e" items="${elist }">
						
						<!-- score선택 -->
						<%-- <c:set var="loop_flag" value="false" /> --%>
						<c:set var="score" value=""/>
						<c:forEach var="s" items="${slist }">
							<%-- <c:if test="${not loop_flag }"> --%>
								<c:if test="${s.m_no eq m.m_no && s.e_no eq e.e_no }">
									<c:set var="score" value="${s.score }"/>
									<%-- <c:set var="loop_flag" value="true" /> --%>
								</c:if>
							<%-- </c:if> --%>
						</c:forEach>
						
						<td>
							<input style="width:100px" data-e_no="${e.e_no }" data-m_no="${m.m_no }" value="${score }">
						</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
		$('table input').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			if(score=="")return;
			
			$.ajax({
				url:'insert.sc',
				type:'post',
				data:{
					e_no:$(this_).data('e_no'),
					m_no:$(this_).data('m_no'),
					score:$(this_).val(),
				},
				success:function(data){
					
				},
			})
		})
	</script>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>