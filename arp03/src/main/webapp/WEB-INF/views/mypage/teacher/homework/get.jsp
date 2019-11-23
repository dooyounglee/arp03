<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
      });
    </script>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<body>
${hw }<br>
<c:forEach var="p" items="${plist }" varStatus="i">
	${p }<br>
	<c:if test="${empty alist || alist.size()==0 }">
	답:<input data-p_no="${p.p_no }"><br>
	</c:if>
	<c:if test="${alist.size()>0 }">
	답:${alist[i.index].answer }<br>
	정답:${p.solution }<br>
	정답?:${alist[i.index].ox }
	</c:if>
	<br>
</c:forEach>

	<c:if test="${empty alist || alist.size()==0 }">
	<button onclick="ok()">제출</button>
	</c:if>
	<c:if test="${alist.size()>0 }">
	<a href="homeworklist.lec">목록</a>
	</c:if>

<script>
	function ok(){
		$('input').each(function(index,value){
			var p_no=$(value).data('p_no')
			var hw_no=${hw.hw_no}
			
			$.ajax({
				url:'submitAnswer.hw',
				type:'post',
				data:{
					p_no:p_no,
					hw_no:hw_no,
					answer:$(value).val(),
				},
				success:function(data){
					
				},
			})
		})
		alert("제출완료")
		location.href="homeworklist.lec"
	}
</script>
</body>
</html>