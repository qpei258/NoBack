<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<script>
function receiverOpen() {
	window.open('receivercheck', 'win', 'top=300,left=500,width=400,height=300,location=no,status=no');
}
</script>
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
<form id="swrite" action="swrite"  method="post" enctype="multipart/form-data">
	
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
<tr>
	<th>작성자</th> 
	<td>
		<input type="text" name="sign_sender" id="sign_sender" size="30">
	</td>
</tr>
<tr>
	<th>부서</th> 
	<td>
		<input type="text" name="sign_dep" id="sign_dep" size="30">
	</td>
</tr>
<tr>
	<th>직급</th> 
	<td>
		<input type="text" name="sign_pos" id="sign_pos" size="30">
	</td>
</tr>
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
