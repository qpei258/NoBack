<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.noback.group.vo.ScheduleVO"%>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<title>사내일정</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/main.min.css"/>' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script type="text/javascript" src='/group/resources/js/calendar.js'></script>
<script type="text/javascript" src='/group/resources/js/jquery-3.3.1.min.js'></script>
<style>

/*회색 배경*/
.square {
	margin: 15px auto;
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

div {
	border:white;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;   
	font-size: 1.1em;
}


html, body {  
  overflow: hidden;    
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;    
  font-size: 10px;  
}  
 
.fc-header-toolbar {    
  padding-top: 1em;    
  padding-left: 20px;    
  padding-right: 20px;
}

.fc-title{
    font-size: .9em;
}

::ng-deep body .fc {
  font-size: 12px;
 }

</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
	// calendar element 취득
    var calendarEl = document.getElementById('calendar');
 	// full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
		height: '730px', // calendar 높이 설정
		contentHeight: 600,
    	expandRows: true, // 화면에 맞게 높이 재설정
    	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크        
    	editable: true, // 수정 가능    
		selectable: true, // 달력 일자 드래그 설정가능
		dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)        
    	locale: 'ko', // 한국어 설정    
    	aspectRatio: 1.75, 
    	headerToolbar: {          
	    	left: 'prev,next today',          
	    	center: 'title',          
	    	right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek, addEventButton'        
    	},
    	 
		initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		
		events :[
			 <%ArrayList<ScheduleVO> calendarList = (ArrayList<ScheduleVO>) request.getAttribute("list");%>
	            <%if (calendarList != null) {%>
	            <%for (ScheduleVO vo : calendarList) {%>
	            	{
	            	title : '<%=vo.getSchedule_title()%>',
	                start : '<%=vo.getSchedule_start()%>',
	                end : '<%=vo.getSchedule_end()%>',
	                allDay : '<%=vo.isSchedule_allDay()%>'
	             	},
				<%}
				}%>
		], 
		
    	customButtons: {
            addEventButton: { // 추가한 버튼 설정
                text : "일정 추가",  // 버튼 내용
                click : function(){ // 버튼 클릭 시 이벤트 추가
                	alert('일정 추가하기');
                
                    $('#addModalLabel').modal('show'); // modal 나타내기

                    $("#addModalLabel").on("click",function(){  // modal의 추가 버튼 클릭 시
                        var content = $("#schedule_memo").val();
                        var start_date = $("#schedule_start").val();
                        var end_date = $("#schedule_end").val();
                        
                        //내용 입력 여부 확인
                        if(content == null || content == ""){
                            alert("내용을 입력하세요.");
                        }else if(start_date == "" || end_date ==""){
                            alert("날짜를 입력하세요.");
                        }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                            alert("종료일이 시작일보다 먼저입니다.");
                        }else{ // 정상적인 입력 시
                            var obj = {
                                "schedule_title" : schedule_title,
                                "schedule_start" : schedule_start,
                                "schedule_end" : schedule_end
                            } //전송할 객체 생성

                            console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                        }
                    });
                }
            }
        },
    	
    	
		select: function(arg) {
			// 캘린더에서 드래그로 이벤트를 생성할 수 있다.          
			var title = prompt('일정의 제목을 입력해주세요.');
			var content = prompt('메모를 입력해주세요.');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                    content: content
                })
            }

            console.log(arg);
            
            var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
            
            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
            
            var obj = new Object();     // Json 을 담기 위해 Object 선언
                    // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                    obj.title = allEvent[allEvent.length-1]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                    obj.start = allEvent[allEvent.length-1]._instance.range.start; // 시작
                    obj.end = allEvent[allEvent.length-1]._instance.range.end; // 끝
                    obj.content = allEvent[allEvent.length-1]._def.content;

                    events.push(obj);
                    
            
            var jsondata = JSON.stringify(obj);
            console.log(jsondata);
            

           $( function saveData(jsondata) {
         	   alert(JSON.stringify(jsondata));
              $.ajax({
                  url: "add",
                  method: "POST",
                  dataType: "json",
                  data: JSON.stringify(obj),
                  contentType: 'application/json',
              })
                  .done(function (result) {
                      alert(result);
                  })
                  .fail(function (request, status, error) {
                       alert("에러 발생" + error);
         			});
              calendar.unselect()
          });
          
              
              /*
              location.href = "add?title=" + obj.title + "&start=" + obj.start + "&end=" + obj.end;
			*/
            
        },
        
        eventClick: function(arg) {
      	  // 있는 일정 클릭시,
      	  console.log("#등록된 일정 클릭#");
      	  console.log(arg.event);
      	  
          if (confirm('일정을 삭제하시겠어요?')) {
            arg.event.remove()
          }
          
          var jsondata = JSON.stringify(arg);
          console.log(jsondata);
          

         $( function delData(jsondata) {
       	   alert(JSON.stringify(jsondata));
            $.ajax({
                url: "delete",
                method: "POST",
                dataType: "json",
                data: JSON.stringify(arg),
                contentType: 'application/json',
            })
                .done(function (result) {
                    alert(result);
                })
                .fail(function (request, status, error) {
                     alert("에러 발생" + error);
       			});
            calendar.unselect()
        });
        
        
    	}
    });
    calendar.render();
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
				
				<!-- 회색 박스 -->
				<div class='square'>
					<div id='calendar' style="font-size: 10px; background-color:white;"></div>
					
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">일정 추가
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
			        				<button type="submit" class="btn btn-primary" id="addCalendar">추가</button>
			      				</div>
			      				</form>
			      				
			    				</div>
			  				</div>
						</div> <!-- 등록 모달 끝  -->
						
						
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						  Launch static backdrop modal
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        ...
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Understood</button>
						      </div>
						    </div>
						  </div>
						</div>
			
        		</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>


</html>