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
    		font-size: 20px;
    		margin: 10px auto;
    		
    		border-spacing: 0;
    	}
    	th{
    		background-color: rgb(200, 200, 200);
    		
    		height: 55px;
    	}
    	th:last-child {
    		border-bottom: 0px solid rgb(80, 80, 80);
    	}
    	td {
    		background-color: rgb(250, 250, 250);
    		height: 55px;
    	}
    </style>
    <!-- 페이지 이동 스크립트  -->
	<script>
		function pagingFormSubmit(currentPage) {
			var form = document.getElementById('pagingForm');
			var page = document.getElementById('page');
			page.value = currentPage;
			form.submit();
		}
	</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="boardList">
        		<h2 style="margin: 40px 0px 10px 0px;">자유게시판</h2>
        		<div style="float: left; margin-bottom: 5px ; margin-left: 63px;  border: 0px;">
        			<button type="button" class="btn btn-outline-primary">글쓰기</button>
        		</div>
        		<div style="float: right; margin-bottom: 5px; margin-right: 62px; border: 0px; height: 50px;">
				<!-- 검색폼 -->
				<form id="pagingForm" method="get" action="list" >
					<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238);">
						 <input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2" id="search" name="search" >
						 <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="pagingFormSubmit(1)">검색</button>
					</div>
					<input type="hidden" name="page" id="page" />
				</form>
				<!-- /검색폼 -->
				</div>
				<table>
				  	<thead>
				      	<tr>
        					<th style="width: 10%;">글번호</th>
	        				<th style="width: 60%;">제목</th>
	        				<th style="width: 15%;">작성일</th>
	        				<th style="width: 15%;">작성자</th>
        				</tr>
				  	</thead>
				  	<tbody>
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
				  </tbody>
				</table>
        		<div id="navigator" style="border: 0px; font-size: 20px;">
				<!-- 페이지 이동 부분 -->                      
					<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;&nbsp;
				
					<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
						<c:if test="${counter == navi.currentPage}"><b></c:if>
							<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
						<c:if test="${counter == navi.currentPage}"></b></c:if>
					</c:forEach>
					&nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
				
				<!-- /페이지 이동 끝 -->                      
			
				</div>
        	</div>
        </div>
    </div>
</body>
</html>