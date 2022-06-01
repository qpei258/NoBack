<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style type="text/css">
		#board {
			margin:10px auto;
    		width: 1258px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    	
    	a{
    		text-decoration: none;
    		color: rgb(80, 80, 80);
    	}
    	
    	a:hover {
			color: rgb(20, 20, 20);
		}
	</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="board">
	        	<h2 style="margin: 40px 0px 30px 0px;">게시글</h2>
        		<table  class="table" style="width: 90%;font-size: 20px;margin: 0px auto 0px auto; border-spacing: 0; height: 600px;">
        			<thead style="text-align: left;">
        				<tr style="background-color: rgb(200, 200, 200);">
        					<th style="padding-left: 20px;">${board.board_title }</th>
        				</tr>
        			</thead>
        			<tbody style="background-color: white;" >
        				<tr style="text-align: right; height: 40px;">
        					<td><b>작성자</b> ${board.board_writer_name } || <b>작성일</b> ${board.board_date }</td>
        				</tr>
        				<tr style="text-align: left;">
        					<td><pre>${board.board_content }</pre></td>
        				</tr>
        			</tbody>
        		</table>
        		<div style="float: right; border: 1px solid rgb(238, 238, 238); margin-right: 60px;">
        			<c:if test="${LoginId == board.board_writer || LoginLevel >= 3 }">
        				<form action="boardUpdate" method="post" style="display: inline-block;">
        					<input type="hidden" value="${board.board_num }" name="board_num">
	        				<button type="submit" class="btn btn-primary" onclick="">수정</button>
	        			</form>
	        			<form action="boardDelete" method="post" style="display: inline-block;">
		        			<input type="hidden" value="${board.board_num }" name="board_num">
		        			<button type="submit" class="btn btn-outline-secondary" onclick="">삭제</button>
	        			</form>
        			</c:if>
        		</div>
        	</div>
        </div>
    </div>
</body>
</html>