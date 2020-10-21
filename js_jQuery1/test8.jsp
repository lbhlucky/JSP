<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test8.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 대상.이벤트함수() : bind(), click(), mouseover() 등
// 		$('h2').bind('click',function(){
// 			$(this).html("클릭");
// 			alert("클릭이벤트");
// 			// 이벤트 한번만 하고 종료
// 			$(this).unbind();
// 		});
		
// 		$('h2').click(function(){
// 			$(this).html("클릭2");
// 			alert("클릭이벤트2");
// 			// 이벤트 한번만 하고 종료
// 			$(this).unbind();
// 		});
		
		// h2대상을 클릭했을 때 기존 내용(head)을 가지고와서 * 추가
		$('h2').click(function(){	
			$(this).html(function(index,oldhtml){
			return oldhtml+"*";
			});
		});
		
		// img태그 마우스오버 mouseover() 했을 때
		// 마우스 오버한 대상에 attr() => src 속성 2.jpg로변경
		$('img').mouseover(function(){	// 커서 올렸을때
			$(this).attr("src","2.jpg");
		$(this).mouseout(function(){	// 커서 땟을때
			$(this).attr("src","1.jpg");
		});
		});
		
		
	});
</script>
</head>
<body>
<h1>js_JQuery1/test8.jsp</h1>
<img alt="" src="1.jpg" width="300" height="200">
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
</body>
</html>