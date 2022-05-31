<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>개인 정보 수정</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">    

	function validation() {

		let pw = document.getElementById('password');
		let pwc = document.getElementById('passwordcheck');
		
		let email = document.getElementById('email');
		let adr = document.getElementById('address');
		let ph = document.getElementById('phone');
		
		

		if (pw.value.length < 3 || pw.value.length > 10){
			alert('비번은 3~10자로 입력하세요.');
			return false;
		} else if (pw.value !== pwc.value){
			alert('비밀번호가 일치하지 않습니다! (대소문자 구분함)');
			return false;
		}  else if (ph.value == ''){
			alert('폰번호를 입력하세요.');
			return false;
		} else if (adr.value == ''){
			alert('주소를 입력하세요.');
			return false;
		} else if (email.value == ''){
			alert('이메일을 입력하세요.');
			return false;
		}		
		alert('수정 완료되었습니다.');
		location.href = 'mypage/mypage';
		return true;
	}
	
	window.onload = function(){
	    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address1]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}

</script>
<style type="text/css">

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

/* 폼 테이블 */
.formtable {
	width: 800px;
	height: 500px;
	margin: 20px auto;
}

label {
	font-size :1px;
	height: 10px;
	color: black;
}

div {
	border : 1px solid;
	color: rgb(238, 238, 238);
}


</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        
	        <div class='topmenu' style="line-height: 30px; font-size: 20px; font-weight: 700;">
	        	<!-- 상단바  -->
	       		<nav class="nav">
	       			<a class="nav-link active" href='<c:url value="update"/>'>개인정보 수정</a>
	       			<a class="nav-link" href='<c:url value="board"/>'>작성한 게시글 보기</a>
	  				<a class="nav-link" href='<c:url value="schedule"/>'>작성한 스케줄 보기</a>
				</nav>
			</div> <!-- topmenu 끝 -->
			
			<!-- 회색 박스 -->
			<div class='square'>
			
				 <div class="formtable">
			
					<!-- 정보수정 폼 -->
					<form action="update" method="POST" onsubmit ="return validation()">
		
							<div class="row mb-3">
                 			<label for="employee_picture" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">프로필 등록</label>
                 				<div class="col-sm-10" style="width:550px">
                 				<input class="form-control" type="file" id="picture" name="employee_picture" value="${member.employee_picture}" style="width:500px">
								</div>               			
               			</div>
						
						<div class="row mb-3">
							<label for="employee_name" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">이름</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" class="form-control" name="employee_name" id="name" value="${member.employee_name}">
						    </div>
						</div>
						
						<div class="row mb-3">
							<label for="employee_num" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">사원번호</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" readonly class="form-control" name="employee_num" id="num" value="${member.employee_num}">
						    </div>
						</div>					
						
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">부서</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" readonly class="form-control" name ="employee_dep" id="email" value="${member.employee_dep}" placeholder="">
						    </div>
						  </div>
						  
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">직함</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" readonly class="form-control" name ="employee_pos" id="email" value="${member.employee_pos}" placeholder="">
						    </div>
						 </div>
						 
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">비밀번호</label>
								<div class="col-sm-10" style="width:400px">
								<input type="password" class="form-control" name ="employee_password" id="password" placeholder="비밀번호 입력" >
								</div>
						</div>
						  
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">비밀번호 확인</label>
								<div class="col-sm-10" style="width:400px">
								<input type="password" class="form-control" name ="passwordcheck" id="passwordcheck" placeholder="비밀번호 다시 입력">
							</div>
						 </div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">주민번호</label>
								<div class="col-sm-10" style="width:400px">
								<input type="text" readonly class="form-control" name="employee_ssn" id="num" value="${member.employee_ssn}" maxlength="13">
						    </div>
						</div>
						
						<div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">주소</label>
						    <div class="col-sm-10" style="width:500px">
						      <input type="text" class="form-control" name ="employee_address" id="address" value="${member.employee_address}" placeholder="">
						    </div>
						  </div>
						  
						  <div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">상세주소</label>
						    <div class="col-sm-10" style="width:600px">
						      <input type="text" readonly class="form-control" name ="employee_address1" id="address1" value="${member.employee_address}" placeholder="">
						    </div>
						  </div>
						  
						   
						   <div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">연락처</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" class="form-control" name ="employee_phone" id="phone" value="${member.employee_phone}" maxlength="11" placeholder="ex) 010-1111-2222">
						    </div>
						  </div>
 
						   <div class="row mb-3">
						    <label for="inputPassword3" class="col-sm-2 col-form-label" style="font-size:20px; width:200px;">이메일</label>
						    <div class="col-sm-10" style="width:400px">
						      <input type="text" class="form-control" name ="employee_email" id="email" value="${member.employee_email}" placeholder="ex) name@example.com">
						    </div>
						  </div>

					<fieldset>
						<input type="submit" class="btn btn-primary" value="수정">
						<input type="reset" class="btn btn-primary" value="다시 쓰기">
					</fieldset>
					</form> <!-- 정보수정 폼 끝 -->
				
				</div> <!-- table 끝 -->
			</div> <!-- square 끝 -->
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>
</html>