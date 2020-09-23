<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- board/updatePro.jsp -->
<%
//한글처리
request.setCharacterEncoding("utf-8");
// num name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardBean bb 객체생성
BoardBean bb=new BoardBean();
// bb멤버변수 <- 파라미터 값 저장
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//  int check= numCheck(bb) 만들고 호출
int check=bdao.numCheck(bb);
//  check==1   리턴값없음 updateBoard(bb) 메서드만들고 호출 list.jsp이동
//  check==0  "비밀번호틀림" 뒤로이동
//  check=-1  "num 없음" 뒤로이동
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("list.jsp");
}else if(check==0){
	//"비밀번호 틀림"
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back(); // 뒤로이동 
	</script>
	<%
}else{
	//"아이디없음" 
	%>
	<script type="text/javascript">
			alert("num 없음");
			history.back(); // 뒤로이동 
	</script>
	<%
}
%>

</body>
</html>

