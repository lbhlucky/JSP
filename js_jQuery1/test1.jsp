<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test1.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	// jQuery 쓸 준비 단계1
	jQuery(document).ready(function() {
		alert("jQuery 준비 1");
	});
	
	// jQuery 쓸 준비 단계2 - 일반적으로 가장 많이 사용
	$(document).ready(function(){
		alert("jQuery 준비 2");
	});
	
	// jQuery 쓸 준비 단계3
	$(function() {
		alert("jQuery 준비 3");
	});
		
</script>
</head>
<body>
	<h1>js_JQuery1/test1.jsp</h1>
	 



</body>
</html>