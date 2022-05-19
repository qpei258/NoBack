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
    <link rel="stylesheet" type="text/css" href="/blog/resources/css/default.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
    	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- 캘린더 css,js 불러오기 -->
	<link rel='stylesheet' href='resources/css/calendar.css' />
    <script src='resources/js/calendar.js'></script>
	<script>
	
	<!-- fullcalendar 사용해서 캘린더 출력 --> 
	document.addEventListener('DOMContentLoaded', function() {
      	var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	initialView: 'dayGridMonth',  // 초기 이벤트 설정
			events: [{
  				title:'휴가',
				start:'2022-05-07',
 				end:'2022-05-10'
			}],
			locale: "ko", //한글 설정
			editable: true
          
		});
        calendar.render();
      });
      
    </script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
	</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		
        <div id="content">
        
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
  					<input type="text" class="form-control border-primary" id="schedule_title" placeholder="ex) 미팅">
					
					<label class="schedule_start">시작 날짜</label>
  					<input type="text" class="form-control border-primary" id="schedule_start" placeholder="ex) 2022-11-22 33-44">
  					
  					<label class="schedule_end">종료 날짜</label>
  					<input type="text" class="form-control border-primary" id="schedule_end" placeholder="ex) 2022-11-22 33-44">
  					
  					<label class="schedule_memo">메모</label>
  					<textarea rows="4" cols="50" class="form-control border-primary" name="edit-desc" id="schedule_memo" placeholder="ex) 무한상사"></textarea>
      				</div>
      				
      				<!-- 등록 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="button" class="btn btn-primary">추가</button>
      				</div>
    			</div>
  			</div>
		</div>
		
		
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
  					<input type="text" class="form-control border-primary" id="schedule_title" placeholder="ex) 미팅">
					
					<label class="schedule_start">시작 날짜</label>
  					<input type="text" class="form-control border-primary" id="schedule_start" placeholder="ex) 2022-11-22 33-44">
  					
  					<label class="schedule_end">종료 날짜</label>
  					<input type="text" class="form-control border-primary" id="schedule_end" placeholder="ex) 2022-11-22 33-44">
  					
  					<label class="schedule_memo">메모</label>
  					<textarea rows="4" cols="50" class="form-control border-primary" name="edit-desc" id="schedule_memo" placeholder="ex) 무한상사"></textarea>
      				</div>
      				
      				<!-- 수정 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="button" class="btn btn-primary">수정</button>
        				<button type="button" class="btn btn-danger">삭제</button>
      				</div>
    			</div>
  			</div>
		</div>
		
       		<div id='calendar' style="width: 1200px;"></div>
        
        </div>
    </div>
</body>
</html>

</html>