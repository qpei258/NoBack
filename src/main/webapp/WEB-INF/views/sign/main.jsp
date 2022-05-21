<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제내역전체서류</title>
    <style type="text/css">

</style>
<script type="text/javascript">

</script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
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
	<td>
		<a href="scomplete?sign_num=${sign.sign_num}">${sign.sign_title}</a>
	</td>
	<td class="center">${sign.sign_sender}</td>
	<td class="center">${sign.sign_ok}</td>
</tr>
</c:forEach>        
<!-- 반복 끝 -->
</table>
<br/><br/>
        </div>
    </div>
</body>
</html>



