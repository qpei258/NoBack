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
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

	/*회색 배경*/	
	.square {
		margin: 10px auto;
		width: 1258px;
		height: 797px;
		background-color: rgb(238, 238, 238);
		text-align: center;
		color: rgb(80, 80, 80);
		
	}
	
	/*흰색박스 */	
	.rounded {
		border:1px solid white;
		text-align: center;
		margin: 250px auto;
		width: 500px;
		height: 250px;
		background: white;
		border-radius: 20%;
	}
	

a{
	text-decoration: none;
	color: rgb(80, 80, 80);
}
a:hover {
	color: rgb(20, 20, 20);
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

    $.ajax({
        type : 'POST',
        url: 'login',
        data:  $('#login').serialize(),
        success: function(data) {
            if(data == false)
                alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.') ;
            else
                location.href='/group'; 
        }
    }) ;
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
			    <a class="nav-link active" aria-current="page" href='<c:url value="../manager/login"/>'>로그인</a>
			  </li>
			</ul>
			 <!--회색 배경  -->
			<div class='square'>
			 <!-- 흰색 박스  -->
				<div class='rounded'>
				<!-- 로그인 창 -->
					<form id="login" action="login" method="post">
						<!-- id 창 -->
						<div class="input-group mb-3" style="border: 0px; width:70%; margin: 53px auto 100px auto;" >
							<span class="input-group-text" id="basic-addon1" style="width: 70px;" >ID</span> 
							<input type="text" id="id" class="form-control" name="employee_num" placeholder="사원번호를  입력해주세요"
								aria-label="Username" aria-describedby="basic-addon1">
						<!-- pw 창 -->		
						</div>
						<div class="input-group mb-3" style="border: 0px; width:70%; margin: 0px auto;">
							<span class="input-group-text" id="basic-addon2" style="width: 70px;">PW</span> 
							<input type="password" id="pw" class="form-control" name="employee_password" placeholder="비밀번호를  입력해주세요"
								aria-label="Username" aria-describedby="basic-addon2">
						</div>

						<button type="button" onclick="loginCheck()" style="width: 100px;" id="loginbt" class="btn btn-primary">로그인</button>		
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>