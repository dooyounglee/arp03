<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
© 2019 Material Pro Admin by wrappixel.com

<script>
	var ws_count = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/${cp}/count/websocket");
	ws_count.onopen=function() {
		console.log("count성공")
	}
	ws_count.onmessage = function(msg) {
		var data = msg.data;
		$('#user_count').text(': '+data+"명")
	}
	ws_count.onclose = function(evt) {
		console.log("count연결 끊김");
	}
</script>

<%-- <c:if test="${!empty mem }">
<button onclick="sendMessage_Test()">qq</button>
<script>
	var ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/${cp}/echo/websocket?m_no=${mem.m_no}");
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
	function sendMessage_Test() {
		ws.send(6+"");
	}
</script>
</c:if> --%>