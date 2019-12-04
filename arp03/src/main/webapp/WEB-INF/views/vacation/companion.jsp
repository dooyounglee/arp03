<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려</title>
<%@ include file="../include/bhead.jsp"%>
</head>
<body>

<form action="cReason.te"  class="form-horizontal" name="content_form" method="post">
	<input type="hidden" name = "v_no" value="${vd.v_no }">
	<input type="hidden" name ="lec_no" value="${vd.lec_no }">
	<input type="hidden" name ="vacation_date" value="${vd.vacation_date }">
	<h2 align="center"> 반려이유</h2>
	<textarea name ="companion_reason" cols=92 rows=9 placeholder ="이유를 적어주세요"></textarea> 
	<button type="submit" onClick="checkForm()" class="btn btn-warning" onsubmit="return true;">반려</button>
</form>

</body>
<script>

function checkForm(){ 
	
	alert("처리하였습니다.");
    document.content_form.target="_parent"; 

    document.content_form.submit(); 

} 




</script>
</html>