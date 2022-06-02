<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>내 게시글</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>
<style>

/*회색 배경*/
.square {
	margin: 10px auto;
	width: 1258px;
	height: 800px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
	padding-top : 10px;
	padding-left : 20px;
	padding-right : 20px;

}

/* 상단메뉴 */
.topmenu {
	border: 15px solid rgb(148, 202, 238);
	background-color: rgb(148, 202, 238);
	float: top;
	margin: 9px 9px;
	width: 1257px;
	height: 60px;
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
        
	      <!-- 상단 메뉴 -->
			<ul class="nav nav-tabs" style="margin: 10px;">
				 <li class="nav-item">
				    <a class="nav-link" href='<c:url value="update"/>'>개인정보 수정</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" href='<c:url value="board"/>'>작성한 게시글 보기</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href='<c:url value="scheduleByMonth?month=06"/>'>작성한 스케줄 보기</a>
				  </li>
			</ul> <!-- topmenu 끝 -->
			
			<!-- 회색 박스 -->
			<div class='square'>
				<div style=" margin-bottom: 0px; margin-right: 62px; border: 0px; height: 50px;">
					<form id="pagingForm" method="get" action="board" >
						<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238);margin: 50px auto 10px auto; width: 300px; float: right;">
							 <input type="text" class="form-control" placeholder="제목 검색" aria-label="Search" aria-describedby="button-addon2" id="search" name="searchText" >
							 <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="pagingFormSubmit(1)">검색</button>
						</div>
						<input type="hidden" name="page" id="page" />
					</form>
				</div>
				<form action="board" method="get">
					<table class="table table-hover" style="width: 90%;font-size: 20px;  border-spacing: 0; margin: 0px auto 10px auto;">
					  	<thead>
					      	<tr style="background-color: rgb(200, 200, 200);">
	        					<th style="width: 10%;">글번호</th>
		        				<th style="width: 60%;">제목</th>
		        				<th style="width: 15%;">작성일</th>
		        				<th style="width: 15%;">작성자</th>
	        				</tr>
					  	</thead>
					  	<tbody>
							  <c:forEach var="board" items="${boardlist }">
							  	<tr style="background-color: white;" onclick="location.href='board?num=${board.board_num}'">
							  		<td>${board.board_num }</td>
							  		<td>${board.board_title }</td>
							  		<td>${board.board_date }</td>
							  		<td>${board.board_writer_name}</td>
							  	</tr>
							  </c:forEach>
					  </tbody>
					</table>
	        		<div id="navigator" style="border: 0px; font-size: 20px; margin: 10px;">
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
				</form>
				
				
			</div> <!-- square 끝 -->
        </div> <!-- 컨텐츠 끝 -->
    </div> <!-- 컨테이너 끝 -->
</body>
</html>