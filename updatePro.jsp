<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<title>0915 member</title>
</head>
<body>
	<h1>WebContent/member/updatePro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	// updateForm에서 입력한 값 가져오기
	String id = (String)session.getAttribute("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
	// memberDAO 객체생성
	// int check =  userCheck 메서드 호출
	MemberDAO mdao = new MemberDAO();
	int check = mdao.userCheck(id, pass);
	//check==1  아이디비밀번호 일치  신호 1받아서  
	if(check == 1) {
//  MemberBean mb 객체 생성  멤버변수 <= 파라미터 값 저장
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
		mb.setName(name);
		
		mdao.updateMember(mb);
		%>
		<script type="text/javascript">
			alert("수정 성공!");
			location.href("main.jsp");
		</script><%
	} else if(check == 0) {
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

</body>
</html>