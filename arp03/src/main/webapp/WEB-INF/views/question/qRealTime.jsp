<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="stylesheet.css" media="screen" rel="stylesheet" type="text/css" /> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<!-- <script src="application.js" type="text/javascript"></script> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-size: 12px;
    background: #FFF;
    color: #333;
    margin: 0;
}

#content {
    margin: 20px;
    width: 250px;
    padding: 10px;
    background: #007bff;
}

#rank-list a {
    color: #FFF;
    text-decoration: none;
}

#rank-list a:hover {
    text-decoration: underline;
}

#rank-list {
    overflow: hidden;
    width: 160px;
    height: 20px;
    margin: 0;
}

#rank-list dt {
    display: none;
}

#rank-list dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
    height: 20px;
    line-height: 20px;
}
.numberStyle{
	font-size:17px;
	font-weight:bold;
	vertical-align:super;
	color:yellow;
}
.titleStyle{
	vertical-align:super;
	font-weight:bold;
	font-size:15px;
	color:white;
}
ol li{
	margin:0px;
	margin-top:0px;
}
.realText{
	font-weight:bold;
	color:yellow;
}

</style>
</head>
<body>
        	<div id="content">
        	<div class="realText">많이 찾아본 질문 순위</div>
            <dl id="rank-list">
                <dt>실시간 급상승 검색어</dt>
                <dd>
                    <ol>
                    </ol>
                </dd>
            </dl>
        </div>
</body>
<script>


$(function(){
	$.ajax({
		url: "realTimeSelect.al",
		dataType:"json",
		success: function(data){
			console.log("ajax통신 성공")
			
		/* 	console.log(data[0].title); */
			
			//var list = data[]
		var count = 1;
		for(var i=0; i<data.length; i++){
			$('#rank-list ol').append("<li><a href='#'>"+"<span class='numberStyle'>"+count+"</span> &nbsp;<span class='titleStyle'>"+data[i].title+"</span></a></li>");
			count++;
			if(count == 11){
				break;
			}
		}
			var count = $('#rank-list li').length;
		    var height = $('#rank-list li').height();
			
		    function step(index) {
		        $('#rank-list ol').delay(2000).animate({
		            top: -height * index,
		        }, 500, function() {
		            step((index + 1) % count);
		        });
		    }

		    step(1);
		}, error: function(){
			console.log("ajax통신 실패");
		}
	});
});









/* $(function() {
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();

    function step(index) {
        $('#rank-list ol').delay(2000).animate({
            top: -height * index,
        }, 500, function() {
            step((index + 1) % count);
        });
    }

    step(1);
    
}); */


</script>
</html>