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
	        	<h2 style="margin: 100px 0px 30px 0px;">게시글 쓰기</h2>
        		<form action="boardWrite" method="post">
	        		<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 0px auto;">
					  	<span class="input-group-text" id="basic-addon1">제목</span>
					  	<input type="text" class="form-control" placeholder="" aria-label="title" aria-describedby="basic-addon1" name="board_title">
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >내용</span>
						 <textarea class="form-control" aria-label="With textarea" style="height: 500px; resize: none;" name="board_content"></textarea>
						 
					</div>
					<div style="border: 1px solid rgb(238, 238, 238);">
						<button type="submit" class="btn btn-primary">글쓰기</button>
					</div>
				</form>
        	</div>
        </div>
    </div>
</body>
</html>