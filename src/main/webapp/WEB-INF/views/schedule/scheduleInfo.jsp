<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	String sessionId = (String)(session.getAttribute("LoginId"));
	String sessionLv = (String)(session.getAttribute("LoginLv"));

	System.out.println(sessionId);	

	if(sessionId == null || sessionId.equals("null")){	
		//out.println("<script>alert('로그인 해주세요');location.href='login.jsp';</script>");
	response.sendRedirect("home.jsp");
	}
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<title>사내일정</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/calendar.css"/>' />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>

	.border {
		border: 1px solid white;
	}
	
	.box {
		margin: 10px auto;
		width: 1258px;
		height: 800px;
		color: rgb(80, 80, 80);
		border: white;
		
	}
	
	div {
		border: white;
	}
	
	.calendar {
		font-size: 1px;
		border: white;
	}
	
	.header {
		font-size: 1px;
		border: white;
	}
	
</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		
        <div id="content">
        
        <!-- 헤더 -->
		<nav class="nav">
       		<a class="nav-link active" href='<c:url value="/schedule/schedule"/>'>사내일정</a>
		</nav>
	
	
				<h6>${schedule.schedule_num}</h6>
				<h6>${schedule.schedule_title}</h6>
				<h6>${schedule.schedule_start}</h6>
				<h6>${schedule.schedule_end}</h6>
				<h6>${schedule.schedule_writer}</h6>
				<h6>${schedule.schedule_level}</h6>
		
       
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
<script type="text/javascript" src='/group/resources/js/index.js'></script>
<script type="text/javascript" src="/group/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>

</html>