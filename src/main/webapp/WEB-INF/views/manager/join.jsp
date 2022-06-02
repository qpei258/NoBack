<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>[사원 등록]</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/default.css"/>' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">

/*회색 배경*/
.square {
	border : 1px solid rgb(238, 238, 238);
	margin: 10px auto;
	width: 1258px;
	height: 797px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
}


/* 폼 테이블 */
.update1 {
	border : 1px solid rgb(238, 238, 238);	
	width: 800px;
	height: 600px;
	margin: 48px auto;
	
}

a{
	
	text-decoration: none;
	color: rgb(80,80,80);
}

a:hover {
	color: rgb(20, 20, 20);
}

label {

   font-size :1px;
   color: black;

}

</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("employee_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("employee_address").value = data.address; // 주소 넣기
                document.querySelector("input[name=employee_address1]").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
   
}
</script>


<script type="text/javascript">

function formCheck() {
	let employee_picture = document.getElementById('employee_picture'); 
	let employee_name = document.getElementById('employee_name'); 
	let employee_ssn = document.getElementById('employee_ssn'); 
	let employee_address = document.getElementById('employee_address'); 
	let employee_address1 = document.getElementById('employee_address1'); 
	let employee_phone = document.getElementById('employee_phone');
	let employee_email = document.getElementById('employee_email');
	let employee_dep = document.getElementById('employee_dep');
	letemployee_pos = document.getElementById('employee_pos');
	let employee_num = document.getElementById('employee_num');
	let employee_level = document.getElementById('employee_level');
	
	if (employee_picture.value == '') {
		alert('사진을 등록하세요.');
		return false;
	}
	
	if (employee_name.value == '') {
		alert('이름을 입력하세요.');
		return false;
	}
	
	if (employee_ssn.value == '') {
		alert('주민번호를 입력하세요.');
		return false;
	}
	
	if (employee_address.value == '' && employee_address1.value == ''){
		alert('주소를 입력하세요.');
		return false;
	}
	
	if (employee_phone.value == '') {
		alert('전화번호를 입력하세요.');
		return false;
	}
	
	if (employee_email.value == '') {
		alert('이메일을 입력하세요.');
		return false;
	}
	
	if (employee_dep.value == '') {
		alert('부서를 입력하세요.');
		return false;
	}
	
	if (employee_pos.value == '') {
		alert('직함을 입력하세요.');
		return false;
	}
	
	if (employee_num.value.length < 6 || employee_num.value.length > 6) {
		alert('사원번호를 입력하세요.');
		return false;
	}
	
	if ( employee_level.value == '') {
		alert('레벨을 선택하세요.');
		return false;
	}
	
	alert('사원이 등록 되었습니다.');

	
	employee_address.value = employee_address.value +" "+ employee_address1.value
	
	
	return true;
}


</script>
</head>
<body>
	<div id="container">
		<%@ include file="../sidebar.jsp"%>
		<div id="content">
			<!-- 상단 메뉴 -->
			<ul class="nav nav-tabs" style="margin: 10px;">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href='<c:url value="../manager/join"/>'>사원 등록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href='<c:url value="../manager/memberlist"/>'>사원 리스트</a>
			  </li>
			</ul>
			<!-- 회색 배경 -->
			<div class='square' >
			<!-- 수정 테이블 묶음 -->
			<div class="update1">
			<!-- 정보수정 폼 -->
				<form id="join" action="join"  method="post" onsubmit="return formCheck();">
					<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
					  <label for="employee_picture" class="col-sm-2 col-form-label" style="font-size:20px; width:150px; border : 1px solid rgb(238, 238, 238)">프로필 등록</label>
					  <input class="form-control" type="file" id="employee_picture" name="employee_picture" value="" style="width:400px; background-color:rgb(238, 238, 238); ">
					</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">이름</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_name" id="employee_name" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">사원번호</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_num" id="num"  maxlength="6" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">부서</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_dep" id="employee_dep" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">직함</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_pos" id="employee_pos" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">주민번호</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_ssn" id="employee_ssn" maxlength="13" placeholder="' - '빼고 13자리 입력" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">주소</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_address" id="employee_address" readonly placeholder="클릭해서 주소찾기" value="" style="width:430px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">상세 주소</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_address1" id="employee_address1" style="width:550px" value="" >
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">연락처</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_phone" id="employee_phone" maxlength="11" placeholder="' - '빼고 입력" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">이메일</label>
								<div class="col-sm-10" style="border : 1px solid rgb(238, 238, 238)">
								<input type="text" class="form-control" name ="employee_email" id="employee_email" placeholder="ex) name@example.com" value="" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3" style="border : 1px solid rgb(238, 238, 238)">
						<label for="employee_level" class="col-sm-2 col-form-label" style="font-size:20px; width:150px;">권한 등급</label>
						<select  class="form-select" aria-label="Default select example" name='employee_level' id="employee_level" value="" style="width:150px">
						  <option selected>-- 선택 --</option>
						  <option value="1">1</option>
						  
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value='4'>4</option>
						</select>
						</div>
					<button type="submit" style="width: 100px;" class="btn btn-primary">등록</button>
					<button type="reset" style="width: 100px;" class="btn btn-primary">초기화</button>
				</form>
				</div>
				</div>
			</div>
		</div>
</body>
</html>