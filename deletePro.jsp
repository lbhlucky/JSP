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
<title>0908 게시판</title>
</head>
<body>
<h1>WebContent/jsp5/deletePro.jsp</h1>

<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	String sql = "select * from board where num =?";
	
	PreparedStatement p = con.prepareStatement(sql);
	p.setInt(1, num);
	
	ResultSet rs = p.executeQuery();
	
	if(rs.next()) {
		if(pass.equals(rs.getString("pass"))) {
			sql = "delete from board where num=? and pass =?";
			p = con.prepareStatement(sql);
			
			p.setInt(1, num);
			p.setString(2, pass);
			
			p.executeUpdate();
%>
	<script>
		alert("삭제 성공");
		location.href = "list.jsp";
	</script>
<%
		}
	}
%>
</body>
</html>