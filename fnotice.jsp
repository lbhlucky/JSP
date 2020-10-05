<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="../center/fnotice.jsp">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
//BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//게시판 글 전체 개수   select count(*) from board
//int count = getBoardCount() 메서드 만들기 호출
int count=bdao.getBoardCount();
//한페이지에 보여줄 글개수 설정
int pageSize=15;
//현페이지 페이지번호 가져오기 
//http://localhost:8080/StudyJSP/board/list.jsp
//http://localhost:8080/StudyJSP/board/list.jsp?pageNum=7
//pageNum 파라미터 가져오기
String pageNum=request.getParameter("pageNum");
//pageNum없으면  "1" 페이지 설정
if(pageNum==null){
	pageNum="1";
}
//시작하는 행번호 구하기 
int currentPage=Integer.parseInt(pageNum);
//int startRow= currentPage  pageSize 이용해서 계산식 만들기
//currentPage  pageSize  => startRow 
//      1          10     =>  (1-1)*10+1=>0*10+1=> 0+1=> 1
//      2          10     =>  (2-1)*10+1=>1*10+1=>10+1=> 11
//      3          10     =>  (3-1)*10+1=>2*10+1=>20+1=> 21

int startRow= (currentPage-1)*pageSize+1;

//String sql="select * from board order by num desc limit ?,?";
//? startRow-1  ? pageSize
		
//List boardList   = getBoardList() 메서드 만들 호출
List boardList=bdao.getBoardList(startRow,pageSize);
// 날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%>
<!-- 게시판 -->
<article>
<h1>File Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    for(int i=0;i<boardList.size();i++){
    	BoardBean bb=(BoardBean)boardList.get(i);
    	%>
<tr onclick="location.href='fcontent.jsp?num=<%=bb.getNum()%>'">
  	<td><%=bb.getNum() %></td>
    <td class="left"><%=bb.getSubject() %>
    <img src="../upload/<%=bb.getFile()%>" width="50" height="50"></td>
    <td><%=bb.getName() %></td>
    <td><%=sdf.format(bb.getDate()) %></td>
    <td><%=bb.getReadcount() %></td></tr>
    	<%
    }
    %>
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" 
    onclick="location.href='fwriteForm.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
<%
//한화면에 보여줄  페이지 개수 설정
int pageBlock=10;
//시작하는 페이지번호 구하기
//페이지번호     pageBlock  => startPage
//1~10         10      =>   (0 ~ 9) /10*10+1=>0*10+1=>0+1=>1
//11~20        10      =>   (10~19)/10*10+1=>1*10+1=>10+1=>11
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지번호 구하기
//시작페이지번호  pageBlock => endPage
//   1           10    =>   10
//   11          10    =>   20
//   21          10    =>   30
int endPage=startPage+pageBlock-1;
//페이지번호 10까지 없을경우
//전체페이지수 구하기
//전체게시판글개수 / pageSize => pageCount
//count  12     /  pageSize 10 =>  1+1 => 2
//      19     /           10 =>  1+1  => 2
//      20     /           10 =>  2+0 => 2
//             count/pageSize 나머지 없으면 0페이지 더하고   나머지 있으면 1
int pageCount = count/pageSize +(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage=pageCount;
}
//이전
if(startPage > pageBlock){
	%><a href="fnotice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}	
for(int i=startPage;i<=endPage;i++){
	%><a href="fnotice.jsp?pageNum=<%=i %>"><%=i %></a> <%
}
//다음
if(endPage < pageCount){
	%><a href="fnotice.jsp?pageNum=<%=startPage+pageBlock%>">Next</a><%
}
%>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>