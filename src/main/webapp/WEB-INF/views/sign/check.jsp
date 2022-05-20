<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" %>
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
		alert('검색할 이름을 입력하세요.');
		return false;
	}
	return true;
}

function searchname() {
	opener.document.getElementById('name').value = '${searchname}';
	this.close();
}
</script>
</head>
<body>
<div class="centerdiv">
<h2>[사원 검색]</h2>

<form action="check" method="post" onSubmit="return formCheck();">
	검색할 사원 <input type="text" name="employee_name" id="employee_name" />
			<input type="submit" value="검색" />
</form>

<!-- 검색 후 -->
<c:if test="${searchname != null}">
	    <p>${searchname}</p>
		<p><input type="button" value="선택하기" onclick="selectname"></p>
</c:if>
<!-- 검색결과가 없음 -->
	<c:if test="${searchname == null}">
	    <p>없는 사원입니다.</p>
	</c:if>

</div>
</body>
</html>