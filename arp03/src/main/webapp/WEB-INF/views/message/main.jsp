<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<meta charset="UTF-8">
<title>나의 쪽지함</title>
</head>
<body>
<h3>나의 쪽지함</h3>
<button type="submit" onclick="location.href='sendMsgFrom.do';">쪽지보내기</button>
<a href="listMsg.do" id="sMsg">보낸 쪽지</a>
<a href="listSendMsg.do" id="gMsg">받은 쪽지</a>

</body>
</html>