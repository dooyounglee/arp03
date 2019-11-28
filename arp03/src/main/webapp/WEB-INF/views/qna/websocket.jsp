<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="http://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<button onclick="sendMessage()">ㅂㅇ</button>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script> -->
<script>
	var ws = new WebSocket("ws://192.168.0.6:8090/arp/echo/websocket?id=1324");
	//let sock = new SockJS("/arp/echo?userId=bbb");
	ws.onopen=function() {
		console.log("성공")
	}
	ws.onmessage = function(msg) {
		var data = msg.data;
		alert(data)
	}
	ws.onclose = function(evt) {
		console.log("연결 끊김");
	}

	// 메시지 전송
	function sendMessage() {
		ws.send("a");
	}
</script>
</body>
</html>