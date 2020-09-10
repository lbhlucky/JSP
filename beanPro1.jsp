<%@page import="jsp6.BeanDB"%>
<%@page import="jsp6.BeanTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0908 자바빈</title>
</head>
<body>
<h1>WebContent/jsp6/beanPro1.jsp</h1>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");

	// String name, int num 파라미터 가져오기
	String name = request.getParameter("name");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 하나의 바구니(name, num) 담아서 전달 => 자바빈(JavaBean), JavaDTO(Data Transfer Object)
	// 패키지(jsp6) 생성 -> 자바파일(BeanTest1) 생성 
	// => JavaResourceㄴ/src에 생성 - main 안만듦
	// BeanTest1클래스(정의만 되있음) -> 사용하기 위해 객체생성(기억장소 할당)
	// bt = BeanTest1 기억장소에 할당해서 기억장소 주소 저장
	BeanTest1 bt = new BeanTest1();
	
	// 파라미터 name, num -> BeanTest1 멤버변수 name, num에 저장
// 	bt.name = name;	// private 접근자로 외부 접근 금지(데이터 은닉)시켰기 때문에 접근 불가
// 	bt.num = num;	// private 접근자로 외부 접근 금지(데이터 은닉)시켰기 때문에 접근 불가
	bt.setName(name);
	bt.setNum(num);
	
	// db작업 => 자바파일 메서드 호출(하나의 바구니) => insert 작업
	// db작업 패키지 jsp6 파일이름 BeanDB 생성
	// BeanDB 사용하기 위해 객체생성
	BeanDB bdb = new BeanDB();
	
	// insert() 메서드 호출
	bdb.insert(bt);
	
	
%>
</body>
</html>