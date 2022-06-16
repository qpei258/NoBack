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
		#sign{
		margin: 10px auto;
		width: 1258px;
		height: 797px;
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
          <ul class="nav nav-tabs" style="margin: 10px;">
           <li class="nav-item">
             <a class="nav-link active" aria-current="page"  href='<c:url value="../sign/main"/>'>決裁作成リスト</a>
           </li>
           <li class="nav-item">
             <a class="nav-link"  href='<c:url value="../sign/sdelay"/>'>決裁待機リスト</a>
           </li>
           <li class="nav-item">
             <a class="nav-link"  href='<c:url value="../sign/swrite"/>'>決裁作成</a>
           </li>
         </ul>
        <div id="content">
        	<div id="sign" style="background-color: rgb(238, 238, 238);">
        	<h1 style="margin: 30px 0px 30px 0px;  font-size: 30px;">決裁 書類</h1>
        		<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data" style="margin-left: 260px;">
        		    <div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
					  	<span class="input-group-text" id="basic-addon1" style="width: 100px; font-weight: bold; height : 40px;">기안일</span>
					  	<input type="text" name="signsign_cdate" id="signsign_cdate" style="width:400px; height : 40px; font-size: 20px;" value="${sign.sign_cdate}" readonly="readonly">
					</div>
	        		<div class="input-group mb-3" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
					  	<span class="input-group-text" id="basic-addon1" style="width: 100px; font-weight: bold; height : 40px;">제목</span>
					  	<input type="text" name="sign_title" id="sign_title" style="width:400px; height : 40px; font-size: 20px;" value="${sign.sign_title}" readonly="readonly">	
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold;" >내용</span>
						 <input type="text" name="sign_content" id="sign_content" style="width:400px; height:100px; font-size: 20px;" value="${sign.sign_content}" readonly="readonly" >					 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >작성자</span>
						 <input type="text" name="sign_sender" id="sign_sender" size="30"  style="height : 40px; height : 40px; font-size: 20px;" value="${sign.sign_nsender}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">부서</span>
						 <input type="text" name="sign_dep" id="sign_dep" size="30" style="height : 40px; height : 40px; font-size: 20px;" value="${sign.sign_dep}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >직위</span>
						 <input type="text" name="sign_pos" id="sign_pos" size="30"  style="height : 40px; height : 40px; font-size: 20px;" value="${sign.sign_pos}" readonly="readonly">						 
					</div>
					
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >수신자1</span>
						  <input type="text" name="sign_receiver1" id="sign_receiver1" style="height : 40px; font-size: 20px;"  size="10" value="${sign.sign_nreceiver1}" readonly="readonly">
						  <c:if test="${sign.sign_ok1 == 0}">
						  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly" style="height : 40px; height : 40px; font-size: 20px;">
						  </c:if>
						   <c:if test="${sign.sign_ok1 == 1}">
						  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly" style="height : 40px; height : 40px; font-size: 20px;">
						  </c:if>
						   <c:if test="${sign.sign_ok1 == -1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px; " >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly" style="height : 40px; height : 40px; font-size: 20px;">
						  </c:if>
					</div>
					<c:if test="${sign.sign_receiver2 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">수신자2</span>
						  <input type="text" name="sign_receiver2" id="sign_receiver2" size="10" value="${sign.sign_nreceiver2}" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  <c:if test="${sign.sign_ok2 == 0}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  </c:if>
						  <c:if test="${sign.sign_ok2 == 1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;">승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  </c:if>
						   <c:if test="${sign.sign_ok2 == -1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  </c:if>
					</div>
					</c:if>
					<c:if test="${sign.sign_receiver3 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">수신자3</span>
						  <input type="text" name="sign_receiver3" id="sign_receiver3" size="10" value="${sign.sign_nreceiver3}" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  <c:if test="${sign.sign_ok3 == 0}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly" style=" height : 40px; font-size: 20px;" >
						  </c:if>
						  <c:if test="${sign.sign_ok3 == 1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  </c:if>
						   <c:if test="${sign.sign_ok3 == -1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly" style=" height : 40px;font-size: 20px;">
						  </c:if>
					</div>
					</c:if>
					<c:if test="${sign.sign_receiver4 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >수신자4</span>
						  <input type="text" name="sign_receiver4" id="sign_receiver4" style=" height : 40px; font-size: 20px;" size="10" value="${sign.sign_nreceiver4}" readonly="readonly">
						    <c:if test="${sign.sign_ok4 == 0}">
						  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly"style=" height : 40px; font-size: 20px;" >
						  </c:if>
						  <c:if test="${sign.sign_ok4 == 1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;">승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly" style=" height : 40px; font-size: 20px;">
						  </c:if>
						   <c:if test="${sign.sign_ok4 == -1}">
						  <span class="input-group-text"style="width: 100px; font-weight: bold; height : 40px;" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly"style=" height : 40px; font-size: 20px;">
						  </c:if>
					</div>
					</c:if>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; height : 30px;" >첨부파일</span>
						 <a href="download?sign_num=${sign.sign_num}" style="font-size: 20px;">${sign.sign_originfile}</a>						 
					</div>
					<c:if test="${sign.sign_memo != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text"style="width: 100px; font-weight: bold; " >메모</span>
						 <input type="text" name="sign_content" id="sign_content" style="width:400px; font-size: 20px; height:100px;" value="${sign.sign_memo}" readonly="readonly" >						 
					</div>
					</c:if>
				</form>
        	</div>
        </div>
    </div>
    </div>
</body>
</html>