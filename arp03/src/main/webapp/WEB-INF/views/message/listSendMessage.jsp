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
<h3>받은 쪽지함</h3>




				<table class="table color-table muted-table" border="1">
				
								<thead>
									<tr>
										<th>번호</th>		
										<th>보낸 사람</th>
										<th width="300">제목</th>
										<th>날짜</th>
									
									</tr>
								<thead>
									<c:forEach items="${ mList }" var="m">
										<tr>
											<td>${ m.ms_no }</td>
											<td>${ m.s_no }</td>
											<td><a href="detailMsg.do?ms_no=${m.ms_no}" >${ m.title }</a></td>
											<td>${ m.s_date }</td>
											
										</tr>
									</c:forEach>

								</table>
								<button onclick="location.href='mainMsg.do';">목록으로</button>
</body>

</html>