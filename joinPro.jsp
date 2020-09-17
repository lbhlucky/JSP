<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
	// 회원가입
	
	// request 한글처리
	request.setCharacterEncoding("utf-8");

	// 파라미터값 가져오기(id, pass, name, email, address, phone, mobile)
	// date : 현시스템 가입날짜 가져오기(TimeStamp)
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String mobile = request.getParameter("mobile");
	
	Timestamp date = new Timestamp(System.currentTimeMillis());
	
	// db작업(바구니 생성) 패키지 - member 파일명 MemberBean
	// => 파라미터값 정의 및 Getter/Setter 생성
	
	// MemberBean 객체생성
	// Setter 호출 <- 파라미터값 저장
	MemberBean mb = new MemberBean();
	
	mb.setId(id);
	mb.setPass(pass);
	mb.setName(name);
	mb.setEmail(email);
	mb.setAddress(address);
	mb.setPhone(phone);
	mb.setMobile(mobile);
	mb.setDate(date);
	
	// 패키지 member 파일명 MemberDAO
	// insertMember(mb 주소값) 메서드 정의 - 리턴값 없음
	
	// MemberDAO 객체 생성
	// insertMember() 호출
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mb);
%>

<script type="text/javascript">
	alert("회원가입성공!");
	location.href = "login.jsp";
</script>

</body>
</html>