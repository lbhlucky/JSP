<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/updateForm.jsp</h1>
<%
// int num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// 리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
BoardBean bb=bdao.getBoard(num);
%>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=bb.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td>글내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=bb.getContent() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>    
</table>
</form>
</body>
</html>




