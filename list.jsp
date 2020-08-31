<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0831</title>
</head>
<body>
	<h1>WebContent/jsp4/list.jsp</h1>
<%
	Class.forName("com.mysql.jdbc.Driver");

	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	String sql = "select * from member";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
%>
	<table border = "1">
	<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>	
<%
	while(rs.next())	{
%>	<tr><td><%=rs.getString("id") %></td><td><%= rs.getString("pass") %></td>
		<td><%= rs.getString("name") %></td><td><%=rs.getTimestamp("date") %></td></tr>
<%
		}
%>
	</table>
</body>
</html>