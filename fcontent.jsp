<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>0914 게시판</title>
</head>
<body>
	<h1>WebContent/board/content.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");

	// num 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));

	// BoardDAO bdao 객체생성
	// getBoard(num) 메서드 정의, 리턴값(BoardBean) 후 호출
	BoardDAO bdao = new BoardDAO();
	
	BoardBean bb = bdao.getBoard(num);
	
// 	// 1단계 - 드라이버 가져오기
// 	Class.forName("com.mysql.jdbc.Driver");

// 	// 2단계 - db연결
// 	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
// 	String dbUser = "jspid";
// 	String dbPass = "jsppass";

// 	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
// 	// 3-1단계 - 조회수 1씩 증가(update) 로직
// 	String sql = "update board set readcount = readcount+1 where num=?";
// 	PreparedStatement p = con.prepareStatement(sql);
	
// 	p.setInt(1, num);
	
// 	p.executeUpdate();
// 	// 3-2단계 - select 구문 생성 
// 	//		   num에 해당하는 게시판 글 가져오기
// 	sql = "select * from board where num=?";
// 	p = con.prepareStatement(sql);

// 	p.setInt(1, num);

// 	// 4단계 실행
// 	ResultSet rs = p.executeQuery();

// 	// 5단계 출력 => if문 첫행 이동시 데이터있으면 열을 찾아서 출력
// 	if (rs.next()) {
	%>
	<table border="1">
		<tr>
			<td>글 번호</td><td><%=bb.getNum() %></td><td>글 쓴 날짜</td><td><%=bb.getDate()%></td>
		</tr>
		<tr>
			<td>작성자</td><td><%=bb.getName() %></td><td>조회 수</td><td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
			<td>제목</td><td colspan="3"><%=bb.getSubject()%></td>
		</tr>
		<tr>
			<td>파일</td><td colspan="3"><%=upload/bb.getFile()%></td>
		</tr>
		<tr>
			<td>글 내용</td><td colspan="3"><%=bb.getContent() %></td>
		</tr>
		<tr>
			<td colspan="4"><input type="button" value = "글 수정" onclick="location.href = 'updateForm.jsp?num=<%=bb.getNum()%>'">
			<input type="button" value = "글 삭제" onclick="location.href = 'deleteForm.jsp?num=<%=bb.getNum()%>'">
			<input type="button" value = "글 목록" onclick="location.href = 'list.jsp'"></td>
		</tr>
	</table>
	<%
// 		}
	%>
</body>
</html>