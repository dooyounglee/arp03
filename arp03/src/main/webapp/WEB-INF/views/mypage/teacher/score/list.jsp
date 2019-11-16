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
${slist[3] }
	<table border=1>
		<thead>
			<tr>
				<th></th>
				<c:forEach var="e" items="${elist }">
					<th width="100px">${e.title }</th>
				</c:forEach>
				<th>총합</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${mlist }">
				<tr>
					<td>${m.m_no }</td>
					
					<c:set var="sum" value="0"/>
					<c:forEach var="e" items="${elist }">
						
						<!-- score선택 -->
						<c:set var="loop_flag" value="false" />
						<c:set var="score" value=""/>
						<c:forEach var="s" items="${slist }">
							<c:if test="${not loop_flag }">
								<c:if test="${s.m_no eq m.m_no && s.e_no eq e.e_no }">
									<c:set var="score" value="${s.score }"/>
									<c:set var="sum" value="${sum+score }"/>
									<c:set var="loop_flag" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
						<!-- End of score선택 -->
						
						<td>
							<c:if test="${score eq 0 }">
								<c:set var="score" value=""/>
							</c:if>
							<input style="width:100px" data-e_no="${e.e_no }" data-m_no="${m.m_no }" value="${score }">
						</td>
					</c:forEach>
						<td class=sum>${sum }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
		//합
		$('table input').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			if(isNaN(score) || score==""){
				score=0;
			}
	
			//총점
			var tds=this_.closest('tr').children('td')
			var sum_=this_.closest('tr').children('td.sum')
			var sum=0;
			for(i=1;i<tds.length-1;i++){
				var n=$(tds).eq(i).children().eq(0).val()
				if(n=='')n=0;
				sum+=parseInt(n)
			}
			$(sum_).text(sum)
			
		})
		
		$('table input').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			if(isNaN(score) || score==""){
				score=0;
			}
			
			//db저장
			$.ajax({
				url:'insert.sc',
				type:'post',
				data:{
					e_no:$(this_).data('e_no'),
					m_no:$(this_).data('m_no'),
					score:score,
				},
				success:function(data){
					
				},
			})
		})
	</script>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>