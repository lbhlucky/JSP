<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0825 deletes</title>
</head>
<body>
	<h1>WebContent/jsp3/deleteForm.jsp</h1>
<form action="deletePro.jsp" method = "post">
삭제할 학생 번호 : <input type="text" name = "num"> <br> 
삭제할 학생 이름 : <input type="text" name = "name"> <br> 
<input type="submit" value = "학생삭제">
</form>

</body>
</html>