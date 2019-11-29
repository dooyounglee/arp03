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
                                                <th>받은사람</th>
                                                <th>제목</th>
                                                <th>날짜</th>
                                                <th>수신확인</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${ mList }" var="m">
                                        		<tr>
	                                        			<td>${ m.ms_no }</td>
														<td>${ m.name }</td>
														<td width="300"><a href="detailMsg.do?ms_no=${m.ms_no}">${ m.title }</a></td>
														<td>${ m.s_date }</td>
														<c:if test="${m.r_date eq null}">
														<td>읽지않음</td>
														</c:if>
														<c:if test="${m.r_date ne null}">
														<td>읽음</td>
														</c:if>
													
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>


</body>

</html>