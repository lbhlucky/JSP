<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="com.sun.corba.se.spi.activation.Repository"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0914 게시판</title>
</head>
<body>
<h1>WebContent/board/writePro.jsp</h1>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");
	
	// name, pass, subject, content 파라미터 가져오기
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	// int readcount =  0
	int readcount = 0;
	// date = 현시스템에 날짜시간가져오기(타임스탬프)
	Timestamp date=new Timestamp(System.currentTimeMillis());
	
// 게시판 글을 저장할 하나의 바구니(Javabean)에 저장
// 패키지 board 파일명 BoardBean
// num, name, pass, subject, content, readcount, date 변수지정
// BoardBean 객체생성(bb)
	BoardBean bb = new BoardBean();
// bb에서 setter() 호출 <- 파라미터 값저장
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	bb.setReadcount(readcount);
	bb.setDate(date);

// 게시판 데이터베이스작업
// 패키지 board 파일명 BoardDAO 
// insertBoard(bb바구니주소값)메서드 정의, 리턴값 없음
// BoardDAO bdao 객체생성
	BoardDAO bdao = new BoardDAO();
// insertBoard(bb바구니주소값)메서드 호출
	bdao.insertBoard(bb);
	
	
	//1단계 드라이버
// 	Class.forName("com.mysql.jdbc.Driver");
	
// 	//2단계 db 연결
// 	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
// 	String dbUser = "jspid";
// 	String dbPass = "jsppass";
	
// 	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 	// 3단계 num구하기 : 기존글에서 최대 num 값을 구해서 +1
// 	String sql = "select MAX(num) from board";	// max(num)은 무조건 결과값이 있음
// 	PreparedStatement pstmt = con.prepareStatement(sql);
	
// 	// 4단계 실행 => rs 저장
// 	ResultSet rs = pstmt.executeQuery();
	
// 	// 5단계 rs첫행이동 max(num) 가져오기 +1
// 	int num=0;
// 	if(rs.next()){
	
// 		num = rs.getInt("max(num)")+1;
		
// 	}
	
// 	//3단계	(insert)
// 	sql = "insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)";
// 	pstmt = con.prepareStatement(sql);
// 	pstmt.setInt(1, num);
// 	pstmt.setString(2, name);
// 	pstmt.setString(3, pass);
// 	pstmt.setString(4, subject);
// 	pstmt.setString(5, content);
// 	pstmt.setInt(6, readcount);
// 	pstmt.setTimestamp(7, date);
	
// 	//4단계 실행
// 	pstmt.executeUpdate();

	response.sendRedirect("list.jsp");
	
%>

</body>
</html>