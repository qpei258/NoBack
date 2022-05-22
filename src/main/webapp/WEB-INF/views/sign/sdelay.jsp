<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />
    <style type="text/css">
    	
    	#signList{
    		margin:10px auto;
    		width: 1258px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    
    </style>
    <!-- 페이지 이동 스크립트  -->
	<script>
		function pagingFormSubmit(currentPage) {
			var form = document.getElementById('pagingForm');
			var page = document.getElementById('page');
			page.value = currentPage;
			form.submit();
		}
	</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="signList">
        		<h2 style="margin: 40px 0px 10px 0px;">결제 작성 리스트</h2>
        		<div style="float: right; margin-bottom: 0px; margin-right: 62px; border: 0px; height: 50px;">
				</div>
				<table class="table table-hover" style="width: 90%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
				      	    <th style="width: 20%;">글번호</th>
        					<th style="width: 30%;">기안일</th>
	        				<th style="width: 35%;">제목</th>
	        				<th style="width: 15%;">기안자</th>
        				</tr>
				  	</thead>
				  	<tbody>
						  <c:forEach var="sign" items="${listSign2}">
                          <tr>
                          <td class="center">${sign.sign_num}</td>
	                      <td class="center">${sign.sign_cdate}</td>
	                      <td>
		                  <a href="scomplete?sign_num=${sign.sign_num}">${sign.sign_title}</a>
	                      </td>
	                      <td>
	                     <td class="center">${sign.sign_sender}</td>
                  	</td>
                      </tr>
                    </c:forEach>  
				  </tbody>
				</table>
        		<div id="navigator" style="border: 0px; font-size: 20px;">
				<!-- 페이지 이동 부분 -->                      
					<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;&nbsp;
				
					<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
						<c:if test="${counter == navi.currentPage}"><b></c:if>
							<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
						<c:if test="${counter == navi.currentPage}"></b></c:if>
					</c:forEach>
					&nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
					<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
				
				<!-- /페이지 이동 끝 -->                      
			
				</div>
        	</div>
        </div>
    </div>
</body>
</html>