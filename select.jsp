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
	<h1>WebContent/jsp3/select.jsp</h1>
	<h3>학생 목록</h3>
	<%
		// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
		Class.forName("com.mysql.jdbc.Driver");
	
		// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
		//  => 접속 정보 저장
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
		String dbUser = "root";
		String dbPass = "1234";	
		Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
		// 3단계 - 접속 정보를 이용해서 select sql 구문을 만들고
		// 실행할 수 있는 자바프로그램 생성
		String sql = "SELECT * FROM student";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4단계 sql 구문(select) 실행 => 결과저장(select)
		ResultSet rs = pstmt.executeQuery();	// sql결과 값을 저장하는 내장객체 ResultSet
		
		// 5단계 결과 저장 => 출력
		// rs.next(), rs.last(),  rs.first(), rs.previous()
		// 다음 행(next), 마지막행(last) , 처음 행(first), 이전 행(previous)에 
		// 데이터가 있으면 true 없으면 false
// 		while(rs.next()) {		// rs의 처음과 끝을 모르기 때문에 for문이 아닌while 문 사용
			// 행 데이터가 있으면 true
			// 조건이 true이면 실행문(열 데이터 뽑아오기)
			// rs.getInt(n번열) , rs.getString(n번열) 
			// 또는 rs.getInt(열 이름) , rs.getString(열 이름)
// 			out.println(rs.getInt(1)+","+rs.getString(2) + "<br>");
// 			out.println(rs.getInt("num")+","+rs.getString("name") + "<br>");
// 		}
		// 행 데이터가 없으면 false -> while문 중지
		
	%>
<table border ="1">

<tr><td>학생번호</td><td>학생이름</td></tr>

<%
while(rs.next()){
	%><tr><td><%= rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr> <%
}
%>

</table>
</body>
</html>