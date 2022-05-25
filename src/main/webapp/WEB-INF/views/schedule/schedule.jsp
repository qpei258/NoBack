<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// 삭제 예정
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
<!-- datepicker 함수 호출을 위한 css 파일 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" 
 integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" 
 crossorigin="anonymous" referrerpolicy="no-referrer" />

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
	
	td.scheduleDates {
		text-align: center;
		font-size: 20px;
	}
	
	td {
		font-size: 15px;
	}
	
	
	
	.year-month {
		text-align: center;
	}
	
	td.button {
		text-align: center;
	}
	
	strong.strong {
		float: top;
		padding-top: 10px;
		padding-bottom: 10px;
		font-size :20px;
		color : blue;
	}
	
	dt {
 		float: left;
  		margin-right: 15px;
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

		<strong>노빠꾸 캘린더</strong>
		<hr>
		
			<!-- 달력 박스 -->
        	<div class="box">   	
        		<!-- 달력 -->	
        		<div class="calendar" style="width: 1200px; ">
                    <div class="header">
                    	
                    	<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                        <div class="year-month" style="color: rgb(108,117,125);"></div>
                        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                        <button class="nav-btn go-today" onclick="goToday()" style="line-height: 3px;">오늘</button>
                       
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
      					<label class="schedule_title">일정 제목</label>
  						<input type="text" class="form-control border-primary" name="schedule_title" id="add_title" placeholder="ex) 미팅" >
					
						<label class="schedule_start">시작 날짜<img alt="cal" src="../resources/img/cal.png" style="width:20px;" onclick="javascript:f_datepicker(this);"></label>
  						<input type="text" class="form-control border-primary" name="schedule_start" id="add_start" placeholder="ex) 2022-11-22" >
  							
  						
  						<label class="schedule_end">종료 날짜<img alt="cal" src="../resources/img/cal.png" style="width:20px;" onclick="javascript:f_datepicker(this);"></label>
  						<input type="text" class="form-control border-primary" name="schedule_end" id="add_end" placeholder="ex) 2022-11-22">
  					
  						<label class="schedule_memo">내용</label>
  						<textarea rows="4" cols="50" class="form-control border-primary" name="schedule_memo" id="add_memo" placeholder="ex) 무한상사"></textarea>
      					</div>
      				
      				<!-- 등록 완료 버튼 -->
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        				<button type="submit" class="btn btn-primary">추가</button>
      				</div>
      				</form>
      				
    				</div>
  				</div>
			</div> <!-- 등록 모달 끝  -->
       	                	
                        <!--  
                        <div class="nav">
                            <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                            <button class="nav-btn go-today" onclick="goToday()" style="line-height: 3px;">오늘</button>
                            <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                        </div>
                        -->
                        
                        
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
        	</div> <!-- 달력 box 끝 -->
        	
        	
        	<!-- 이번달 스케줄 현황 출력 폼 -->	
        	<strong>이번달 일정</strong><hr>
		
			<form action="schedule" method="get">
			<table id="detail_schedule_tb" class="table" cellpadding="20px" cellspacing="20px">
		
				<colgroup>
					<col width="30%"/>
					<col width=""/>
				</colgroup>
				
				<thead  class="table-light">
					<tr>
						<th scope="col">일시</th>
						<th scope="col">일정 상세</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody id="detail_schedule" style="padding:20px;">
					<c:forEach var="schedule" items="${scheduleList}">
					<tr>
						<td class="scheduleDates">${schedule.schedule_start} ~ ${schedule.schedule_end}</td>
						<td class="cont">
							<strong class="strong" onclick="location.href='scheduleInfo?schedule_num=${schedule.schedule_num}'">${schedule.schedule_title}</strong>
							<dl>
								<dt>일시</dt><dd>${schedule.schedule_start} ~ ${schedule.schedule_end}</dd>
								<dt>내용</dt><dd>${schedule.schedule_memo}</dd>
								
							</dl>
						</td>
						<td class="button"><a>
							<!-- 모달 버튼 (일정 수정) -->
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">
  								일정 수정
							</button>
							<!-- 모달 처리  (일정 수정	) -->
							<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
    								<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="updateModalLabel">일정 수정</h5>
        										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
      									</div>
      				
      									<!-- 수정 내용 입력 -->
      									<form action="update" method="post" onsubmit ="return validation2()">
      									
      									<div class="modal-body">
      									<input type="text" value="${schedule.schedule_num}" name="schedule_num">
      						
      									
      									<label class="schedule_title">일정 제목</label>
  										<input type="text" class="form-control border-primary" name="schedule_title" id="update_title" placeholder="ex) 미팅"
  											value ="${schedule.schedule_title}">
					
										<label class="schedule_start">시작 날짜</label>
  										<input type="text" class="form-control border-primary" name="schedule_start" id="update_start" placeholder="ex) 2022-11-22" 
  											onclick="javascript:f_datepicker(this);" value ="${schedule.schedule_start}">
  					
  										<label class="schedule_end">종료 날짜</label>
  										<input type="text" class="form-control border-primary" name="schedule_end" id="update_end" placeholder="ex) 2022-11-22"
  											onclick="javascript:f_datepicker(this);" value ="${schedule.schedule_end}">
  					
  										<label class="schedule_memo">내용</label>
  										<textarea rows="4" cols="50" class="form-control border-primary" name="schedule_memo" id="update_memo" placeholder="ex) 무한상사"
  											value ="${schedule.schedule_memo}"></textarea>
      									</div>
      						
      									<!-- 수정 완료 버튼 -->
      									<div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
     					   				<button type="submit" class="btn btn-primary">수정</button>
     					   				<button type="button" class="btn btn-danger">삭제</button>
    					  				</div>
      									</form>
    								</div>
  								</div>
							</div> <!-- 수정 모달 끝  -->
       						
       						<!-- 삭제 폼 -->
      						<form action="delete" method="post"> 
      							<input type="hidden" value="${schedule.schedule_num}" name="schedule_num">
								<!-- 모달 버튼 (일정 삭제) -->
								<button type="submit" class="btn btn-primary" data-bs-target="#deleteModal" >
  									일정 삭제
								</button>
							</form>
						</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
        	</form>	<!-- 이번달 현황 폼 끝 -->
        		
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
<script type="text/javascript" src='/group/resources/js/index.js'></script>
<script type="text/javascript" src="/group/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
<script type="text/javascript">  

// 일정 등록시 유효성 검사
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
	// 종료날짜를 시작날짜 전으로 선택할 수 없음 //
	} else if (sta.value > end.valueㄴ) {
		alert('종료날짜를 시작날짜 이후로 입력하세요.')
		return false;
	} else if (memo.value == ''){
		alert('내용을 입력하세요.');
		return false;
	}		
	
	alert('등록 완료되었습니다.');
	location.href = 'schedule/schedule';
	return true;
}

// 일정 수정시 유효성 검사
function validation2() {

	let ttl = document.getElementById('update_title');
	let sta = document.getElementById('update_start');
	let end = document.getElementById('update_end');
	let memo = document.getElementById('update_memo');
	
	
	if (ttl.value == ''){
		alert('제목을 입력하세요.');
		return false;
	} else if (sta.value == ''){
		alert('시작날짜를 입력하세요.');
		return false;
	} else if (end.value == ''){
		alert('종료날짜를 입력하세요.');
		return false;
		
	// 종료날짜를 시작날짜 전으로 선택할 수 없는 유효성처리 추가하자  //
		
	} else if (memo.value == ''){
		alert('내용을 입력하세요.');
		return false;
	}		
	
	alert('수정 완료되었습니다.');
	location.href = 'schedule/schedule';
	return true;
	
}
	
	// 모달 오픈 (이 기능은 다른 함수로 구현해서 삭제 예정)
	function openModal() {
		document.get;
		e.preventDefault();
		console.log('You clicked submit.');
		
	}

	// 날짜 선택  css 함수
	$( function() {
	    $( "#add_start, #add_end, #update_start, #update_end").datepicker({ 
	        dateFormat: "yy-mm-dd",
	        closeText: "닫기",
			currentText: "오늘",
	       	prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			yearSuffix: ''
	        /* 년도와 달 폰트가 너무 큼
			fontSize : "20px"
	        */
	    });
	});
	
	
	
</script>

</html>