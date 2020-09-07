<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0907 게시판</title>
</head>
<body>
<h1>WebContent/jsp5/updateForm.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
// int num 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));

// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
	Class.forName("com.mysql.jdbc.Driver");

// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
//        => 접속정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
	String sql = "select * from board where num =?";	
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, num);
	
// 4단계 - sql구문 실행(select) => 결과 저장
	ResultSet rs = pstmt.executeQuery();

// 5단계 - 결과 저장 => 출력    
// if 첫행으로 이동 데이터 있으면  열을 찾아서 출력
	if(rs.next()){

%>
<form action="updatePro.jsp" method="post">
<input type="hidden" name ="num" value ="<%=num%>">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=rs.getString("subject")%>"></td></tr>
<tr><td>글내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=rs.getString("content") %></textarea></td></tr>
<tr><td colspan="2"><input type="button" value="글수정" onclick="location.href='list.jsp?num=<%=rs.getInt("num")%>'"></td></tr>    
</table>
<%
	}
%>
</form>
</body>
</html>