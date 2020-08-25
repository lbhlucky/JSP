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
<title>0825 login</title>
</head>
<body>
	<h1>WebContent/jsp4/loginPro.jsp</h1>
	<%
		// id, pass 파라미터 가져와서 변수에 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

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
	// member 테이블에 Form에서입력된 id가 
	// DB 테이블 id열에 해당하는 id가 있는지 조회
	String sql = "select * from member where id = ?"; // id가 있냐없냐
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);

	// 4단계 sql 구문 실행 => 결과저장
	ResultSet rs = pstmt.executeQuery();

	// 5단계 결과 저장
	// rs.next() 다음행이동 했으때 데이터가 있으면 true 없으면 false
	if (rs.next()) {

// 		out.println("아이디 있음!");

		if (pass.equals(rs.getString("pass"))) {

// 			out.println("비밀번호 맞음");
			
			// 세션값 부여(생성) : 페이지 상관없이 값을 유지 이름, 값 : "id", id
			session.setAttribute("id", id);
			// main.jsp 이동
			response.sendRedirect("main.jsp");		
		} else {

// 			out.println("비밀번호 틀림");
			%>
			<script type="text/javascript">
				alert("비밀번호 틀림!");
				history.back();	// 뒤로이동
			</script>
			<%	
		}

	} else {

// 		out.println("아이디 없음!");
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