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
<title>0825 select</title>
</head>
<body>
	<h1>WebContent/jsp3/selectPro.jsp</h1>

<table border ="1">
<tr><td>학생번호</td><td>학생이름</td></tr>
<%
	request.setCharacterEncoding("utf-8");	// 한글처리
	
	// int num 파라미터 => 서버 request 내장객체 저장 => 가져와서 변수 저장
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	
	// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
	//  => 접속 정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";

	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// 3단계 - 접속 정보를 이용해서 select sql 구문을 만들고
	// 실행할 수 있는 자바프로그램 생성
	String sql = "SELECT * FROM student WHERE num=? ";
	//and name = ? 생략시 번호만 입력해도 이름나옴
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, num);
// 	pstmt.setString(2, name);	//and name = ? 생략시 없어도 됨

	// 4단계 sql 구문(select) 실행 => 결과저장(select)
	ResultSet rs = pstmt.executeQuery();

	// 5단계 결과 저장 => 출력
	while(rs.next()) {	// 또는 if(rs.next())
// 	if(num == rs.getInt("num")){	//where 절 생략가능
		
	
	%><tr><td><%= rs.getInt("num") %></td><td><%= rs.getString("name") %></td></tr> <br><%
// 		}		
	}
%>
</table>
</body>
</html>