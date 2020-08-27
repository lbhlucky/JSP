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
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/updatePro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	// updateForm에서 입력한 값 가져오기
	String id = (String)session.getAttribute("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
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
	String sql = "select * from member where id =?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
// 	pstmt.setString(2, pass);
// 	pstmt.setString(3, name);
	
	// 4단계 sql 구문 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 5단계 결과 저장
	// rs.next() 다음행이동 했으때 데이터가 있으면 true 없으면 false
	if(rs.next()) {
		if(pass.equals(rs.getString("pass"))) {
		sql = "update member set name =? where id =? and pass =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pass);
			
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
			alert("수정 성공");
			location.href("main.jsp");
		</script><%
		} else {
			
			response.sendRedirect("loginForm.jsp");	
			%>
			<script type="text/javascript">
				alert("비밀번호 틀림!");
				history.back();	// 뒤로이동
			</script>
			<%	
		}
	} else {
		response.sendRedirect("loginForm.jsp");
		%>
		<script type="text/javascript">
			alert("아이디 없음!");
			history.back();	// 뒤로이동
		</script>
		<%	
	}
%>

</body>
</html>