<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 검색</title>
<script>
function formCheck() {
	let name = document.getElementById('searchname');
	if (name.value == '') {
		alert('검색할 사원의 이름을 입력하세요.');
		return false;
	}
	return true;
}

function searchname() {
	opener.document.getElementById('sign_receiver').value = '${searchname}';
	this.close();
}
</script>
</head>
<body>
<div class="centerdiv">
<h2>[사원 검색]</h2>

<form action="check" method="post" onSubmit="return formCheck();">
	검색할 사원 <input type="text" name="searchname" id="searchname" />
			<input type="submit" value="검색" />
</form>

<!-- 검색 후 -->
<c:if test="${searchname != null}">
	    <p>${searchname}</p>
		<p><input type="button" value="선택하기" onclick="searchname()"></p>
</c:if>

</div>
</body>
</html>