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
	<h1>WebContent/jsp3/jdbcTest.jsp</h1>
<%
	// JDBC 프로그램 설치
	// 이클립스 -> 프로젝트 -> WebContent -> Web-INF -> lib 안에
	// mysql-connector-java-5.1.47.jar 넣기
	
	// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
	// com/mysql/jdbc	Driver.class 파일
	
	// Driver d = new Driver();	// 직접 사용하지 않고 가져와서 다른 프로그램이 사용 
	Class.forName("com.mysql.jdbc.Driver");		// "."으로 폴더 표시
	// String sql = "";			// "com.mysql.jdbc.Driver"

	// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
	//  => 접속 정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";	
	// "jdbc:mysql://서버주소/데이터베이스"	
	String dbUser = "root";
	String dbPass = "1234";
	Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
	//Connection : java.sql 사용	
%>
연결 성공
</body>
</html>