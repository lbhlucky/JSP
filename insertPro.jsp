<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLInput"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0820</title>
</head>
<body>
	<h1>WebContent/jsp3/insertPro.jsp</h1>
<%
	// request 한글 처리
	request.setCharacterEncoding("utf-8");
	// num, name 파라미터 정보를 가져와서 서버 request 내장객체에 저장
	// int num, String name 파라미터 정보 가져와서 변수에 저장하기
	int num = Integer.parseInt(request.getParameter("num"));
	// Integer.parseInt() : 문자열을 정수형으로 바꾸고 싶을 때 사용
	String name = request.getParameter("name");

	
	//JDBC 프로그램 설치	
	// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
	//  => 접속 정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";	
	Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	// 3단계 - 접속 정보를 이용해서 insert sql 구문을 만들고 실행할 수 있는 자바프로그램 생성
	// insert, update, delete, select
	// insert into 테이블이름(열이름,열이름) values(값1,'값2');
	// insert into student(num,name) values(1,'kim');
	
	// 	Statement(보안상 좋지않음)
	// 	PreparedStatement(우리가 사용할 것)
	//  CallableStatement(database에 함수 쓰는 용도, 아직 사용 X)
	
	// 	String sql = "INSERT INTO student(num,name) VALUES(4,'lee')";
	// java변수 사용을 위해 변수 양옆에 " + "붙여줌
	// 	String sql = "INSERT INTO student(num,name) VALUES("+num+",'"+name+"')";
	// => 위의 형태는 statement 형태로 보안상 위험해서 사용하지 않음
	
	String sql = "INSERT INTO student(num,name) VALUES(?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	// 물음표에 값을 저장
	pstmt.setInt(1, num);	// parameterIndex : 물음표 순서 , x : 값이 저장된 변수
	pstmt.setString(2, name);	// parameterIndex : 물음표 순서 , x : 값이 저장된 변수
	
	
	// 4단계 - sql실행 (insert, update, delete)
	//  sql실행 => 결과저장(select)
	pstmt.executeUpdate();	// 안적으면 DB업데이트안됨
	
%>
학생 등록 성공 : <%= pstmt %>
</body>
</html>