<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 member</title>
</head>
<body>
	<h1>WebContent/jsp4/insertPro.jsp</h1>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");

	// String id, pass, name 파라미터 => 서버request 내장객체저장
	// 가져와서 변수 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	//가입날짜 <= 현시스템에 날짜시간을 가져오기
	Timestamp date = new Timestamp(System.currentTimeMillis());
	
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
	String sql = "INSERT INTO member(id, pass, name, date) VALUES(?, ?,  ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setTimestamp(4, date);
	
	// 4단계 sql 구문 실행
	pstmt.executeUpdate();
	
%>
회원가입 성공 : <%=pstmt%>
<script type="text/javascript">
	alert("회원가입성공")
	location.href = "loginForm.jsp";
</script>
</body>
</html>