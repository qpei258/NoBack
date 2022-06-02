<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>[사원 등록]</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/default.css"/>' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">

/*회색 배경*/
.square {
	margin: 10px auto;
	width: 1258px;
	height: 797px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
}


/* 페이지 */
a{
	text-decoration: none;
	color: rgb(80,80,80);
}
 
a:hover {
	color: rgb(20, 20, 20);
}

</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	
</script>
<script>
<!-- 페이지 이동 스크립트  -->
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
		/* 수정 팝업창 실행 */
		function memberlistupdate(num) {
			var che = confirm("수정 하시겠습니까?");
			
			if(che){
				window.open('memberlistupdate?employee_num='+ num, 'win', 'top=200,left=500,width=563,height=458,location=no,status=no');
			}
		}
		
		function memberdelete(num) {
			var che = confirm("삭제 하시겠습니까?");
			
			if(che){
				location.href='memberdelete?employee_num=' + num;
			}
		}
	</script>
<script type="text/javascript">
function f_enterLogin() {
	if(window.event.keyCode==13){
		f_loginCheck();
	}
}
</script>
</head>
<body>
	<div id="container">
		<%@ include file="../sidebar.jsp"%>
		<div id="content">
			<!-- 상단 메뉴 -->
			<ul class="nav nav-tabs" style="margin: 10px;">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href='<c:url value="../manager/join"/>'>사원 등록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link  active" href='<c:url value="../manager/memberlist"/>'>사원 리스트</a>
			  </li>
			</ul>
			<!-- 회색 배경  -->
			<div class='square'>
					<h2 style="margin: 40px 0px 10px 0px;">사원리스트</h2>
        		<div style="float: right; margin-bottom: 0px; margin-right: 62px; border: 0px; height: 50px;">
				<!-- 검색폼 -->
				<form id="pagingForm" method="get" action="memberlist" >
					<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238);">
						 <input type="text" class="form-control" placeholder="사원이름" aria-label="Search" aria-describedby="button-addon2" id="search" name="search" onkeyup="f_enterLogin()">
						 <button class="btn btn-outline-secondary" type="submit" id="button-addon2" href="javascript:f_loginCheck();">검색</button>
					</div>
					<input type="hidden" name="page" id="page" />
				</form>
				<!-- /검색폼 -->
				</div>
				<!-- 사원 전체 리스트 -->
				<table class="table table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
        					<th style="width: 10%;">사원번호</th>
	        				<th style="width: 10%;">이름</th>
	        				<th style="width: 12%;">이메일</th>
	        				<th style="width: 12%;">부서</th>
	        				<th style="width: 10%;">직함</th>
	        				<th style="width: 10%;">권한</th>
	        				<th style="width: 5%;">수정</th>
	        				<th style="width: 5%;">삭제</th>
        				</tr>
				  	</thead>
				  	<tbody>
						  <c:forEach var="member" items="${memberlist}">
						  	<tr style="background-color: white;">
						  		<td>${member.employee_num}</td>
						  		<td>${member.employee_name}</td>
						  		<td>${member.employee_email}</td>
						  		<td>${member.employee_dep}</td>
						  		<td>${member.employee_pos}</td>
						  		<td>${member.employee_level}</td>
						  		<td><button id="update_btn" onclick="memberlistupdate('${member.employee_num}')">수정</button></td>
							  	<td><button id="delete_btn" onclick="memberdelete('${member.employee_num}')">삭제</button></td>	
						  	</tr>
						  </c:forEach>
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