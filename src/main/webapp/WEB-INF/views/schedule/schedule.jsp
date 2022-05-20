<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		
        <div id="content">
        
        <!-- 헤더 -->
		<nav class="navbar bg-light">
  			<div class="container-fluid">
    			<span class="navbar-brand mb-0 h1">사내일정</span>
  			</div>
		</nav>
		
			<!-- 달력 박스 -->
        	<div class="box">   	
        		<!-- 달력 -->	
        		<div class="calendar" style="width: 1000px;">
                    <div class="header">
                        <div class="year-month" style="color: rgb(108,117,125);"></div>
                        
                        <div class="nav">
                            <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                            <button class="nav-btn go-today" onclick="goToday()" style="line-height: 3px;">오늘</button>
                            <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                        </div>
                    </div>
                    <div class="main">
                        <div class="days">
                            <div class="day">일</div>
                            <div class="day">월</div>
                            <div class="day">화</div>
                            <div class="day">수</div>
                            <div class="day">목</div>
                            <div class="day">금</div>
                            <div class="day">토</div>
                        </div>
                        <div class="dates"></div>
                    </div>
                </div>
        		
        		
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
      				
      					<!-- 등록 내용 입력 -->
      					<div class="modal-body">
      					<label class="schedule_title">일정 제목</label>
  						<input type="text" class="form-control border-primary" id="add_title" placeholder="ex) 미팅">
					
						<label class="schedule_start">시작 날짜</label>
  						<input type="text" class="form-control border-primary" id="add_start" placeholder="ex) 2022-11-22 33-44">
  					
  						<label class="schedule_end">종료 날짜</label>
  						<input type="text" class="form-control border-primary" id="add_end" placeholder="ex) 2022-11-22 33-44">
  					
  						<label class="schedule_memo">메모</label>
  						<textarea rows="4" cols="50" class="form-control border-primary" name="edit-desc" id="add_memo" placeholder="ex) 무한상사"></textarea>
      					</div>
      				
      				<!-- 등록 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="button" class="btn btn-primary">추가</button>
      				</div>
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
  					<input type="text" class="form-control border-primary" id="update_start" placeholder="ex) 2022-11-22 33-44">
  					
  					<label class="schedule_end">종료 날짜</label>
  					<input type="text" class="form-control border-primary" id="update_end" placeholder="ex) 2022-11-22 33-44">
  					
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
        
        	</div> <!-- box 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>

<script src='resources/js/index.js'></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>

</html>