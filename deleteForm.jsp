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
	<h1>WebContent/jsp4/deleteForm.jsp</h1>
<%
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm이동
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	String sql = "select * from member where id =?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	
	ResultSet rs = pstmt.executeQuery(); 
	
	if(rs.next()) {
		
%>

<form action = "deletePro.jsp" method = "post">
아 이 디 : <input type="text" name = "id" value ="<%=rs.getString("id") %>" readonly> <br> 
비밀번호 : <input type="password" name = "pass"> <br>
<input type="submit" value = "회원정보삭제">
</form>
<%
	}
%>

</body>
</html>