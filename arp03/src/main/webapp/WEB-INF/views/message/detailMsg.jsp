<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/bhead.jsp"%>
<head>
<style>
	.col-lg-8{
	margin-left:auto;
	margin-right:auto;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-8">
			<div class="card">
				<div class="card-body">
				 <h3 class="card-title mb-0">${m.title}</h3>
				   <div>
                       <hr class="mt-0">
                   </div>
				 <input type="hidden" value="${ m.g_no }" name="m_no" >
				 <h5 >From: ${m.s_no}</h5>
				 <h5>${m.content }</h5>
				</div>
			</div>
		</div>
	</div>
	<%-- <h3>쪽지 상세보기</h3>
제목 :<label>${m.title}</label><br>
<input type="hidden" value="${ m.g_no }" name="m_no" >
상대 번호 : <label>${m.s_no}</label><br>
내용 : 
<label>
${m.content }
</label>
<br><br> --%>



</body>
</html>