<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
    rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
    crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	crossorigin="anonymous">
	</script>
	
<script type="text/javascript">    

	function validation() {

		let pw = document.getElementById('password');
		let pwc = document.getElementById('passwordcheck');

		let ph = document.getElementById('phone');
		let adr = document.getElementById('address');
		let email = document.getElementById('email');

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
		return true;
	}

</script>
<style>
    
</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        
        	<!-- 상단바  -->
       		<nav class="nav">
       			<a class="nav-link active" href='<c:url value="../mypage/update"/>'>개인정보 수정</a>
       			<a class="nav-link" href='<c:url value="../mypage/board"/>'>작성한 게시글 보기</a>
  				<a class="nav-link" href='<c:url value="../mypage/schedule"/>'>작성한 스케줄 보기</a>
			</nav>
			
			<!-- 정보수정 폼 -->
			<form action="updateinfo" method="POST" onsubmit ="return validation()">
				<table>
					<tr>
						<td><h2>ID</h2></td>
					<td>
						<p>${member.employee_num}</p>
					</td>
						</tr>
					<tr>
						<td><h2>비밀번호</h2></td>
					<td>
						<input type="password" name ="password" id="password" placeholder="비밀번호 입력"><br>
						<input type="password" name ="passwordcheck" id="passwordcheck" placeholder="비밀번호 다시 입력">
					</td>
				</tr>
				<tr>
					<td><h2>주소</h2></td>
					<td>
						<input type="text" name ="address" id="address" 
						value = "${member.employee_address}" style = "width:300;">
					</td>
				</tr>
				<tr>
					<td><h2>이메일</h2></td>
					<td>
						<input type="text" name ="email" id="email" 
						value = "${member.employee_email}">
					</td>
				</tr>
				<tr>
					<td><h2>연락처</h2></td>
					<td>
						<input type="text" name ="phone" id="phone" 
						value = "${member.employee_phone}">
					</td>
				</tr>
			</table>
			
			<fieldset>
				<input type="submit" value="수정">
				<input type="reset" value="다시 쓰기">
			</fieldset>
			</form> <!-- 정보수정 폼 끝 -->
		
        </div> <!-- 컨텐츠 끝 -->
    </div> <!-- 컨테이너 끝 -->
</body>
</html>