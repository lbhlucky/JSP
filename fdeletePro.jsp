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
<%
//center/fdeletePro.jsp
// 파라미터 가져오기  num ,pass
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
//BoardBean bb 객체생성
BoardBean bb=new BoardBean();
//bb멤버변수 <- 파라미터 값 저장
bb.setNum(num);
bb.setPass(pass);
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//  int check= numCheck(bb) 만들고 호출
int check=bdao.numCheck(bb);
//  check==1   리턴값없음 deleteBoard(bb) 메서드만들고 호출 notice.jsp이동
//  check==0  "비밀번호틀림" 뒤로이동
//  check=-1  "num 없음" 뒤로이동
if(check==1){
	bdao.deleteBoard(bb);
	response.sendRedirect("fnotice.jsp");
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back(); // 뒤로이동 
	</script>	
	<%
}else{
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



