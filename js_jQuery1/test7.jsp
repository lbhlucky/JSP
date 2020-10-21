<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test7.jsp</title>
<style type="text/css">
	.high_0{background: yellow;}
	.high_1{background: orange;}
	.high_2{background: blue;}
	.high_3{background: green;}
	.high_4{background: red;}
</style>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 대상.each() : 대상 반복, 일종의 반복문
		// 태그 대상 반복
		$('h2').each(function(index){
// 			alert(index);
			$(this).addClass('high_'+index);
		});
		
		// 배열 대상 반복 (자주사용)
		var arr=[
			{name: 'naver', link:'www.naver.com'},
			{name: 'daum', link:'www.daum.net'},
			{name: 'jquery', link:'www.jquery.com'},
		];
		
// 		$.each(배열변수,function(){});	// 대상이 변수일경우 ()생략
		$.each(arr,function(index,item){
// 			alert(index);
// 			alert(item);
// 			alert(item.name);
// 			alert(item.link);
			$('body').append("<h3>" + item.name + ", " + item.link +"</h3><br>");
		});
		
		// table 태그 뒷부분에 배열변수 each 추가
		$.each(arr,function(index,item){
		$('table').append("<tr><td>"+item.name+"</td><td>"+item.link+"</td></tr>");
		});
		
	});
</script>
</head>
<body>
<h1>js_JQuery1/test7.jsp</h1>
<table border="1">
<tr><td>사이트 이름</td><td>사이트 주소</td></tr>
</table>

<h2>item-0</h2>
<h2>item-1</h2>
<h2>item-2</h2>
<h2>item-3</h2>
<h2>item-4</h2>
</body>
</html>