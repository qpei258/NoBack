<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 서류 작성</title>
</head>
<body>
<div class="centerdiv">
<h1>[ 회원 가입 ]</h1>

<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" name="id" id="id" maxlength="10" placeholder="ID중복확인 이용" readonly="readonly">
			<input type="button" value="ID중복확인" onclick="idcheckOpen()">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="비밀번호 입력"><br>
		<input type="password" id="password2" placeholder="비밀번호 다시 입력"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" placeholder="이름 입력"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" placeholder="전화번호 입력"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" placeholder="주소 입력" style="width:300px;"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" placeholder="이메일 입력"></td>
	</tr>
</table>
	<br>

<input type="submit" value="가입" />
<input type="reset" value="다시 쓰기" />

</form>

</div>
</body>
</html>