<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류작성</title>
<script type="text/javascript" src="jquery-3.6.0.js"></script>
<script>
function formCheck() {
	let sign_title = document.getElementById('sign_title'); 
	let sign_content = document.getElementById('sign_content'); 
	let sign_sender = document.getElementById('sign_sender'); 
	let sign_receiver = document.getElementById('sign_receiver'); 
	alert(sign_sender.value);
	if (sign_title.value.length < 3 || sign_title .value.length > 10) {
		alert('제목은 3~10자로 입력하세요.');
		return false;
	}
	if (sign_content.value.length < 1 || pw1.value.length > 100) {
		alert('내용은 1~100자로 입력하세요.');
		return false;
	}
	if (sign_sender.value == '') {
		alert('보내는사람을 입력하세요.');
		return false;
	}
	if (sign_receiver.value == '') {
		alert('수신자를 입력하세요.');
		return false;
	}
	return true;
}

function receiverOpen() {
	window.open('check', 'receiver', 'top=300,left=500,width=400,height=300,location=no,status=no');
}
</script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style type="text/css">
		#sign {
			margin:10px auto;
    		width: 1258px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    	
    	a{
    		text-decoration: none;
    		color: rgb(80, 80, 80);
    	}
    	
    	a:hover {
			color: rgb(20, 20, 20);
		}
	</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="sign">
        	<h1>[결제 서류]</h1>
        		<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data">
	        		<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 0px auto;">
					  	<span class="input-group-text" id="basic-addon1">제목</span>
					  	<input type="text" name="sign_title" id="sign_title" style="width:400px;">
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >내용</span>
						 <textarea name="sign_content" id="sign_content" style="width:400px;height:200px;resize:none;"></textarea>						 
					</div>
					<c:if test="${sessionScope.loginId == member.employee_num}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >작성자</span>
						 <input type="text" name="sign_sender" id="sign_sender" size="30" value="${member.employee_name}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >부서</span>
						 <input type="text" name="sign_dep" id="sign_dep" size="30" value="${member.employee_dep}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >직위</span>
						 <input type="text" name="sign_pos" id="sign_pos" size="30" value="${member.employee_pos}" readonly="readonly">						 
					</div>
					</c:if>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >수신자1(보내는곳)</span>
						 <input type="text" name="sign_receiver" id="sign_receiver" maxlength="10" placeholder="수신자">
			             <input type="button" value="부서검색" onclick="receiverOpen()">
						  
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >첨부파일</span>
						 <input type="file" name="upload" size="30">	
						 					 
					</div>
					<div style="border: 1px solid rgb(238, 238, 238);">
						<input type="submit" value = "작성" />
		                <input type = "reset" value ="초기화">
					</div>
				</form>
        	</div>
        </div>
    </div>
</body>
</html>


  