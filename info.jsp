<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
<title>0825 info</title>
</head>
<body>
	<h1>WebContent/jsp4/info.jsp</h1>
	<h2>나의 정보 조회</h2>
<%
	request.setCharacterEncoding("utf-8");
	
	//로그인한 사용자(원래는 세션값사용)
	String id = (String)session.getAttribute("id");
	
// MemberDAO    MemberBean형 주소리턴  getMember(id)메서드 정의 

	MemberDAO mdao = new MemberDAO();

// MemberBean mb  = getMember(id) 호출
	MemberBean mb = mdao.getMember(id);
%>
	
아 이 디 : <%= mb.getId() %>  <br> 
비밀번호 : <%= mb.getPass() %><br> 
이    름 : <%= mb.getName() %><br>
가입날짜 : <%= mb.getDate() %><br> 

<%
// 	}
%>
<a href ="main.jsp">main.jsp 이동</a>
</body>
</html>