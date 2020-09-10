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
<title>0908 게시판</title>
</head>
<body>
<h1>WebContent/jsp5/updatePro.jsp</h1>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");
	// 파라미터값 가져오기 num, name, pass, subject, content
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	// step 1
	Class.forName("com.mysql.jdbc.Driver");
	
	// step 2
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// step 3 
	// select 구문 만들고 실행할수 있는 자바프로그램 
	// board 테이블에 num열에 해당하는 게시판 글 있는지 조회
	String sql = "select * from board where num = ?";
	
	PreparedStatement p = con.prepareStatement(sql);
	
	p.setInt(1, num);
	
	
	// step 4
	// sql 구문 실행(select) = > 결과저장(rs)
	ResultSet rs = p.executeQuery();
	
	// step 결과저장
	// if(rs.next()) 
	// true => update 실행
	// false => 게시글 없음
	if (rs.next()) {
		if(pass.equals(rs.getString("pass"))) {
			sql = "update board set name=?,subject=?,content=? where num=?";
			p = con.prepareStatement(sql);
			
			p.setString(1, name);
			p.setString(2, subject);
			p.setString(3, content);
			p.setInt(4, num);
			
			p.executeUpdate();
			
%>
	<script type="text/javascript">
		alert("수정 성공")
		location.href = "list.jsp";
	</script>
<%
		} else {
%>	
	<script type="text/javascript">
		alert("비밀번호 틀림!!")
		history.back();
	</script>
<%		
		}
		
	} else {
%>
	<script type="text/javascript">
		alert("게시글 없음!!")
		history.back();
	</script>
<%	
	}
	

%>
	
</body>
</html>