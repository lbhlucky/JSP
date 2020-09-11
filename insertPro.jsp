<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0911 member</title>
</head>
<body>
	<h1>WebContent/member/insertPro.jsp</h1>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");

	// String id, pass, name 파라미터 => 서버request 내장객체저장
	// 가져와서 변수 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	//가입날짜 <= 현시스템에 날짜시간을 가져오기
	Timestamp date = new Timestamp(System.currentTimeMillis());
	

// MemberBean 사용을 위해 기억장소 확보(객체 생성) , mb
// 멤버변수 <= 파라미터 setter() 호출
	MemberBean mb = new MemberBean();

	mb.setId(id);
	mb.setPass(pass);
	mb.setName(name);
	mb.setDate(date);
	
	member.MemberDAO md = new member.MemberDAO();
	
	md.insertMember(mb);
%>
<script type="text/javascript">
	alert("회원가입성공")
	location.href = "loginForm.jsp";
</script>
</body>
</html>