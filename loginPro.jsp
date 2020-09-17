<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// member/loginPro.jsp
	
	// id, pass 파라미터가져오기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// MemberDAO mdao 객체 생성
	MemberDAO mdao = new MemberDAO();
	
	// int chek = userCheck(id, pass) 메서드 생성 및 호출
	// check == 1 => 세션값생성, main.jsp이동
	// check == 0 => 비밀번호틀림, 뒤로이동
	// else => 아이디없음, 뒤로이동
	
	int check = mdao.userCheck(id, pass);
	
	if(check == 1) {
		session.setAttribute("id", id);
		response.sendRedirect("../main/main.jsp");
	} else if (check == 0) {
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림!");
			history.back();	// 뒤로이동
		</script>
	<%		
	} else {
		%>
		<script type="text/javascript">
			alert("아이디 없음!");
			history.back();	// 뒤로이동
		</script>
		<%
	}
	
	 %>
	
%>
</body>
</html>