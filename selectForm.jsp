<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 select</title>
</head>
<body>
	<h1>WebContent/jsp3/selectForm.jsp</h1>

<form action="selectPro.jsp" method = "post">

조회할 학생 번호 : <input type="text" name = "num"> <br> 
<!-- 조회할 학생 이름 : <input type="text" name = "name"> <br>  -->

<input type="submit" value = "학생 조회">

</form>

</body>
</html>