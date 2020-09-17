<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0915 member</title>
</head>
<body>
	<h1>WebContent/member/deletePro.jsp</h1>

	<%
		request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("id");
	String pass = request.getParameter("pass");

	MemberDAO mdao = new MemberDAO();
	int check = mdao.userCheck(id, pass);

	if (check == 1) {
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
	
		mdao.deleteMember(mb);
		
		session.invalidate();
	%>
	<script type="text/javascript">
		alert("삭제 완료!");
		location.href = ("../main/main.jsp");
	</script>
	<%
		} else if (check == 0) {
	%>
	<script>
		alert("비밀번호 틀림!");
		history.back();
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디 없음!");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>