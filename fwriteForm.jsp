<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0914 게시판</title>
</head>
<body>
	<h1>WebContent/board/writeForm.jsp</h1>
	<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>글 쓴 이</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name ="content" rows="10" cols="20"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>