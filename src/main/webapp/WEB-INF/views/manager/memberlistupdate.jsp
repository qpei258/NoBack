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
	margin: 10px auto;
	width: 1258px;
	height: 800px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
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

</script>
</head>
<body>
	<div id="container">

			<!-- 회색 배경  -->
			<div class='square'>
			
			<form method="post">
			<table>
						<tr>
				            <th>프로필 등록</th>
				            <td><input type="file" id="employee_picture" name="employee_picture" value = "${member.employee_picture}"></td>
				        </tr>
				        <tr>
				        <tr>
				            <th>이름</th>
				            <td><input type="text" id="employee_name" name="employee_name" value = "${member.employee_name}"></td>
				        </tr>
				      
				        <tr>
				            <th>주소</th>
				            <td><input type="text" id="employee_address" name="employee_address" value = "${member.employee_address}" readonly placeholder="클릭해서 주소찾기" /></td>
				        </tr>
				        <tr>
				            <th>상세 주소</th>
				            <td><input type="text" id="employee_address1" name="employee_address1" /></td>
				        </tr>
				        <tr>
				            <th>연락처</th>
				            <td><input type="text" id="employee_phone" name="employee_phone" value = "${member.employee_phone}" maxlength="11" placeholder="' - '빼고 입력"></td>
				        </tr>
				        <tr>
				            <th>이메일</th>
				            <td><input type="text" id="employee_email" name="employee_email" value = "${member.employee_email}"></td>
				        </tr>
				        <tr>
				            <th>부서</th>
				            <td><input type="text" id="employee_dep" name="employee_dep" value = "${member.employee_dep}"></td>
				        </tr>
				        <tr>
				            <th>직함</th>
				            <td><input type="text" id="employee_pos" name="employee_pos" value = "${member.employee_pos}"></td>
				        </tr>
				        <tr>
				            <th>권한 등급</th>
				            <td>
					            <select name='employee_level' id="employee_level">
									  <option value='' selected>-- 선택 --</option>
									  <option value='1'>1 </option>
									  <option value='2'>2</option>
									  <option value='3'>3</option>
									  <option value='4'>4</option>
								</select>
							</td>	
				        </tr>
				    </table>
							
					<button type="submit" style="width: 100px;" class="btn btn-primary">수정</button>
				</form>
			</div>
		</div>

</body>
</html>