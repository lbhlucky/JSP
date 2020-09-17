<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<h1>Logout</h1>
<%
// member/logout.jsp
// 세션값 초기화(전체삭제)
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="../main/main.jsp";
</script>
</body>
</html>
