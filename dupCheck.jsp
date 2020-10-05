<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/dupCheck.jsp</title>
<script type="text/javascript">
	function idOk() {
		//join.jsp의 id 상자 <= dupCheck.jsp에서 찾은 아이디
		opener.fr.id.value = document.wfr.wid.value;
		// 창 닫기
		window.close()
	}
</script>
</head>
<body>
<%
// "dupCheck.jsp?wid="+wid
// wid 파라미터 가져오기
String wid = request.getParameter("wid");

// memberDAO mdao 객체 생성
	MemberDAO mdao = new MemberDAO();
// int check = dupCheck(wid)
int check = mdao.dupCheck(wid);
%>
<form action="dupCheck.jsp" method ="post" name = "wfr">
아이디 : <input type="text" name="wid" value="<%=wid%>">
<input type="submit" value="아이디 중복체크"><br>
<% 
// check = 1 "아이디 중복"
// check = 0 "아이디 사용 가능"
if(check == 1){
	out.println("아이디 중복");
} else {
	out.println("아이디 사용 가능");
	%><input type="button" value="아이디 사용" onclick="idOk()"><%
}

%>
</form>
</body>
</html>