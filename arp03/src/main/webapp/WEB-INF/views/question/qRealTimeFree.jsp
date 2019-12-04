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

#rank-List-Content dt {
    display: none;
}

#rank-List-Content dd {
    position: relative;
    margin: 0;
}

#rank-List-Content ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-List-Content li {
    height: 20px;
    line-height: 20px;
}
#rank-List-Content .numberStyle{
	font-size:17px;
	font-weight:bold;
	vertical-align:super;
	color:#007bff;
}
#rank-List-Content .titleStyle{
	vertical-align:super;
	font-weight:bold;
	font-size:15px;
	color:black;
}
#rank-List-Content ol li{
	margin:0px;
	margin-top:0px;
}
#rank-List-Content .realText{
	margin-bottom:3px;
	font-size:13px;
	color:gray;
	font-weight:900px;
}

#rank-List-Content :hover{
	z-index:9999;
}


</style>
</head>
<body>
	<c:if test="${!empty mem }">
        <div id="rank-List-Content" class="d-none d-sm-block">
        	<div class="realText">자유게시판 조회 순위 ▼</div>
            <dl id="rank-list" style="width:250px;">
                <dt>실시간 급상승 자유게시판 글</dt>
                <dd>
                    <ol>
                    </ol>
                </dd>
            </dl>
        </div>
	</c:if>
</body>
<script>


$(function(){
	$.ajax({
		url: "realTimeFreeSelect.al",
		dataType:"json",
		success: function(data){
			console.log("ajax통신 성공")
			
		/* console.log(data[0].title); */
		
			//var list = data[]

			if(data.length == 0){
				$('#rank-list ol').append("<li>"+"<span class='numberStyle'></span><span class='titleStyle'>아직 게시글이 존재하지 않습니다.</span></li>");
			}
		
		var count = 1;
		for(var i=0; i<data.length; i++){
			$('#rank-list ol').append("<li><a href='bdetail.do?b_no=" + data[i].b_no +"'>"+"<span class='numberStyle'>"+count+"</span> &nbsp;<span class='titleStyle'>"+data[i].title+"</span></a></li>");
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