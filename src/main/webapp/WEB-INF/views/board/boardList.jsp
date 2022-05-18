<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/blog/resources/css/default.css" />
    <style type="text/css">
    	#boardList{
    		margin:10px auto;
    		width: 1258px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    	table {
    		width: 90%;
    		height: 80%;
    		font-size: 20px;
    		margin: 10px auto;
    		border: 1px solid rgb(80, 80, 80);
    		border-spacing: 0;
    		
    	}
    	tr, th{
    		border-bottom: 1px solid rgb(80, 80, 80);
    		height: 40px;
    	}
    </style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="boardList">
        		<h3 style="margin: 15px;">자유게시판</h3>
        		
        		<table>
        			<tr>
        				<th>글번호</th>
        				<th>제목</th>
        				<th>작성일</th>
        				<th>작성자</th>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        			<tr>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td></td>
        			</tr>
        		</table>
        	</div>
        </div>
    </div>
</body>
</html>