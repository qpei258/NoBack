<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역전체서류</title>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="centerdiv">
<h2>[E004]</h2>

<br>
<table>
<tr>
	<th>기안일</th>
	<th style="width:220px">제목</th>
	<th>기안자</th>
	<th>결제상태</th>
</tr>

<!-- 반복 시작 -->
<c:forEach var="sign" items="${listSign}">
<tr>
	<td class="center">${sign.sign_cdate}</td>
	<td class="center">${sign.title}</td>
	<td class="center">${sign_sender}</td>
	<td class="center">
	<!-- 결제상태 -->
<c:if test="${sign_ok1 == 1}">
    <p>반려</p>
	<c:if test="${sign_ok2 == 2}">
		<p>승인</p>
	</c:if>
	<p>대기</p>
</c:if>
	</td>
</tr>
</c:forEach>        
<!-- 반복 끝 -->
</table>
<br/><br/>

                   
</div>
</body>
</html>