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
<style>
.table-hover{
	border-collapse: collapse;
	border-top: 1px solid black;
	border-left: 1px solid black;
}  
.table-hover th, .table-hover td {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	text-align : center;
}

</style>
<script>
function formCheck() {
	let name = document.getElementById('searchname');
	if (name.value == '') {
		alert('검색할 사원의 이름을 입력하세요.');
		return false;
	}
	return true;
}

function searchname(num, name) {
	opener.document.getElementById('sign_receiver2').value = num;
	opener.document.getElementById('sign_nreceiver2').value = name;
	this.close();
}
</script>
</head>
<body>
<div class="centerdiv">
<h2>[사원 검색]</h2>

<form action="check2" method="post" onSubmit="return formCheck();">
	<h3 class="centerdiv" >검색할 사원 : <input type="text" name="searchname" id="searchname" />
			<input type="submit" class="btn btn-primary" value="검색" /></h3>
</form>
<table class="table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
				      	    <th style="width: 30%;">사원번호</th>
        					<th style="width: 20%;">이름</th>
	        				<th style="width: 20%;">부서</th>
	        				<th style="width: 20%;">직위</th>
	        				<th style="width: 10%;">선택</th>
        				</tr>
				  	</thead>
			          <c:if test="${searchname != null}">
			       
				    		<c:forEach var="m" items="${member}">
				    		<tr>
				    		<td class="center">${m.employee_num}</td>
                            <td class="center">${m.employee_name}</td>
	                        <td class="center">${m.employee_dep}</td>   
		                     <td class="center">${m.employee_pos}</td>
	                        <td>
	                        <p><input type="button" value="선택하기" onclick="searchname('${m.employee_num}','${m.employee_name}')"></p>
	                         </td>
	                         </tr>
	                        </c:forEach>
	                
                    </c:if>
				</table>
</div>
</body>
</html>
