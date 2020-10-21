<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test4.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 대상.attr(속성); : 대상 태그의 속성 가져오고 변경
		// 	   .attr(attrbuteName)
		var wid = $('img').attr('width');
// 		alert(wid);	// 첫번째의 값을 가져옴

		// 	   .attr(attrbuteName, value)
		// 이미지태그에 속성 width의 값을 500 으로 변경
		$('img').attr('width',500)
		
		// 	   .attr(attrbuteName, function)
// 		var width = [100,200,300]
		$('img').attr('width', function(index){
			// 1번째 이미지 width 100
			// 2번째 이미지 width 200
			// 3번째 이미지 width 300
			// (0+1)*100
			return (index+1)*100;
// 			return width[index];
		});
		
		// 	   .attr(attrbutes)
		//이미지 태그 width = 500, height 300 변경
// 		$('img').attr({
// 			width: 500,
// 			height:300
// 		});
		
		$('img').attr({
			width:function(index){
				return wid[index];
			},
			height:function(index){
				return wid[index];
			}
		
		});
		
	});
</script>
</head>
<body>
<h1>js_JQuery1/test4.jsp</h1>
<img alt="" src="1.jpg" width="300" height="200">
<img alt="" src="2.jpg" width="300" height="200">
<img alt="" src="3.jpg" width="300" height="200">
</body>
</html>