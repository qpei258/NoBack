<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>전자결제 메인화면</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		<nav class="nav">
       		<a class="nav-link active" href='<c:url value="/schedule/schedule"/>' style="font-weight: bold;" >전자결제 홈</a>
		</nav>
        <div id="content">
        <div class="p-3 mb-2 bg-primary text-white"><li><a href= '<c:url value="main"/>' style="text-decoration:none; color: white">1.결제내역리스트</a></li></div>
        <div class="p-3 mb-2 bg-primary text-white"><li><a href='<c:url value="sdelay"/>'style="text-decoration:none; color: white">2.결제대기중인 서류 리스트</a></li></div>
        <div class="p-3 mb-2 bg-primary text-white"><li><a href='<c:url value="swrite"/>'style="text-decoration:none; color: white" >3.결제서류 작성</a></li></div>
        </div>
    </div>
</body>
</html>
