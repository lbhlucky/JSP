<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>0914 게시판</title>
</head>
<body>
	<h1>WebContent/board/list.jsp</h1>
	<%
request.setCharacterEncoding("utf-8");
	// BoardDAO 객체생성
	BoardDAO bdao = new BoardDAO();

	// getBoardList() 메서드 생성 후 호출
	
// 	Connection con = bdao.getConnection();
	//3단계 게시판글 전부가져오기 (select 이용) 
	//최근글 맨위로 보이게 데이터가져오기(num 기준 내림차순정렬 : decs)

	List boardList = bdao.getBoardList();

	// 결과 저장 rs

// int num = Integer.parseInt(request.getParameter("num"));

// 	BoardDAO bdao = new BoardDAO();
	
	
// 	BoardBean bb = bdao.getBoard(num);
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회 수</td>
		</tr>
		<%
		for(int i = 0 ; i<boardList.size();i++){
			// 배열 한칸에서 게시판 글하나 가져오기
			BoardBean bb = (BoardBean)boardList.get(i);
		%>
		<tr>
			<td><%=bb.getNum()%></td>
			<td><a href="content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td>
			<td><%=bb.getContent()%></td>
			<td><%=bb.getDate()%></td>
			<td><%=bb.getReadcount()%></td>
		</tr>
		
		
<!-- 		<tr> -->
<%-- 			<td><%=bb.getNum()%></td> --%>
<%-- 			<td><a href="content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td> --%>
<%-- 			<td><%=bb.getName()%></td> --%>
<%-- 			<td><%=bb.getContent()%></td> --%>
<%-- 			<td><%=bb.getReadcount()%></td> --%>
<!-- 		</tr> -->
		<%
			}
		%>
	</table>
</body>
</html>