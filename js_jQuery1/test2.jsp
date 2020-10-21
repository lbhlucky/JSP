<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test2.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//jQuery :  자바스크립트를 이용해서 만든 함수들 모음
		// 대상.함수()
		
		// 전체대상.함수()
		$('*').css('color','red');
		
		// 특정태그.함수()
		$('h1').css('color','blue');
		
		// 태그 id 표시.함수()
		$('h1#ta').css('color','green');
		
		// 태그 class 표시.함수()
		$('h1.ta2').css('color','orange');
		
		// 태그[속성=값].함수()
		$('input[type=text]').css('color','skyblue')
		
		// 반복태그 홀수 		짝수 			첫번쨰 			마지막
		// 			태그:odd 		태그:even 		태그:first 		 태그:last
		$('tr:odd').css('background-color', 'pink');	// 홀수
		$('tr:even').css('background-color', 'yellow');	// 짝수
		$('tr:first').css('background-color', 'green');	// 첫번째
		$('tr:last').css('background-color', 'black');	// 마지막

	});
</script>
</head>
<body>
<table border="1">
 <tr><td>번호</td><td>제목</td></tr>
 <tr><td>1</td><td>제목1</td></tr>
 <tr><td>2</td><td>제목2</td></tr>
 <tr><td>3</td><td>제목3</td></tr>
 <tr><td>4</td><td>제목4</td></tr>
</table>
<input type="text" value="글자">
<input type="password" value="123">
	<h1>js_JQuery1/test2.jsp</h1>
	<h1 id="ta">제목1</h1>
	<h1 class="ta2">제목2</h1>
	내용
	
</body>
</html>