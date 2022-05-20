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
       			<a class="nav-link active" href='<c:url value="mypage/update"/>'>개인정보 수정</a>
       			<a class="nav-link" href='<c:url value="redirect:/"/>'>작성한 게시글 보기</a>
  				<a class="nav-link" href='<c:url value="mypage/schedule"/>'>작성한 스케줄 보기</a>
			</nav>
			
			<table>
				<tr>
					<th>번호</th>
					<th>작성일</th>
					<th style="width:220px">제목</th>	
				</tr>

				<!-- 반복 시작 -->
				<c:forEach var="board" items="${myboardlist}">
				<tr>
					<td class="center">${myboard.boardnum}</td>
					<td>
						<a href="read?boardnum=${myboard.boardnum}">${myboard.title}</a>
					</td>
					<td class="center">${myboard.id}</td>

				</tr>

				</c:forEach>        
				<!-- 반복 끝 -->
				</table>
			
			<div id="navigator">
			<!-- 페이지 이동 부분 -->                      
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
			
			
        </div> <!-- 컨텐츠 끝 -->
    </div> <!-- 컨테이너 끝 -->
</body>
</html>