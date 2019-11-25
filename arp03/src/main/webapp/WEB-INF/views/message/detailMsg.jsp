<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>쪽지 상세보기</h3>
제목 :<label>${m.title}</label><br>
<input type="hidden" value="${ m.g_no }" name="m_no" >
상대 번호 : <label>${m.s_no}</label><br>
내용 : 
<label>
${m.content }
</label>
<br><br>
<button onclick="location.href='listMsg.do';">목록으로</button>


</body>
</html>