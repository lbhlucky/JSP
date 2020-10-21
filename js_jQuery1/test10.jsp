<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test10.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 효과  
		// 대상.show() 대상.hide() 대상.toggle()
		// 대상.slideDown() 대상.slideUp() 대상.slideToggle()
		// 대상.fadeIn() 대상.fadeOut() 대상.fadeToggle()
		
		// h2 대상 클릭 했을 때
		// 클릭한 대상 다음태그 .next() 에  toggle() 효과
		
		$('h2').click(function(){
			$(this).next().toggle('slow',function(){
				alert("효과 끝");
			});
		});
		
	});
</script>
</head>
<body>
<h1>js_JQuery1/test10.jsp</h1>
<h2>열고 닫기1</h2>
<div>
<h2>제목1</h2>
<p>내용1</p>
</div>

<h2>열고 닫기2</h2>
<div>
<h2>제목2</h2>
<p>내용2</p>
</div>

</body>
</html>