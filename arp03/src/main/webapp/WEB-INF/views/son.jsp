<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자식창</title>
<script>
	function send(){
		var parent = window.opener;
		var answer = document.getElementById('pw').value;
		parent.document.getElementById('get').value = answer;
	}
</script>
</head>
<body>
    <input type="password" name="pw" id="pw">
    <button onclick="send()">부모에게 전해라</button>
</body>
</html>