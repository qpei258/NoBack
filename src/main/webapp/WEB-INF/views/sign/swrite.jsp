<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>결제서류작성</title><!-- 결제서류 작성jsp -->
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script>

function receiverOpen1() {
	document.getElementById('target_btn2').disabled = false;
	window.open('check1', 'receiver', 'top=400,left=600,width=500,height=400,location=no,status=no');
}

function receiverOpen2() {
	let sign_receiver1 = document.getElementById('sign_receiver1'); 
	if (sign_receiver1.value != '') {
	document.getElementById('target_btn3').disabled = false;
	window.open('check2', 'receiver', 'top=400,left=600,width=500,height=400,location=no,status=no');
	}
}


function receiverOpen3() {
	let sign_receiver2 = document.getElementById('sign_receiver2'); 
	if (sign_receiver2.value != '') {
	document.getElementById('target_btn4').disabled = false;
	window.open('check3', 'receiver', 'top=400,left=600,width=500,height=400,location=no,status=no');
	}
}


function receiverOpen4() {
	let sign_receiver3 = document.getElementById('sign_receiver3'); 
	if (sign_receiver3.value != '') {
	window.open('check4', 'receiver', 'top=400,left=600,width=500,height=400,location=no,status=no');
	}
}


function formCheck() {
	let sign_title = document.getElementById('sign_title'); 
	let sign_content = document.getElementById('sign_content'); 
	let sign_sender = document.getElementById('sign_sender'); 
	let sign_nsender = document.getElementById('sign_nsender');
	let sign_receiver = document.getElementById('sign_receiver1'); 
	let sign_file = document.getElementById('upload'); 

	
	if (sign_file.value == '') {
		alert('파일을 넣어주세요.');
		return false;
	}
	if (sign_receiver1.value == '') {
		alert('수신자를 입력하세요.');
		return false;
	}

	if (sign_title.value.length < 3 || sign_title .value.length > 10) {
		alert('タイトルは3~10文字で入力してください。');
		return false;
	}
	if (sign_content.value.length < 1 || sign_content.value.length > 100) {
		alert('내용은 1~100자로 입력하세요.');
		return false;
	}

	if (sign_file.value == '') {
		return false;
	}
}



</script>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>'  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style type="text/css">
		#sign {
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
             <a class="nav-link"  href='<c:url value="../sign/main"/>'>決裁作成リスト</a>
           </li>
           <li class="nav-item">
             <a class="nav-link"  href='<c:url value="../sign/sdelay"/>'>決裁待機リスト</a>
           </li>
           <li class="nav-item">
             <a class="nav-link active" aria-current="page"  href='<c:url value="../sign/swrite"/>'>決裁作成</a>
           </li>
         </ul>
        	<div id="sign">
        	<h2 style="margin: 15px 0px 20px 0px;  font-size: 30px;" >決裁 書類</h2>
        		<form id="swrite" action="swrite"  method="post" onsubmit="return formCheck();" enctype="multipart/form-data"	style="margin-left: 260px;">
	        		<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
					  	<span class="input-group-text" id="basic-addon1" style="width: 100px;  text-align: center; font-weight: bold; height : 40px;">タイトル</span>
					  	<input type="text" name="sign_title" id="sign_title" style="width:500px; height : 40px; font-size: 15px;">
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%;  margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; text-align: center; font-weight: bold; " >内容</span>
						 <textarea name="sign_content" id="sign_content" style="width:500px;height:150px; font-size: 15px; resize:none; "></textarea>						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%;  margin: 0px auto 10px auto;">					
						 <input type="hidden" name="sign_sender" id="sign_sender" size="30" value="${member.employee_num}" readonly="readonly">						 
					</div>	
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%;  margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px; ">作成者</span>					
						 <input type="text" name="sign_nsender" id="sign_nsender" size="30" style="height : 40px; font-size: 15px; " value="${member.employee_name}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%;  margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">部署</span>
						 <input type="text" name="sign_dep" id="sign_dep" size="30" style="height : 40px; font-size: 15px;" value="${member.employee_dep}" readonly="readonly">						 
					</div>
					<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">職位</span>
						 <input type="text" name="sign_pos" id="sign_pos" size="30" style="height : 40px;font-size: 15px; " value="${member.employee_pos}" readonly="readonly">						 
					</div>
						<div class="input-group" style="border: 1px solid rgb(238, 238, 238); width: 90%;  margin: 0px auto 10px auto;">
						 <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">添付</span>
						 <input type="file" id="upload" name="upload" size="30" style="height : 40px; font-size: 20px;"> 					 
					</div>
					<div class="input-group" id="group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">   
	                  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;" >受信者1</span>
	                   <input type="text" name="sign_nreceiver1" id="sign_nreceiver1" maxlength="10"  readonly="readonly" style="height : 40px; font-size: 15px;">
	                   <input type="hidden" name="sign_receiver1" id="sign_receiver1" maxlength="10"  readonly="readonly" >
			             <input id='target_btn1' type="button" class="btn btn-secondary" value="受信者 検索" onclick="receiverOpen1()">
		                <br>
                    </div>
                    <div class="input-group" id="group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">   
	                  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;" >受信者2</span>
	                   <input type="text" name="sign_nreceiver2" id="sign_nreceiver2" maxlength="10"  readonly="readonly" style="height : 40px; font-size: 15px; " >
	                   <input type="hidden" name="sign_receiver2" id="sign_receiver2" maxlength="10"  readonly="readonly" >
			             <input id='target_btn2' type="button" class="btn btn-secondary" value="受信者 検索" onclick="receiverOpen2()" disabled>
		                <br>
                    </div>	  
                    <div class="input-group" id="group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">   
	                  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;" >受信者3</span>
	                   <input type="text" name="sign_nreceiver3" id="sign_nreceiver3" maxlength="10" value='' readonly="readonly" style="height : 40px; font-size: 15px; ">
	                   <input type="hidden" name="sign_receiver3" id="sign_receiver3" maxlength="10"  readonly="readonly" >
			             <input id='target_btn3' type="button" class="btn btn-secondary" value="受信者 検索" onclick="receiverOpen3()" disabled>
		                <br>
                    </div>	  
                    <div class="input-group" id="group" style="border: 1px solid rgb(238, 238, 238); width: 90%; margin: 0px auto 10px auto;">   
	                  <span class="input-group-text" style="width: 100px; font-weight: bold; height : 40px;">受信者4</span>
	                   <input type="text" name="sign_nreceiver4" id="sign_nreceiver4" maxlength="10"  readonly="readonly"style="height : 40px; font-size: 15px;">
	                   <input type="hidden" name="sign_receiver4" id="sign_receiver4" maxlength="10"  readonly="readonly" >
			             <input id='target_btn4'type="button" class="btn btn-secondary" value="受信者 検索" onclick="receiverOpen4()" disabled>
                    </div>	  	  
						<input type="submit" class="btn btn-primary" value = "作成" />
		                <input type = "reset" class="btn btn-primary" style=" margin-right: 200px;" value ="リセット">
				</form>
        	</div>
        </div>
</body>
</html>



  