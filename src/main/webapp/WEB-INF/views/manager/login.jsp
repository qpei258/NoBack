<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>[로그인]</title>
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
	
	/*흰색박스 */	
	.rounded {
		border:1px solid white;
		text-align: center;
		margin: 200px auto;
		width: 500px;
		height: 250px;
		background: white;
		border-radius: 20%;
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


</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">


	
</script>
<script type="text/javascript">
//로그인 체크
function loginCheck() {
	var id = document.getElementById('id');
	var password = document.getElementById('pw');
	
	if (id.value == '' || password.value == '') {
		alert('ID와 비밀번호를 입력하세요.');
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div id="container">
		<%@ include file="../sidebar.jsp"%>
		<div id="content">
		 <div class='topmenu' style="line-height: 30px; font-size: 20px; font-weight: 700;">로그인</div>
			<div class='square'>
				<div class='rounded'>
					<form id="login" action="login" method="post"
						onSubmit="return loginCheck();">
						<div class="input-group mb-3" style="border: 0px; width:50%; margin: 30px auto 100px auto;" >
							<span class="input-group-text" id="basic-addon1" style="width: 70px;">ID</span> 
							<input id="id" class="form-control" name="employee_num" placeholder="사원번호를  입력해주세요"
								aria-label="Username" aria-describedby="basic-addon1">
								
						</div>
						<div class="input-group mb-3" style="border: 0px; width:50%; margin: 0px auto;">
							<span class="input-group-text" id="basic-addon2" style="width: 70px;">PW</span> 
							<input id="pw" class="form-control" name="employee_password" placeholder="비밀번호를  입력해주세요"
								aria-label="Username" aria-describedby="basic-addon2">
						</div>


						<button type="submit" style="width: 100px;" class="btn btn-primary">로그인</button>
								
								
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>