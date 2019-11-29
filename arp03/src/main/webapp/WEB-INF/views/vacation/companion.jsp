<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려</title>
</head>
<body>

<form action="cReason.te" >
	<input type="hidden" name = "v_no" value="${vd.v_no }">
	<input type="hidden" name ="lec_no" value="${vd.lec_no }">
	<h2 align="center"> 반려이유</h2>
	<textarea name ="companion_reason" cols=100 rows=10 placeholder ="이유를 적어주세요"></textarea> 
	<button type="submit">반려</button>
</form>

</body>
</html>