<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

	/*회색 배경*/	
	.square {
		margin: 10px auto;
		width: 1258px;
		height: 800px;
		background-color: rgb(238, 238, 238);
		color: rgb(80, 80, 80);
		
	}
	
	a{
	text-decoration: none;
	color: rgb(80, 80, 80);
	}
	
	a:hover {
		color: rgb(20, 20, 20);
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
	}
	
	td.scheduleDates {
		text-align: center;
		font-size: 20px;
	}
	
	td {
		font-size: 15px;
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
<script>

 	$("#updateModal").load("/scheduleInfo");

</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		
        <div id="content">
			
			<!-- 상단 메뉴 -->
			<ul class="nav nav-tabs" style="margin: 10px; border-top: 0px solid white; border-left: 0px solid white; border-right: 0px solid white;">
				 <li class="nav-item">
				    <a class="nav-link" href='<c:url value="/schedule/schedule"/>'>사내일정</a>
				  </li>
				  <c:if test="${LoginId != null && LoginLevel >= 3}">
				  <li class="nav-item">
				    <a class="nav-link active" href='<c:url value="/schedule/scheduleByMonth?month=06"/>'>일정 수정</a>
				  </li>
				  </c:if>
			</ul> <!-- topmenu 끝 -->
				
				<!-- 달력 박스 -->
				<div class='square'>
					
					<h2 style="text-align:center; margin: 40px 0px 10px 0px;">${Integer.parseInt(month)} 월</h2>
					
					<!-- 월 이동 옵션 -->
					<div style="float: left; margin-bottom: 0px; margin-left: 100px; border: 0px; height: 50px;">
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
								<select  class="form-select" onchange="if(this.value) location.href=(this.value);" aria-label="Default select example" name="month" id="month" style="width:150px">
								  <option value="../schedule/scheduleByMonth?month=01" <c:if  test='${month.equals("01")}'> selected </c:if> >1월</option>
								  <option value="../schedule/scheduleByMonth?month=02" <c:if  test='${month.equals("02")}'> selected </c:if> >2월</option>
								  <option value="../schedule/scheduleByMonth?month=03" <c:if  test='${month.equals("03")}'> selected </c:if> >3월</option>
								  <option value="../schedule/scheduleByMonth?month=04" <c:if  test='${month.equals("04")}'> selected </c:if> >4월</option>
								  <option value="../schedule/scheduleByMonth?month=05" <c:if  test='${month.equals("05")}'> selected </c:if> >5월</option>
								  <option value="../schedule/scheduleByMonth?month=06" <c:if  test='${month.equals("06")}'> selected </c:if> >6월</option>
								  <option value="../schedule/scheduleByMonth?month=07" <c:if  test='${month.equals("07")}'> selected </c:if> >7월</option>
								  <option value="../schedule/scheduleByMonth?month=08" <c:if  test='${month.equals("08")}'> selected </c:if> >8월</option>
								  <option value="../schedule/scheduleByMonth?month=09" <c:if  test='${month.equals("09")}'> selected </c:if> >9월</option>
								  <option value="../schedule/scheduleByMonth?month=10" <c:if  test='${month.equals("10")}'> selected </c:if> >10월</option>
								  <option value="../schedule/scheduleByMonth?month=11" <c:if  test='${month.equals("11")}'> selected </c:if> >11월</option>
								  <option value="../schedule/scheduleByMonth?month=12" <c:if  test='${month.equals("12")}'> selected </c:if> >12월</option>
								</select>
						</div>
					</div>

					<div class="nav-item" style="float: right; margin-bottom: 10px; margin-right: 100px; border: 0px; height: 50px;">
					    <!-- 모달 처리 (일정 등록) -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">일정 추가
						</button>
					</div>
					
					<!-- 모달 처리 (일정 등록) -->
						<div class="modal fade" id="addModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
			    				<div class="modal-content">
			      					<div class="modal-header">
			        					<h5 class="modal-title" id="addModalLabel">일정 추가</h5>
			        						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
			      					</div>
			      				
			      					<form action="addform" method="post" onsubmit ="return validation()">
			      				
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
			        				<button type="submit" class="btn btn-primary" id="addCalendar">추가</button>
			      				</div>
			      				</form>
			      				
			    				</div>
			  				</div>
						</div> <!-- 등록 모달 끝  -->
						
			        	<!-- 이번달 스케줄 현황 출력 폼 -->	
						<form action="scheduleByMonth" method="get">
						</form>	<!-- 이번달 현황 폼 끝 -->
						
						<table class="table table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
						  	<thead>
						      	<tr style="background-color: rgb(200, 200, 200);">
			        				<th scope="col" style="width: 40%;">일시</th>
									<th scope="col" style="width: 45%;">일정 상세</th>
									<th scope="col" style="width: 15%;">비고</th>
		        				</tr>
						  	</thead>
						  	<tbody style="width: 90%;font-size: 20px;margin: 0px auto 30px auto; background-color: white;">
								  <c:forEach var="schedule" items="${scheduleList}">
								<tr>
									<td class="scheduleDates">${schedule.schedule_start} ~ ${schedule.schedule_end}</td>
									<td class="cont">
										<strong  style="padding-left :40px;" class="strong" onclick="location.href='scheduleInfo?schedule_num=${schedule.schedule_num}'">${schedule.schedule_title}</strong>
										<dl style="text-align: left;">
											<dt>일시</dt><dd>${schedule.schedule_start} ~ ${schedule.schedule_end}</dd>
											<dt>내용</dt><dd>${schedule.schedule_memo}</dd>
											
										</dl>
									</td>
									<td class="button">
										<dl>
											<dt>
												<input type="hidden" value="${schedule.schedule_num}" name="schedule_num" >
													
												<!-- 모달 버튼 (일정 수정) -->
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal${schedule.schedule_num}" onclick="location.href='scheduleInfo?schedule_num=${schedule.schedule_num}&month=${month }'">
					  								수정
												</button>
											</dt>
											<dd>
				
				       						<!-- 삭제 폼 -->
				      						<form action="delete" method="post"> 
				      							<input type="hidden" name="month" value="${month }">
				      							<input type="hidden" value="${schedule.schedule_num}" name="schedule_num">
														<!-- 모달 버튼 (일정 삭제) -->
														<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal${schedule.schedule_num}" >
						  									삭제
														</button>
														
														<!-- Modal -->
														<div class="modal fade" id="deleteModal${schedule.schedule_num}"  aria-labelledby="exampleModalLabel" aria-hidden="true">
														  <div class="modal-dialog">
														    <div class="modal-content">
														      <div class="modal-header">
														        <h5 class="modal-title" id="exampleModalLabel">일정 삭제</h5>
														        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														      </div>
														      <div class="modal-body" style="font-size:20px;">
														        	일정을 삭제하시겠습니까?
														      </div>
														      <div class="modal-footer">
														        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
														        <button type="submit" class="btn btn-danger" data-bs-target="#deleteModal">삭제</button>
														      </div>
														    </div>
														  </div>
												</div><!-- Modal -->
											</form>
											</dd>
									</dl><!-- 버튼 끝 -->
									</td>
								</tr>
								</c:forEach>
						  </tbody>
						</table>
			        	
        		</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>

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
	} else if (sta.value > end.value) {
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