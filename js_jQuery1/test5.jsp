<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test5.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 대상.html() : 대상에 내용을 가져오거나 넣기(덮어쓰기)
		var ht = $('h2').html();
// 		alert(ht);
// 	$('h2').html("내용");
	
// 	$('h2').html(function(index) {
// 		return "내용-"+index;
// 	});
	
	$('h2').html(function(index,oldhtml){
// 		alert(oldhtml);	// 기존 내용 출력
		return oldhtml+"*";
	});
	
	
	});
</script>
</head>
<body>
<h1>js_JQuery1/test5.jsp</h1>
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
</body>
</html>