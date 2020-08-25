<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 main</title>
</head>
<body>
<%
	// 오브젝트 타입으로 변하기 떄문에 String형으로 형변환해줘야함
	// 상속 개념임?!
	String id = (String)session.getAttribute("id");

	// null 이면 == , 다른값이 있으면 equals
	if(id == null){	// 세션값이 없으면
		response.sendRedirect("loginForm.jsp");	// loginForm.jsp로 이동
	}

%>
	<h1>WebContent/jsp4/main.jsp</h1>
<%= id %>님이 로그인 하셨습니다.

<input type="button" value = "로그아웃" onclick="location.href='logout.jsp'"> <br>

<a href ="info.jsp">회원정보조회</a>

<a href ="updateForm.jsp">회원정보수정</a>

<a href ="deleteForm.jsp">회원정보삭제</a>

<a href ="list.jsp">회원목록</a>

</body>
</html>