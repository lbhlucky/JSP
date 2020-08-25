<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 delete</title>
</head>
<body>
	<h1>WebContent/jsp3/deletePro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");

	Class.forName("com.mysql.jdbc.Driver");
// 	Class.forName("oracle.jdbc.driver.OracleDriver");		// 오라클 드라이버
// 	String dbUrl = "jdbc:oracle:jspdb1:@localhost:1521:XE";	// 오라클 주소
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	String sql = "DELETE FROM student WHERE num=? and name=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, num);
	pstmt.setString(2, name);
	
	pstmt.executeUpdate();

%>
학생 삭제 성공 : <%= pstmt %>
</body>
</html>