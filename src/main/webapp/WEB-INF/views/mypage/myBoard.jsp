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
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        
        	<!-- 상단바  -->
       		<nav class="nav">
       			<a class="nav-link active" href='<c:url value="../mypage/update"/>'>개인정보 수정</a>
       			<a class="nav-link" href='<c:url value="board"/>'>작성한 게시글 보기</a>
  				<a class="nav-link" href='<c:url value="../mypage/schedule"/>'>작성한 스케줄 보기</a>
			</nav>
			
			<form action="board" method="get">
			<table>
				<tr>
					<th>번호</th>
					<th style="width:500px">제목</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>1</td>
					<td>제목</td>
					<td>2022-05-04</td>
					<td>관리자</td>
				</tr>
				
				<!-- 반복 시작 -->
				<c:forEach var="board" items="${boardlist}">
				<tr onclick="location.href='board?num=${boardlist.board_num}'">
					<td class="center">${boardlist.board_num}</td>
					<td>${boardlist.board_title}</td>
					<td>${boardlist.board_writer}</td>
					
					<!-- 
					<td>
						<a href="read?boardnum=${board.board_num}">${board.board_title}</a>
					</td>
					<td class="center">${board.board_writer}
					</td>
					 -->

				</tr>

				</c:forEach>        
				<!-- 반복 끝 -->
				</table>
				</form>
			
			<!-- 페이지 이동 부분 -->  
			<div id="navigator">
			                    
				<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

				<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
					<c:if test="${counter == navi.currentPage}"><b></c:if>
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
					<c:if test="${counter == navi.currentPage}"></b></c:if>
				</c:forEach>
				
				&nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
				<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
			</div>	<!-- /페이지 이동 끝 -->  
			
			
			<div aria-label="Page navigation example">
     			<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" 
     					aria-label="Previous">
      				 <span aria-hidden="true">&laquo;</span>
    			</a>
    		
    				
     			<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})" 
     				aria-label="Previous">
      			<span aria-hidden="true">&laquo;</span>
    			</a>
    				
    			<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
					<c:if test="${counter == navi.currentPage}"><b></c:if>
						<a class="page-link"  href="javascript:pagingFormSubmit(${counter})">${counter}</a>
					<c:if test="${counter == navi.currentPage}"></b></c:if>
				</c:forEach>
    				
    		
      			<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + 1})" 
      			aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		
      			<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" 
      			aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
			</div>
			
			
			<nav aria-label="Page navigation example">
  				<ul class="pagination">
    				<li class="page-item">
      				<a class="page-link" href="#" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    				</li>
    				<li class="page-item"><a class="page-link" href="#">1</a></li>
   				 	<li class="page-item"><a class="page-link" href="#">2</a></li>
   					 <li class="page-item"><a class="page-link" href="#">3</a></li>
   					<li class="page-item">
    			 		 <a class="page-link" href="#" aria-label="Next">
   		 			    <span aria-hidden="true">&raquo;</span>
    				  </a>
    				</li>
  				</ul>
				</nav>
			
			
			<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="list">
				<input type="hidden" name="page" id="page" />
				제목 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form>
			<!-- /검색폼 --> 
			
        </div> <!-- 컨텐츠 끝 -->
    </div> <!-- 컨테이너 끝 -->
</body>
</html>