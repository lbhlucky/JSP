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
<title>0825 info</title>
</head>
<body>
	<h1>WebContent/jsp4/info.jsp</h1>
	<h2>나의 정보 조회</h2>
<%
	request.setCharacterEncoding("utf-8");
	
	//로그인한 사용자(원래는 세션값사용)
	String id = (String)session.getAttribute("id");
	
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
	String sql = "select * from member where id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	// 4단계 sql 구문(select) 실행 => 결과저장(select)
	ResultSet rs = pstmt.executeQuery();
	
	// 5단계 결과 저장 => 출력			
	while(rs.next()){	// 또는 if(rs.next())
%>

아 이 디 : <%= rs.getString("id") %>  <br> 
비밀번호 : <%= rs.getString("pass") %><br> 
이    름 : <%=rs.getString("name") %><br>
가입날짜 : <%=rs.getString("date") %><br> <%
	}
%>
<a href ="main.jsp">main.jsp 이동</a>
</body>
</html>