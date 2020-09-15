<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<title>0915 member</title>
</head>
<body>
	<h1>WebContent/member/updateForm.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	
	// MemberDAO mdao 객체생성
	MemberDAO mdao = new MemberDAO();
	// MemberBean bb = getMember(id) 메서드
		MemberBean mb = mdao.getMember(id);

%>
<form action = "updatePro.jsp" method = "post">
아 이 디 : <input type="text" name = "id" value ="<%=mb.getId() %>" readonly> <br> 
비밀번호 : <input type="password" name = "pass"> <br>
이    름 : <input type="text" name = "name" value ="<%=mb.getName() %>"> <br>
<input type="submit" value = "회원정보수정">
</form>

</body>
</html>