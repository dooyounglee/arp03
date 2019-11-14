<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<h1>회원번호로 id찾기</h1>
	회원번호 or email or phone
	<form action="findId.me" method="post" autocomplete=off>
		<input name="email" id="email">
		<input type="hidden" name="m_no" id="m_no">
		<button>찾기</button>
	</form>
	<script>
		$('#email').on('input',function(){
			var num=$(this).val()
			if(isNaN(num)){
				num='0'
			}
			$('#m_no').val(num)
		})
	</script>
	
	<h1>pw찾기</h1>
	<form action="findPw.me" method="post" autocomplete=off>
		비번은 우리도 모릅니다. 임시 비번으로 바꾸고 입력하신 이메일로 알려줄께요.<br>
		email:<input name="email"><button>임시비번바꾸기</button>
	</form>
	
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>