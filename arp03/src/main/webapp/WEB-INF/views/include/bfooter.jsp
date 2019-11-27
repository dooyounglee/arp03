<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
© 2019 Material Pro Admin by wrappixel.com
<button onclick="sendMessage()">qq</button>
<script>
	var ws = new WebSocket("ws://localhost:8090/arp/echo/websocket?m_no=${mem.m_no}");
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
		ws.send(6+"");
	}
</script>