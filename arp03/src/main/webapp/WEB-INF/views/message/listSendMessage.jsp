<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




						 <div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>번호</th>		
										<th>보낸 사람</th>
										<th width="300">제목</th>
										<th>날짜</th>
										<th>확인여부</th>
									
									</tr>
								<thead>
									<c:forEach items="${ mList }" var="m">
										<tr>
											<td>${ m.ms_no }</td>
											<td>${ m.name }</td>
											<td><a href="detailMsg.do?ms_no=${m.ms_no}" >${ m.title }</a></td>
											<td>${ m.s_date }</td>
											<c:if test="${m.read_status eq 'N'}">
											<td>읽지않음</td>
											</c:if>
											<c:if test="${m.read_status eq 'Y'}">
											<td>읽음</td>
											</c:if>
								
											
										</tr>
									</c:forEach>

								</table>
						
</body>

</html>