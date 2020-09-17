<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더가 들어가는 곳 -->
<header>
<%
	// String id = (String) 세션값 가져오기
	// if(세션값있으면)
	String id = (String)session.getAttribute("id");
	
	if (id != null) {
		%>
		<div id="login"><a href="../member/logout.jsp">logout</a> | <a href="../member/updateForm.jsp">modify</a></div>
		<div class="clear"></div>
		<%

	} else {
		%>
		<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
		<div class="clear"></div>
		<%
	}

%>
<!-- <div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div> -->
<!-- <div class="clear"></div> -->
<!-- 로고들어가는 곳 -->
<a href = "../main/main.jsp"><div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div></a>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>
<!-- 헤더가 들어가는 곳 -->