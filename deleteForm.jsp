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
<h1>WebContent/jsp5/deleteForm.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
// int num 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	
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
%>
<form action="deletePro.jsp" method="post">
<input type="hidden" name ="num" value ="<%=num%>">
<table border="1">
<tr><td>비밀번호</td><td><input type="password" name="pass"<%=rs.getString("pass")%>></td></tr>
<tr><td colspan="2"><input type="submit" value="글삭제" ></td></tr>    
</table>
<%
	}
%>
</form>
</body>
</html>