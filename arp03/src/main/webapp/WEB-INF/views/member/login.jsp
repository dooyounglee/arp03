<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="login.me" method="post" autocomplete=off>
		id:<input name="id" id="id"><br>
		pw:<input name="pw" id="pass"><button>로그인</button><br>
		<input type="checkbox" name="remember">자동로그인 | <input type="checkbox" id="idSaveCheck"> 아이디/비번 기억하기<br>
	</form>
	
	<script>
	$("#id").val(Cookies.get('id'));      
	$("#pass").val(Cookies.get('pass'));      
    if($("#id").val() != ""){
        $("#idSaveCheck").attr("checked", true);
    }
    
    $("#idSaveCheck").change(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }else{
              Cookies.remove('id');
              Cookies.remove('pass');
        }
    });
    
    $("#id,#pass").keyup(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }
    });
	</script>
	
	
	<table border=1>
		<tr>
			<th>id</th>
			<th>pw</th>
		</tr>
	<c:forEach var="m" items="${list }">
		<tr>
			<td>${m.id }
			<td>${m.pw }
		</tr>
	</c:forEach>
	</table>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>