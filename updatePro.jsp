<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0820</title>
</head>
<body>
	<h1>WebContent/jsp3/updatetPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	
	Class.forName("com.mysql.jdbc.Driver");
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";	
	Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	// 	update 테이블이름 set 수정할열 = 값 where 조건열 = 값;
	String sql = "UPDATE student SET name = ?  WHERE num= ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setInt(2, num);

	pstmt.executeUpdate();
	
%>
학생 수정 성공 : <%= pstmt %>
</body>
</html>