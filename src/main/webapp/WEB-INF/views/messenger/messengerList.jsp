<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />
    <style type="text/css">
    	
    	#both{
    	display:flex
    	}
    	
    	
    	#boardList{
    		margin:10px auto;
    		width: 620px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    	
    	

    
    </style>
    <!-- 페이지 이동 스크립트  -->
	<script>
		function pagingFormSubmit(currentPage) {
			var form = document.getElementById('pagingForm');
			var page = document.getElementById('page');
			page.value = currentPage;
			form.submit();
		
			function chatPopup() { //팝업 기능 추가 작업중
				let sign_receiver2 = document.getElementById('sign_receiver2'); 
				if (sign_receiver2.value != '') {
				document.getElementById('target_btn4').disabled = false;
				window.open('check3', 'receiver', 'top=400,left=600,width=500,height=400,location=no,status=no');
				}
		
		
		
		
		
		}
	</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        <div id="both">
        	<div id="boardList">
        		<h2 style="margin: 40px 0px 10px 0px;">신규 메세지</h2>
        		<div style="float: left; margin-bottom: 10px ; margin-left: 63px;  border: 0px;">
        		</div>
        		<div style="float: right; margin-bottom: 0px; margin-right: 62px; border: 0px; height: 50px;">
				<!-- 검색폼 -->
				<form id="pagingForm" method="get" action="messengerList" >
					<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238);">
						 <input type="text" class="form-control" placeholder="내용 검색" aria-label="Search1" aria-describedby="button-addon2" id="search1" name="search1" >
						 <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="pagingFormSubmit(1)">검색</button>
					</div>
					<input type="hidden" name="page" id="page" />
				</form>
				<!-- /검색폼 -->
				</div>
				<table class="table table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
        					<th style="width: 15%;">발신인</th>
	        				<th style="width: 60%;">내용</th>
	        				<th style="width: 15%;">작성일</th>
        				</tr>
				  	</thead>
				  	<tbody>
						  <c:forEach var="messenger" items="${messengerlist}">
						  <!--<input type="hidden" name="recieveId" value="${messenger.employee_num}">-->
						  	<tr style="background-color: white;" onclick="location.href='chat?num=${messenger.employee_num}'">
								
						  		<td>${messenger.messenger_writer_name }</td>
						  		<td>${messenger.messenger_content}</td>
						  		<td>${messenger.messenger_date }</td>
						  		
						  	</tr>
						  </c:forEach>
				  </tbody>
				</table>
        		<div id="navigator" style="border: 0px; font-size: 20px;">
				<!-- 페이지 이동 부분 -->                      
					<a href="javascript:pagingFormSubmit(${navi1.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi1.currentPage - 1})">◀</a> &nbsp;&nbsp;&nbsp;
				
					<c:forEach var="counter" begin="${navi1.startPageGroup}" end="${navi1.endPageGroup}"> 
						<c:if test="${counter == navi1.currentPage}"><b></c:if>
							<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
						<c:if test="${counter == navi1.currentPage}"></b></c:if>
					</c:forEach>
					&nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi1.currentPage + 1})">▶</a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi1.currentPage + navi1.pagePerGroup})">▷▷</a>
				
				<!-- /페이지 이동 끝 -->                      
			
				</div>
        	</div>
        	<div id="boardList">
        		<h2 style="margin: 40px 0px 10px 0px;">사용자 목록</h2>
        		
        		<div style="float: right; margin-bottom: 0px; margin-right: 62px; border: 0px; height: 50px;">
				<!-- 검색폼 -->
				<form id="pagingForm" method="get" action=messengerList >
					<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238);">
						 <input type="text" class="form-control" placeholder="이름 검색" aria-label="Search2" aria-describedby="button-addon2" id="search2" name="search2" >
						  <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="pagingFormSubmit(1)">검색</button>
					</div>
					<input type="hidden" name="page" id="page" />
				</form>
				<!-- /검색폼 -->
				</div>
				<table class="table table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
        					<th style="width: 15%;">이름</th>
	        				<th style="width: 20%;">부서</th>
	        				<th style="width: 20%;">위치</th>
	        				<th style="width: 45%;">이메일</th>
        				</tr>
				  	</thead>
				  	<tbody>
						  <c:forEach var="member" items="${memberlist}">
						  <!--<input type="hidden" name="recieveId" value="${messenger.employee_num}">-->
						  	<tr style="background-color: white;" onclick="location.href='chat?num=${member.employee_num}'">
						  		<td>${member.employee_name }</td>
						  		<td>${member.employee_dep }</td>
						  		<td>${member.employee_pos }</td>
						  		<td>${member.employee_email}</td>
						  	</tr>
						  </c:forEach>
				  </tbody>
				</table>
        		<div id="navigator" style="border: 0px; font-size: 20px;">
				<!-- 페이지 이동 부분 -->                      
					<a href="javascript:pagingFormSubmit(${navi2.currentPage - navi2.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi2.currentPage - 1})">◀</a> &nbsp;&nbsp;&nbsp;
				
					<c:forEach var="counter" begin="${navi2.startPageGroup}" end="${navi2.endPageGroup}"> 
						<c:if test="${counter == navi2.currentPage}"><b></c:if>
							<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
						<c:if test="${counter == navi2.currentPage}"></b></c:if>
					</c:forEach>
					&nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi2.currentPage + 1})">▶</a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi2.currentPage + navi.pagePerGroup})">▷▷</a>
				
				<!-- /페이지 이동 끝 -->                      
			
				</div>
        	</div>
        	</div><%--여기가 임시 --%>
        </div>
    </div>
</body>
</html>