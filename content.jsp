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
<title>0907 게시판</title>
</head>
<body>
	<h1>WebContent/jsp5/content.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");

	// num 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));

	// 1단계 - 드라이버 가져오기
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계 - db연결
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// 3단계 - sql 구문 생성 
	//		   num에 해당하는 게시판 글 가져오기
	String sql = "select * from board where num=?";
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, num);

	// 4단계 실행
	ResultSet rs = pstmt.executeQuery();

	// 5단계 출력 => if문 첫행 이동시 데이터있으면 열을 찾아서 출력
	if (rs.next()) {
	%>
	<table border="1">
		<tr>
			<td>글 번호</td><td><%=rs.getInt("num") %></td><td>글 쓴 날짜</td><td><%=rs.getTimestamp("date") %></td>
		</tr>
		<tr>
			<td>작성자</td><td><%=rs.getString("name") %></td><td>조회 수</td><td><%=rs.getInt("readcount") %></td>
		</tr>
		<tr>
			<td>제목</td><td colspan="3"><%=rs.getString("subject") %></td>
		</tr>
		<tr>
			<td>글 내용</td><td colspan="3"><%=rs.getString("content") %></td>
		</tr>
		<tr>
			<td colspan="4"><input type="button" value = "글 수정" onclick="location.href = 'updateForm.jsp?num=<%=rs.getInt("num")%>'">
			<input type="button" value = "글 삭제" onclick="location.href = 'deleteForm.jsp?num=<%=rs.getInt("num")%>'">
			<input type="button" value = "글 목록" onclick="location.href = 'list.jsp'"></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>