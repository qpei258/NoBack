<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류작성</title>
<script>
function formCheck() {
	let sign_title = document.getElementById('sign_title'); 
	let sign_content = document.getElementById('sign_content'); 
	let sign_sender = document.getElementById('sign_sender'); 
	let sign_receiver = document.getElementById('sign_receiver'); 
	
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
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous">

</script>

</head>

<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        <div class="centerdiv">
<h1>[결제 서류]</h1>
<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data">
	
<table>
<tr>
	<th>결제제목</th>
	<td>
		<input type="text" name="sign_title" id="sign_title" style="width:400px;">
	</td>
</tr>
<tr>
	<th>결제내용</th> 
	<td>
		<textarea name="sign_content" id="sign_content" style="width:400px;height:200px;resize:none;"></textarea>
	</td>
</tr>

<c:if test="${sessionScope.loginId == member.employee_num}">
<tr>
	<th>작성자</th> 
	<td>
		<input type="text" name="sign_sender" id="sign_sender" size="30" value="${member.employee_name}" readonly="readonly">
	</td>
</tr>

<tr>
	<th>부서</th> 
	<td>
		<input type="text" name="sign_dep" size="30" value="${member.employee_dep}" readonly="readonly">
	</td>
</tr>
 <tr>
	<th>직급</th> 
	<td>
		<input type="text" name="sign_pos" size="30" value="${member.employee_pos}" readonly="readonly">
	</td>
</tr>
</c:if>
<tr>
		<th>수신자(보내는곳)</th>
		<td>
			<input type="text" name="sign_receiver" id="sign_receiver" maxlength="10" placeholder="수신자">
			<input type="button" value="부서검색" onclick="receiverOpen()">
		</td>
</tr>

<tr>
	<th>첨부파일</th> 
	<td>
		<input type="file" name="upload" size="30">
	</td>
</tr>
<tr>
	<td colspan="2" class="white center">
		<input type="submit" value="작성" />
	</td> 
</tr>
</table>
</form>
</div>

</body>
</html>

<!--<tr>
	<th>부서</th> 
	<td>
		<input type="text" name="sign_dep" id="sign_dep" size="30">
	</td>
</tr>
<!-- <tr>
	<th>직급</th> 
	<td>
		<input type="text" name="sign_pos" id="sign_pos" size="30">
	</td>
</tr> -->
        
  