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
</style>
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
			
			<h1>스케줄 보기</h1> <br>
			
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
					
						<label class="schedule_start" >시작 날짜</label>
  						<input type="text" class="form-control border-primary" id="add_start" placeholder="ex) 2022-11-22 33-44" onclick="javascript:f_datepicker(this);">
  					
  						<label class="schedule_end">종료 날짜</label>
  						<input type="text" class="form-control border-primary" id="add_end" placeholder="ex) 2022-11-22 33-44" onclick="javascript:f_datepicker(this);">
  					
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
		
			</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
</html>