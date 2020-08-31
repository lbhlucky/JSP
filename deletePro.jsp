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
<title>0831</title>
</head>
<body>
	<h1>WebContent/jsp4/deletePro.jsp</h1>

<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String pass = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
String dbUser = "jspid";
String dbPass = "jsppass";

Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from member where id = ?";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	if (pass.equals(rs.getString("pass"))) {
		sql = "delete from member where id =? and pass =?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		
		pstmt.executeUpdate();
		
		session.invalidate();	// 세션값 전체 삭제
		
		%>
		<script type="text/javascript">
			alert("삭제 완료!");
			location.href("main.jsp");
		</script>
		<% 
	} else {
		%>
		<script>
			alert("비밀번호 틀림!");
			history.back();
		</script>
		<%
	}
} else {
	 %>
	 	<script>
			alert("아이디 틀림!");
			history.back();
		</script>
		<%
}
%>
</body>
</html>