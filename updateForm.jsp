<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
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
<jsp:include page="../inc/top.jsp"/>  <!-- ..으로 상위폴더, /로 하위폴더 -->
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="updateForm.jsp">modify</a></li>
<li><a href="deleteForm.jsp">delete</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>MODIFY</h1>
<%
		// String id = (String) 세션값가져오기
		// MemberDAO mdao 객체생성
		// MemberBean mb = getMember(id) 생성 및 호출

String id = (String)session.getAttribute("id");

if(id == null) {
	response.sendRedirect("login.jsp");
} 

// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();
// MemberBean bb = getMember(id) 메서드
	MemberBean mb = mdao.getMember(id);
%>
<form action="updatePro.jsp" id="join" method = "post" name ="fr">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" value = "<%=id %>" readonly> <br>
<!-- <input type="button" value="dup. check" class="dup"><br> -->
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name" value = "<%=mb.getName() %>"><br>
<label>E-Mail</label>
<input type="email" name="email" value = "<%=mb.getEmail() %>"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" value = "<%=mb.getEmail() %>"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address" value = "<%=mb.getAddress() %>"><br>
<label>Phone Number</label>
<input type="text" name="phone" value = "<%=mb.getPhone() %>"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value = "<%=mb.getMobile() %>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="modify" class="submit">
<input type="reset" value="cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>