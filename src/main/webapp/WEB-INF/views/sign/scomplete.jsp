<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류작성</title>
<script type="text/javascript" src="jquery-3.6.0.js"></script>
<script>
function formCheck() {
	let sign_memo = document.getElementById('sign_memo'); 

	if (sign_memo.value.length < 1 || sign_memo .value.length > 50) {
		alert('메모는 1~50자로 입력하세요.');
		return false;
	}
	return true;
}

function receiverOpen() {
	window.open('check', 'receiver', 'top=300,left=500,width=400,height=300,location=no,status=no');
}
</script>
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
		/* 상단메뉴 */
.topmenu {
	border: 15px solid rgb(148, 202, 238);
	background-color: rgb(148, 202, 238);
	float: top;
	margin: 9px 9px;
	width: 1257px;
	height: 60px;
}
	</style>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
		<div id="content">
          <nav class="topmenu">
				<a href='<c:url value="../sign/main"/>'>결제작성 리스트&nbsp;&nbsp;</a> 
				<a href='<c:url value="../sign/sdelay"/>'>결제대기 리스트 &nbsp;&nbsp;</a> 
				<a href='<c:url value="../sign/swrite"/>'>&nbsp;결제 작성</a>
		</nav>
        <div id="content">
        	<div id="sign">
        	<h1>[결제 서류]</h1>
        		<form id="scomplete" action="scomplete"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data">
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
						 <input type="hidden" name="sign_receiver1" id="sign_receiver1" size="10" value="${sign.sign_receiver1}" readonly="readonly">
						  <input type="text" name="sign_nreceiver1" id="sign_nreceiver1" size="10" value="${sign.sign_nreceiver1}" readonly="readonly">
						  <c:if test="${sign.sign_ok1 == 0}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok1 == 1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok1 == -1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly">
						  </c:if>
					</div>
					<c:if test="${sign.sign_receiver2 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >수신자2(보내는곳)</span>
						 <input type="hidden" name="sign_receiver2" id="sign_receiver2" size="10" value="${sign.sign_receiver2}" readonly="readonly">
						  <input type="text" name="sign_nreceiver2" id="sign_nreceiver2" size="10" value="${sign.sign_nreceiver2}" readonly="readonly">
						  <c:if test="${sign.sign_ok2 == 0}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok2 == 1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok2 == -1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly">
						  </c:if>
					</div>
					</c:if>
					<c:if test="${sign.sign_receiver3 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >수신자3(보내는곳)</span>
						 <input type="hidden" name="sign_receiver3" id="sign_receiver3" size="10" value="${sign.sign_receiver3}" readonly="readonly">
						  <input type="text" name="sign_nreceiver3" id="sign_nreceiver3" size="10" value="${sign.sign_nreceiver3}" readonly="readonly">
						  <c:if test="${sign.sign_ok3 == 0}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok3 == 1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok3 == -1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly">
						  </c:if>
					</div>
					</c:if>
					<c:if test="${sign.sign_receiver4 != null}">
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >수신자4(보내는곳)</span>
						 <input type="hidden" name="sign_receiver4" id="sign_receiver4" size="10" value="${sign.sign_receiver4}" readonly="readonly">
						  <input type="text" name="sign_nreceiver4" id="sign_nreceiver4" size="10" value="${sign.sign_nreceiver4}" readonly="readonly">
						  <c:if test="${sign.sign_ok4 == 0}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="대기" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok4 == 1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="승인" readonly="readonly">
						  </c:if>
						   <c:if test="${sign.sign_ok4 == -1}">
						  <span class="input-group-text" >승인여부</span>
						  <input type="text" size="10" value="반려" readonly="readonly">
						  </c:if>
					</div>
					</c:if>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >첨부파일</span>
						 <a href="download?sign_num=${sign.sign_num}">${sign.sign_originfile}</a>						 
					</div>
			
					<c:if test="${sessionScope.LoginId == sign.sign_receiver1}">
					<c:if test="${sign.sign_ok1 == 0}">
					<div style="border: 1px solid rgb(238, 238, 238);">
					       <input type="radio" id="sign_ok1" name="sign_ok1" value='1'>승인1
					       <input type="radio" id="sign_ok1" name="sign_ok1" value='-1' checked="checked">반려1
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >메모</span>
						 <textarea name="sign_memo" id="sign_memo" style="width:200px;height:100px;resize:none;" ></textarea>						 
					</div>       
					<div>
					   <input type="submit" class="btn btn-primary" value="처리완료" />
					</div>                           
					</div>                             
					</c:if>
					</c:if>
					
					<c:if test="${sessionScope.LoginId == sign.sign_receiver2}">
					<c:if test="${sign.sign_ok2 == 0}">
					<div style="border: 1px solid rgb(238, 238, 238);">
					       <input type="radio" id="sign_ok2" name="sign_ok2" value='1'>승인2
					       <input type="radio" id="sign_ok2" name="sign_ok2" value='-1' checked="checked">반려2
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >메모</span>
						 <textarea name="sign_memo" id="sign_memo" style="width:200px;height:100px;resize:none;" ></textarea>						 
					</div>       
					<div>
					   <input type="submit" class="btn btn-primary" value="처리완료" />
					</div>                           
					</div>                               
					</c:if>
					</c:if>
					
					<c:if test="${sessionScope.LoginId == sign.sign_receiver3}">
					<c:if test="${sign.sign_ok3 == 0}">
					<div style="border: 1px solid rgb(238, 238, 238);">
					       <input type="radio" id="sign_ok3" name="sign_ok3" value='1'>승인3
					       <input type="radio" id="sign_ok3" name="sign_ok3" value='-1' checked="checked">반려3
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >메모</span>
						 <textarea name="sign_memo" id="sign_memo" style="width:200px;height:100px;resize:none;" ></textarea>						 
					</div>       
					<div>
					   <input type="submit" class="btn btn-primary" value="처리완료" />
					</div>                           
					</div>           
					</c:if>
					</c:if>
					
					<c:if test="${sessionScope.LoginId == sign.sign_receiver4}">
					<c:if test="${sign.sign_ok4 == 0}">
					<div style="border: 1px solid rgb(238, 238, 238);">
					       <input type="radio" id="sign_ok4" name="sign_ok4" value='1'>승인4
					       <input type="radio" id="sign_ok4" name="sign_ok4" value='-1' checked="checked">반려4
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto;">
						 <span class="input-group-text" >메모</span>
						 <textarea name="sign_memo" id="sign_memo" style="width:200px;height:100px;resize:none;" ></textarea>						 
					</div>       
					<div>
					   <input type="submit" class="btn btn-primary" value="처리완료" />
					</div>                           
					</div>
					</c:if>
					</c:if>
					<div>
					   <input type ="hidden"  name="sign_num" id="sign_num" value="${sign.sign_num}"> 
					</div>
				</form>
        	</div>
        </div>
    </div>
</body>
</html>

<!-- <label for="sign_ok">승인</label> <c:if test="${counter == navi.currentPage}"></b></c:if>
                           <input type = "checkbox" id="sign_ok" name="sign_ok" value="1">
                           <label for="sign_ok">반려</label>
                           <input type = "checkbox" id="sign_ok" name="sign_ok" value="-1"> -->