<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류확인</title>
<script type="text/javascript" src="jquery-3.6.0.js"></script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style type="text/css">
		#sign {
			margin:10px auto;
    		width: 1258px;
    		height: 870px;
    		background-color: rgb(238, 238, 238);
    		text-align: center;
    		color: rgb(80, 80, 80);
    	}
    	
    	a{
    		text-decoration: none;
    		color: rgb(80, 80, 80);
    	}
    	
    	a:hover {
			color: rgb(20, 20, 20);
		}
	</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="sign">
        	<h1>[결제 서류]</h1>
        		<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data">
        		    <div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 10px auto 0px auto;">
					  	<span class="input-group-text" id="basic-addon1">기안일</span>
					  	<input type="text" name="signsign_cdate" id="signsign_cdate" style="width:400px;" value="${sign.sign_cdate}" readonly="readonly">
					</div>
	        		<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 10px auto 0px auto;">
					  	<span class="input-group-text" id="basic-addon1">제목</span>
					  	<input type="text" name="sign_title" id="sign_title" style="width:400px;" value="${sign.sign_title}" readonly="readonly">	
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >내용</span>
						 <input type="text" name="sign_content" id="sign_content" style="width:400px;" style="height:200px;" value="${sign.sign_content}" readonly="readonly" >					 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >작성자</span>
						 <input type="text" name="sign_sender" id="sign_sender" size="30" value="${sign.sign_nsender}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >부서</span>
						 <input type="text" name="sign_dep" id="sign_dep" size="30" value="${sign.sign_dep}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >직위</span>
						 <input type="text" name="sign_pos" id="sign_pos" size="30" value="${sign.sign_pos}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >수신자1(보내는곳)</span>
						  <input type="text" name="sign_receiver1" id="sign_receiver1" size="30" value="${sign.sign_nreceiver1}" readonly="readonly">
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >첨부파일</span>
						 <a href="download?sign_num=${sign.sign_num}">${sign.sign_originfile}</a>						 
					</div>
					<c:if test="${sign.sign_ok == 0}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
					       <span class="input-group-text" >결제상태</span>
                           <input type="text" name="sign_ok" id="sign_ok" size="30" value="대기" readonly="readonly">	
					</div>
					<c:if test="${sign.sign_ok == 1}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
					       <span class="input-group-text" >결제상태</span>
                           <input type="text" name="sign_ok" id="sign_ok" size="30" value="승인" readonly="readonly">	
					</div>
					</c:if>
					<c:if test="${sign.sign_ok == -1}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
					       <span class="input-group-text" >결제상태</span>
                           <input type="text" name="sign_ok" id="sign_ok" size="30" value="반려" readonly="readonly">	
					</div>
					</c:if>
					</c:if>
					<c:if test="${sign.sign_memo != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >메모</span>
						 <input type="text" name="sign_content" id="sign_content" style="width:400px;" style="height:200px;" value="${sign.sign_memo}" readonly="readonly" >						 
					</div>
					</c:if>
				</form>
        	</div>
        </div>
    </div>
</body>
</html>