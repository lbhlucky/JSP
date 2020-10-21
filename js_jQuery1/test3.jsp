<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_JQuery1/test3.jsp</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	// 대상.css()
	
	// 대상.css(속성) : 속성에 대한 값을 가져오기
	var col = $('h1').css('color');
// 	alert(col);	// rgb(0,0,0) : black
	
	// 대상.css(속성, 값) : 속성에 대한 값 변경
	// 대상.css(propertyName, vlaue)
	$('h2').css('color','red');
	
	
		var color=['red','blue','green'];
	// 대상.css(propertyName, function) : 속성의 값을 변경할 떄 기능을 넣고 싶다.
	$('h2').css('color',function(index){ 
		// index : h2(대상)의 순서
// 		alert(index);
		
// 		alert(color[index]);
		return color[index];
		
// 		if(index == 0) {
// 			return 'blue';
// 		}
		
// 		if(index == 1) {
// 			return 'green';
// 		}
		
// 		if(index == 2) {
// 			return 'orange';
// 		}
	});

		
		// 대상.css(properties) : 속성을 여러개 주고싶다.
		$('h2').css('color','red').css('background','pink'); 
		$('h2').css({
			color:'blue',
			background:'skyblue'
		});
		$('h2').css({
			color:function(){
				return color[index];
				},
			background:'skyblue'
		});
		
		});
	
/*
 	$(document).ready(function(){
		// 대상.css()
		// 대상.css(속성)  : 속성에 대한 값을 가져오기
		// .css( propertyName )
		 var col=$('h2').css('color');
//		 alert(col); //rgb(0,0,0)
		// 대상.css(속성,값): 속성에 대한 값을 변경
		// .css( propertyName, value )
		$('h2').css('color','red');
		// .css( propertyName, function )
		var color=['red','blue','green']
		$('h2').css('color',function(index){
			// index : h2대상의 순서
//			alert(index);
		
//			alert(color[index]);
			return color[index];

//			if(index==0){
//				return 'blue';
//			}
//			if(index==1){
//				return 'green';
//			}
//			if(index==2){
//				return 'yellow';
//			}
		});
		
		// 대상.css( properties ) 
//		$('h2').css('color','red').css('background','pink');
		$('h2').css({
			color:'blue',
			background:'skyblue'
		});
		$('h2').css({
			color:function(index){
				return color[index];
			},
			background:'skyblue'
		});
	});
 */
</script>
</head>
<body>
	<h1>js_JQuery1/test3.jsp</h1>
	 <h2>head-0</h2>
	 <h2>head-1</h2>
	 <h2>head-2</h2>
  

</body>
</html>