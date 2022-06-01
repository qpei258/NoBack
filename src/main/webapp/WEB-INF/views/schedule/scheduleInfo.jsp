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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>

	/*회색 배경*/	
	.square {
		margin: 10px auto;
		width: 1258px;
		height: 800px;
		background-color: rgb(238, 238, 238);
		color: rgb(80, 80, 80);
		
	}
	/* 상단메뉴 */
	.topmenu{
		border:	15px solid rgb(148, 202, 238);
		background-color: rgb(148, 202, 238);
		float: top;
		margin: 9px 9px;
		width: 1257px;
		height: 60px;
	}
	
	.border {
		border: 1px solid white;
	}
	
	.box{
    	background-color: white;
    	color: rgb(80, 80, 80);
    	padding: 100px;
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
<script type="text/javascript">
//일정 수정시 유효성 검사
function validation2() {

	let ttl = document.getElementById('title');
	let sta = document.getElementById('start');
	let end = document.getElementById('end');
	let memo = document.getElementById('memo');
	
	
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

//날짜 선택  css 함수
$( function() {
    $( "#start, #end").datepicker({ 
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
        	<div class='topmenu'>
				<a href='<c:url value="/schedule/schedule"/>'>사내일정</a>
				<a href='<c:url value="/schedule/scheduleMonth"/>'>일정 수정</a>
			</div>
        	<div class='square'>
        		<div class='box' style="background-color: white; ">
		
					<form class="row g-3" action="update" method="POST" onsubmit ="return validation()2">
					
						<div class="row mb-3">
                 			<label for="employee_picture" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">일정 번호</label>
                 				<div class="col-sm-10" style="width:550px">
                 				<input class="form-control" type="text" name="schedule_num" id="num" value="${schedule.schedule_num}" style="width:500px">
								</div>               			
               			</div>
						
						<div class="row mb-3">
							<label for="employee_name" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">일정 제목</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" class="form-control" name="schedule_title" id="title" value="${schedule.schedule_title}">
						    </div>
						</div>
						
						<div class="row mb-3">
							<label for="employee_num" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">시작일
								<img alt="cal" src="../resources/img/cal.png" style="width:20px;" onclick="javascript:f_datepicker(this);">
							</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" class="form-control" name="schedule_start" id="start" value="${schedule.schedule_start}">
						    </div>
						</div>
						
						<div class="row mb-3">
							<label for="employee_num" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">시작 시간
							</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" class="form-control" name="schedule_start" id="start" value="${schedule.schedule_start}">
						    </div>
						</div>						
						
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">종료일
						    	<img alt="cal" src="../resources/img/cal.png" style="width:20px;" onclick="javascript:f_datepicker(this);">
						    </label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" class="form-control" name ="schedule_end" id="end" value="${schedule.schedule_end}" placeholder="">
						    </div>
						 </div>
						  
						 <div class="row mb-3">
							<label for="employee_num" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">종료 시간
							</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" class="form-control" name="schedule_start" id="start" value="${schedule.schedule_end}">
						    </div>
						</div>	
						  
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">메모</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" class="form-control" name ="schedule_memo" id="memo" value="${schedule.schedule_memo}" placeholder="">
						    </div>
						 </div>
						 
						 <div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">작성자</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" readonly class="form-control" name ="schedule_writer" id="writer" value="${schedule.schedule_writer}" placeholder="">
						    </div>
						 </div>

					<fieldset>
						<input type="submit" class="btn btn-primary" value="수정" >
						<input type="reset" class="btn btn-primary" value="다시 쓰기">
					</fieldset>
					  
					</form>
					
				</div> <!-- box 끝 -->
       		</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
<script type="text/javascript" src="/group/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>

</html>