<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<%--<meta HTTP-EQUIV="refresh" CONTENT="15">	<%--새로 고침 3초간 반복 최신 대화 정보 가져옴--%>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <link rel="stylesheet" href="../resources/css/custom.css">
    <title>Document</title>
   
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/bootstrap.js"></script>
	
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/chat.css"/>' />
    <style type="text/css">

</style>
    <script>
    
					function formCheck() {//버튼 폼첵
						var content = document.getElementById('chatsubmit');

						if (content.value == '') {
							alert('메세지가 입력되지 않았습니다');
							return false;
						}
						return true;
					}
					
					document.getElementById('chatList').scrollTop = document.getElementById('chatList').scrollHeight;
					
					
				            //document.getElementById('chat_send_form').click();
				    
				      function enterkey() {  //엔터키 입력 처리
				    	  var form = document.getElementById('chat_send_form');
				    	  var submit = document.getElementById('submit');
				    	  var content = document.getElementById('chatsubmit');
				    	 
				    	  document.getElementById('submit');
				    	  
				    	if (window.event.keyCode == 13){
				    			if(content.value == '\n' ){
				    		//form.submit();
				    			document.getElementById("chatsubmit").value='';
				    		
				        }else{	
				    			submit.click();
				    			
				        }
				      }
				    }
				      
					
					
					
					
				</script>
</head>
                       
<body>
	<div class="container bootstrap snippet">
							<div class="row">
								<div class="col-xs-12">
									<div class="portlet portlet-default">
										<div class="portlet-heading">
											<div class="portlet-title">
												<h4>
													<i class="fa fa-circle text-green"></i>실시간 채팅창
												</h4>
											</div>
											<div class="clearfix">
											
											</div>
										</div>
										<div id="chat" class="panel-collapse collapse in">
											<div id="chatList" class="portlet-body chat_widget" style="overflow-y: auto; width: auto; height:600px;">
												
												
												<table class="table table-hover" style="width: 100%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
												<tbody>
												
						  						<c:forEach var="messenger" items="${messenger}">
						  						<td><img class="img-circle" src="../resources/img/${messenger.picture}" style="width:30px; height:30px"></td>
						  						<td>${messenger.messenger_writer_name }</td>
						  						<td>${messenger.messenger_content }</td>
						  						<td>${messenger.messenger_date }</td>
						  						<tr>
						  						</c:forEach>
						  						</tbody>
						  						</table>
											<%--여기에 내용을 출력한다 --%>
										</div>
										<div class="portlet-footer">
											
											<form id="chat_send_form" name="chatform" action="chatsubmit" method="POST" onsubmit="return formCheck();" >
												<div class="form-group col=xs-4">
													
													<textarea style="height: 80px; resize: none; width: 100%;" id="chatsubmit" name="chatcontent"
														class="form-control" placeholder="메세지를 입력하세요." onkeyup="enterkey()"
														maxlength="100" ></textarea>
												</div>
												<div class=form-groupcol-xs-2">
													<button type="submit" class="btn btn-default pull-right" type="submit" id="submit"
														onclick="submitFunction();">전송</button>
													<div class="clearfix"></div>
												</div>
												</form>
											</div>
										</div>
									</div>
				</div>
			</div>
		</div>
	<script>
		document.getElementById('chatsubmit').focus();
	</script>
</body>
</html>