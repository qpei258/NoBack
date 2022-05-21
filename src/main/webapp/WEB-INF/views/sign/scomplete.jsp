<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류작성</title>
    <link rel="stylesheet" type="text/css" href="/blog/resources/css/default.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        </div>
    </div>
<div class="centerdiv">
<h1>[결제 서류]</h1>
<form id="scomplete" action="scomplete"  method="post" enctype="multipart/form-data">
	
<table>
<tr>
	<th>기안일</th>
	<td>
		<td>${signsign_cdate }</td>
	</td>
</tr>
<tr>
	<th>결제제목</th>
	<td>
		<td>${sign.sign_title }</td>
	</td>
</tr>
<tr>
	<th>결제내용</th> 
	<td>
		<td>${sign.sign_content }</td>
	</td>
</tr>
<tr>
	<th>작성자</th> 
	<td>
		<td>${sign.sign_sender }</td>
	</td>
</tr>
<tr>
	<th>부서</th> 
	<td>
		<td>${member.employee_dep}</td>
	</td>
</tr>
<tr>
	<th>직급</th> 
	<td>
		<td>${member.employee_pos }</td>
	</td>
</tr>
<tr>
	<th>수신자(보내는곳)</th> 
	<td>
		<td>${sign.sign_receiver }</td>
	</td>
</tr>
<tr>
	<th>첨부파일</th> 
	<td>
		<a href="download?sign_num=${sign.sign_num}">${sign.sign_originfile}</a>
	</td>
</tr>
<tr>
<td>
<label for="sign_ok">승인</label>
<input type = "checkbox" id="sign_ok" name="sign_ok" value="1">
<label for="sign_ok">반려</label>
<input type = "checkbox" id="sign_ok" name="sign_ok" value="-1">
</td>
</tr>
<tr>
	<td colspan="2" class="white center">
		<input type="submit" value="처리완료" />
	</td> 
</tr>
</table>
</form>
</div>

</body>
</html>