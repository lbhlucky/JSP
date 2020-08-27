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
<title>0827</title>
</head>
<body>
	<h1>WebContent/jsp4/updateForm.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
	//  => 접속 정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	// 3단계 - 접속 정보를 이용해서 select sql 구문을 만들고
	// 실행할 수 있는 자바프로그램 생성
	String sql = "select * from member where id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	// 4단계 sql 구문 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 5단계 결과 저장
	// rs.next() 다음행이동 했으때 데이터가 있으면 true 없으면 false
	if(rs.next()) {
%>
<form action = "updatePro.jsp" method = "post">
아 이 디 : <input type="text" name = "id" value ="<%=rs.getString("id") %>" readonly> <br> 
비밀번호 : <input type="password" name = "pass"> <br>
이    름 : <input type="text" name = "name" value ="<%=rs.getString("name") %>"> <br>
<input type="submit" value = "회원정보수정">
</form>
<%
	}
	%>
</body>
</html>