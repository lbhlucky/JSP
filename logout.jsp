<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 logout</title>
</head>
<body>
	<h1>WebContent/jsp4/logout.jsp</h1>
<%
	// 세션값 전체 삭제
	session.invalidate();
%>
<script type="text/javascript">
	 alert("로그아웃!") 
	 location.href = "main.jsp";
</script>
</body>
</html>