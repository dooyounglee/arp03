<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Message</title>
</head>
<body>
<form action="insertMsg.do">
<h3>쪽지보내기</h3>
제목 : <input type="text" name="title"><br>
<input type="hidden" value="${ mem.m_no }" name="s_no">
받는사람 : <input type="text" name="g_no"><br>
<textarea rows="3" cols="50" name="content">
</textarea>

<button type="submit">보내기</button>
</form>

</body>
</html>