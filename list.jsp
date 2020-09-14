<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0914 게시판</title>
</head>
<body>
	<h1>WebContent/board/list.jsp</h1>
	<%
request.setCharacterEncoding("utf-8");
	
		//1단계
	Class.forName("com.mysql.jdbc.Driver");

	//2단계 db접속
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	//3단계 게시판글 전부가져오기 (select 이용) 
	//최근글 맨위로 보이게 데이터가져오기(num 기준 내림차순정렬 : decs)

	String sql = "select * from board order by num desc";
	PreparedStatement pstmt = con.prepareStatement(sql);

	// 결과 저장 rs
	ResultSet rs = pstmt.executeQuery();

// int num = Integer.parseInt(request.getParameter("num"));

// 	BoardDAO bdao = new BoardDAO();
	
	
// 	BoardBean bb = bdao.getBoard(num);
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회 수</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("num")%></td>
			<td><a href="content.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("subject")%></a></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getTimestamp("date")%></td>
			<td><%=rs.getInt("readcount")%></td>
		</tr>
		
		
<!-- 		<tr> -->
<%-- 			<td><%=bb.getNum()%></td> --%>
<%-- 			<td><a href="content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td> --%>
<%-- 			<td><%=bb.getName()%></td> --%>
<%-- 			<td><%=bb.getContent()%></td> --%>
<%-- 			<td><%=bb.getReadcount()%></td> --%>
<!-- 		</tr> -->
		<%
			}
		%>
	</table>
</body>
</html>