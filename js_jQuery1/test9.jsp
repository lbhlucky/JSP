<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test9.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myform').submit(function(){
			// 아이디
			var id = $('#myid').val();
// 			alert("아이디 : "+id);
			// 비밀번호
			var pw = $('#mypw').val();
// 			alert("비밀번호 : "+pw);
	
			if(id==""){
				alert("아이디 입력하세요");
				$('#myid').focus();
				return false;
			}
			
			if(pw==""){
				alert("비밀번호 입력하세요");
				$('#mypw').focus();
				return false;
			}	
			// $('#gen1').is(":checked") => 체크되어있으면 true
			// $('#gen1').is(":checked") => 체크되어있으면 false
// 			alert($('#gen1').is(":checked"));
			
			// 성별이 체크 안되어있으면
			// 메세지 출력 "성별체크하세요"
			// 포커스, 리턴
			if($('#gen1').is(":checked")==false && $('#gen2').is(":checked")==false){
				alert("성별을 입력하세요");
				$('#gen1').focus();
				return false;
			}
			
		
		});
	});
</script>
</head>
<body>
<h1>js_JQuery1/test9.jsp</h1>
<form action="a.jsp" method="post" id="myform">
아 이 디 : <input type="text" name="id" id="myid"><br>
비밀번호 : <input type="password" name="pw" id="mypw"><br>
성    별 : <input type="radio" name="gender" value="남" id="gen1">남
 		   <input type="radio" name="gender" value="여" id="gen2">여 <br>
<input type="submit" value="로그인">
</form>
</body>
</html>