<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
index

<script>
        function nwindow(){
            var url="test";
            window.open(url,"","width=400,height=400,left=600");
        }
    </script>
    <input type="button" value="자식을 불러라"  onclick="nwindow()"/>
    <input type="text" value="뭘주려나..." name="get" id="get"/>
    
    
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>