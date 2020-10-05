<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
//center/fupdatePro.jsp
//한글처리
// request.setCharacterEncoding("utf-8");

//파일업로드 cos.jar 설치 
//MultipartRequest 객체생성
///upload  폴더만들기  물리적인 경로 가져오기
String uploadPath=request.getRealPath("/upload");
System.out.println(uploadPath);
//파일크기 10M
int maxSize=10*1024*1024;
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
//multi => num name pass subject content 파라미터 가져오기
int num=Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
//file 새롭게 추가 파일
String file=multi.getFilesystemName("file");
//새롭게 추가할 파일이 없으면  file 기존  파일이름
if(file==null){
	file=multi.getParameter("oldfile");
}

// BoardBean bb 객체생성
BoardBean bb=new BoardBean();
// bb멤버변수 <- 파라미터 값 저장
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
//파일추가
bb.setFile(file);

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//  int check= numCheck(bb) 만들고 호출
int check=bdao.numCheck(bb);
//  check==1   리턴값없음 updateBoard(bb) 메서드만들고 호출 notice.jsp이동
//  check==0  "비밀번호틀림" 뒤로이동
//  check=-1  "num 없음" 뒤로이동
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("fnotice.jsp");
}else if(check==0){
	//"비밀번호 틀림"
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back(); // 뒤로이동 
	</script>
	<%
}else{
	//"num없음" 
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




