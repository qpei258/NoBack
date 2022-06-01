<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>내 스케줄</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
//날짜 선택  css 함수
$( function() {
    $( "#add_start, #add_end").datepicker({ 
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
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
	        <div class='topmenu' style="line-height: 30px; font-size: 20px; font-weight: 700;">
	        	<!-- 상단바  -->
	        	<!-- 상단바  -->
	       		<nav class="nav">
	       			<a class="nav-link active" href='<c:url value="../mypage/update"/>'>개인정보 수정</a>
	       			<a class="nav-link active" href='<c:url value="../mypage/board"/>'>작성한 게시글 보기</a>
	  				<a class="nav-link active" href='<c:url value="schedule"/>'>작성한 스케줄 보기</a>
				</nav>
			</div> <!-- topmenu 끝 -->
			
			<!-- 회색 박스 -->
			<div class='square'>
			
				<ul class="nav nav-pills" style="line-height: 30px; font-size: 10px; border: 1px solid rgb(238, 238, 238);">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="../mypage/schedule">이번달 일정</a>
					  </li>
					  <li class="nav-item dropdown">
					    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">다른 달</a>
					    <ul class="dropdown-menu">
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=01">1월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=02">2월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=03">3월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=04">4월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=05">5월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=06">6월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=07">7월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=08">8월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=09">9월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=10">10월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=11">11월</a></li>
					      <li><a class="dropdown-item" href="../mypage/scheduleByMonth?month=12">12월</a></li>
					    </ul>
					  </li>
					  <li class="nav-item">
					    <!-- 모달 처리 (일정 등록) -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">일정 추가
						</button>
					  </li>
					</ul>
					
					
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
						<form action="scheduleMonth" method="get">
						</form>	<!-- 이번달 현황 폼 끝 -->
						
						<table class="table table-hover" style="width: 95%; font-size: 20px;margin: 0px auto 30px auto; border-spacing: 0;">
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
											<strong style="padding-left :40px;" class="strong" onclick="location.href='../schedule/scheduleInfo?schedule_num=${schedule.schedule_num}'">${schedule.schedule_title}</strong>
											<dl style="text-align: left;">
												<dt>일시</dt><dd>${schedule.schedule_start} ~ ${schedule.schedule_end}</dd>
												<dt>내용</dt><dd>${schedule.schedule_memo}</dd>
												
											</dl>
										</td>
											
										<td class="button">
											<dl>
												<dt>
												<input type="hidden" value="${schedule.schedule_num}" name="schedule_num">
												<!-- 모달 버튼 (일정 수정) -->
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal" onclick="location.href='scheduleInfo?schedule_num=${schedule.schedule_num}'">
						  								수정
												</button>
												</dt>
												<dd>
													<!-- 삭제 폼 -->
						      						<form action="delete" method="post">
						      						 
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
													</form><!-- 삭제 폼 끝-->
												</dd>
											</dl><!-- 버튼 끝 -->
				      					
										</td>
										
									</tr>
								</c:forEach>
						  </tbody>
						</table>
			        	
				</div> <!-- box 끝 -->
			</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
</html>