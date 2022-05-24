<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	String sessionId = (String)(session.getAttribute("LoginId"));
	String sessionLv = (String)(session.getAttribute("LoginLv"));

	System.out.println(sessionId);	

	if(sessionId == null || sessionId.equals("null")){	
		//out.println("<script>alert('로그인 해주세요');location.href='login.jsp';</script>");
	response.sendRedirect("home.jsp");
	}
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<title>사내일정</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/calendar.css"/>' />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script>
	
</script>

<style>

	.border {
		border: 1px solid white;
	}
	
	.box {
		margin: 10px auto;
		width: 1258px;
		height: 800px;
		color: rgb(80, 80, 80);
		border: white;
		
	}
	
	div {
		border: white;
	}
	
	.calendar {
		font-size: 1px;
		border: white;
	}
	
	.header {
		font-size: 1px;
		border: white;
	}
	
	th {
		text-align: center;
	}
	
	table {
		border: 1px solid black;
		text-align: center;	
	}
	
</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		
        <div id="content">
        
        <!-- 헤더 -->
		<nav class="nav">
       		<a class="nav-link active" href='<c:url value="/schedule/schedule"/>'>사내일정</a>
		</nav>
		
		<h1>현재 로그인 아이디 : ${LoginId}</h1>
		<h1>현재 로그인 권한 : ${LoginLv}</h1>
		
		<form action="schedule" method="get">
			<table>
				<tr>
					<th>번호</th>
					<th style="width:300px">제목</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>메모</th>
					<th>작성자</th>
					<th>권한</th>
				</tr>
				
				<!-- 반복 시작 -->
				<c:forEach var="schedule" items="${scheduleList}">
				<tr onclick="location.href='scheduleInfo?schedule_num=${schedule.schedule_num}'">
					<td class="center">${schedule.schedule_num}</td>
					<td>${schedule.schedule_title}</td>
					<td>${schedule.schedule_start}</td>
					<td>${schedule.schedule_end}</td>
					<td>${schedule.schedule_writer}</td>
					<td>${schedule.schedule_level}</td>
				</tr>
				</c:forEach>   <!-- 반복 끝 -->     
				
				
				</table>
				</form>
        		
        		
      		<!-- 모달 버튼 (일정 등록)  -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
  			일정 추가
			</button>

			<!-- 모달 처리 (일정 등록) -->
			<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="addModalLabel">일정 추가</h5>
        						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
      					</div>
      				
      				<form action="add" method="post" onsubmit ="return validation()">
      				
      					<!-- 등록 내용 입력 -->
      					<div class="modal-body">
      					<label class="schedule_writer">아이디</label>
  						<input type="text" class="form-control border-primary" name="schedule_writer" id="add_writer" />
  					
  						<label class="schedule_level">권한</label>
  						<input type="text" class="form-control border-primary" name="schedule_level" id="add_level"/>
  					
  					
      					<label class="schedule_title">일정 제목</label>
  						<input type="text" class="form-control border-primary" name="schedule_title" id="add_title" placeholder="ex) 미팅">
					
						<label class="schedule_start">시작 날짜</label>
  						<input type="text" class="form-control border-primary" name="schedule_start" id="add_start" placeholder="ex) 2022-11-22">
  					
  						<label class="schedule_end">종료 날짜</label>
  						<input type="text" class="form-control border-primary" name="schedule_end" id="add_end" placeholder="ex) 2022-11-22">
  					
  						<label class="schedule_memo">메모</label>
  						<textarea rows="4" cols="50" class="form-control border-primary" name="schedule_memo" id="add_memo" placeholder="ex) 무한상사"></textarea>
      					</div>
      				
      				
      				<!-- 등록 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="submit" class="btn btn-primary" >추가</button>
      				</div>
      				
      				</form>
    			</div>
  			</div>
		</div> <!-- 등록 모달 끝  -->
		
		
		<!-- 모달 버튼 (일정 수정/삭제) -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">
  			일정 수정
		</button>

		<!-- 모달 처리  (일정 수정/삭제) -->
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="updateModalLabel">일정 수정</h5>
        					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
      				</div>
      				
      				<!-- 수정 내용 입력 -->
      				<div class="modal-body">
      				<label class="schedule_title">일정 제목</label>
  					<input type="text" class="form-control border-primary" id="update_title" placeholder="ex) 미팅">
					
					<label class="schedule_start">시작 날짜</label>
  					<input type="text" class="form-control border-primary" id="update_start" placeholder="ex) 2022-11-22">
  					
  					<label class="schedule_end">종료 날짜</label>
  					<input type="text" class="form-control border-primary" id="update_end" placeholder="ex) 2022-11-22">
  					
  					<label class="schedule_memo">메모</label>
  					<textarea rows="4" cols="50" class="form-control border-primary" name="edit-desc" id="update_memo" placeholder="ex) 무한상사"></textarea>
      				</div>
      				
      				<!-- 수정 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="button" class="btn btn-primary">수정</button>
        				<button type="button" class="btn btn-danger">삭제</button>
      				</div>
    			</div>
  			</div>
		</div> <!-- 수정 모달 끝  -->
        
        	<!-- 검색폼 -->
			<form id="pagingForm" method="get" action="list">
				<input type="hidden" name="page" id="page" />
				제목 : <input type="text"  name="searchText" value="${searchText}" />
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
			</form>
			<!-- /검색폼 --> 
			
			
        	</div> <!-- box 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>

<script type="text/javascript">    

	function validation() {

		let ttl = document.getElementById('add_title');
		let sta = document.getElementById('add_start');
		let end = document.getElementById('add_end');
		let memo = document.getElementById('add_memo');
		
		
		if (ttl.value == ''){
			alert('제목을 입력하세요.');
			return false;
		} else if (sta.value == ''){
			alert('시작날짜를 입력하세요.');
			return false;
		} else if (end.value == ''){
			alert('종료날짜를 입력하세요.');
			return false;
		} else if (memo.value == ''){
			alert('내용을 입력하세요.');
			return false;
		}		
		
		alert('등록 완료되었습니다.');
		location.href = 'schedule/schedule';
		return true;
	}

</script>

</html>