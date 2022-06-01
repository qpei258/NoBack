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
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

/*회색 배경*/
.square {
	border : 1px solid rgb(238, 238, 238);
	margin: 10px auto;
	width: 850px;
	height: 700px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
}

/* 폼 테이블 */
.update1 {
	width: 800px;
	height: 600px;
	margin: 48px auto;
}


a{
	text-decoration: none;
	color: rgb(80,80,80);
}

div {
	border:1px solid ;
	color: rgb(238, 238, 238);
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
/* 수정 처리 ajax */
function updatecheck() {
	$.ajax({
		url : 'memberlistupdate',
		type : 'post',
		data : $('#write').serialize(),
		success : function(){
			alert('수정되었습니다.');
			opener.location.reload();
			window.close();
		},
		error : function(e) {
			alert('권한등급을 선택해주세요.');
		}
	});
}
</script>

</head>
<body>
	<div id="container" style="margin: 0px; width: 600px; height: 500px;">
			<!-- 회색 배경  -->
			<div class='square' style="margin: auto;">
			<!-- 수정 테이블 묶음 -->
			<div class="update1">
			<form method="post" id="write">
				        <div class="row mb-3">
					  <label for="employee_picture" class="col-sm-2 col-form-label" style="font-size:20px; width:150px;">프로필 등록</label>
					  <input class="form-control" type="file" id="employee_picture" name="employee_picture" value="${member.employee_picture}" style="width:400px; background-color:rgb(238, 238, 238)">
					</div>
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">이름</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_name" id="employee_name" value="${member.employee_name}" style="width:300px">
						    </div>
						</div>
				        <div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">부서</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_dep" id="employee_dep" value="${member.employee_dep}" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">직함</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_pos" id="employee_pos" value="${member.employee_pos}" style="width:300px">
						    </div>
						</div>
				        <div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">주소</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_address" id="employee_address" readonly placeholder="클릭해서 주소찾기" value="${member.employee_address}" style="width:430px">
						    </div>
						</div>
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">상세 주소</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_address1" id="employee_address1" style="width:550px" value="" >
						    </div>
						</div>
				        <div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">연락처</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_phone" id="employee_phone" maxlength="11" placeholder="' - '빼고 입력" value="${member.employee_phone}" style="width:300px">
						    </div>
						</div>
				        <div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label" style="font-size:20px;">이메일</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name ="employee_email" id="employee_email" value="${member.employee_email}" style="width:300px">
						    </div>
						</div>
						<div class="row mb-3">
							<label for="employee_level" class="col-sm-2 col-form-label" style="font-size:20px; width:150px;">권한 등급</label>
							<select  class="form-select" aria-label="Default select example" name='employee_level' id="employee_level" value="" style="width:150px">
							  <option selected>-- 선택 --</option>
							  <option value="1">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
							  <option value='4'>4</option>
							</select>
						</div>
						<input type="hidden" name="employee_num" id="employee_num" value="${member.employee_num}">
					<button type="button" onclick="updatecheck()" class="btn btn-primary" style="width: 100px";>수정</button>
					<button type="button" class="btn btn-primary" style="width: 100px"; onclick="window.close()"; >닫기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>