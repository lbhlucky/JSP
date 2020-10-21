<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test6.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 대상.append() : 대상의 뒷부분에 추가
		$('body').append("<h2>추가내용</h2>");
		
		$('div').append(function(index){
			return "내용"+index
		});
	
		// 2초마다 함수 실행
		setInterval(function(){

		// p태그 안에서 기존 첫번쨰 img 태그를 뒷부분에 추가(이동)
		$('p').append($('img').first())
				
		}, 2000);
	});
</script>
</head>
<body>
<h1>js_JQuery1/test6.jsp</h1>
<p>
<img alt="" src="1.jpg" width="300" height="200">
<img alt="" src="2.jpg" width="300" height="200">
<img alt="" src="3.jpg" width="300" height="200">
<img alt="" src="4.jpg" width="300" height="200">
<img alt="" src="5.jpg" width="300" height="200">
</p>
<div></div>
<div></div>
<div></div>
</body>
</html>