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
#boardList {
	margin: 10px auto;
	width: 1258px;
	height: 870px;
	background-color: rgb(238, 238, 238);
	text-align: center;
	color: rgb(80, 80, 80);
	display: flex;
	flex-direction: column-reverse;
	overflow-y: auto;
}
</style>
    <script>
					function formCheck() {
						var content = document.getElementById('chatsubmit');

						if (content.value == '') {
							alert('메세지가 입력되지 않았습니다');
							return false;
						}
						return true;
					}

					$('#boardList').scrollTop($('#boardList')[0].scrollHeight);
					
					
				    
				            //document.getElementById('chat_send_form').click();
				    
				      function enterkey() {
				    	if (window.event.keyCode == 13) {
				    		getElementById('submit').click();
				        }
				    }

					
					
					
					
				</script>
</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
        	<div id="boardList" action="boardList()">
        	
        	
        	<div style="float: left; margin-bottom: 10px ; margin-left: 63px;  border: 0px;">
        		
        			<table class="table table-hover" style="width: 100%;font-size: 20px;margin: 0px auto 20px auto; border-spacing: 0;">
				  	<thead>
				      	<tr style="background-color: rgb(200, 200, 200);">
        					<th style="width: 20%;">작성자</th>
	        				<th style="width: 75%;">내용</th>
	        				<th style="width: 20%;">시간</th>
        				</tr>
				  	</thead>
				  	<tbody>
						  <c:forEach var="messenger" items="${messenger}">
						  		<td>${messenger.messenger_writer_name }</td>
						  		<td>${messenger.messenger_content }</td>
						  		<td>${messenger.messenger_date }</td>
						  		<tr>
						  </c:forEach>
						  </tbody>
						  </table>
						  
												
												<script>
											
												</script>
				
													<div class="float" style="height: 90px">
													<form id="chat_send_form" name="chatform" action="chatsubmit" method="POST" onsubmit="return formCheck();" >
													<textarea style="height: 80px;" id="chatsubmit" name="chatcontent" 
														class="form_control" placeholder="메세지를 입력하세요." onkeyup="enterkey()"
														maxlength="100"></textarea>
												
													
													<button class="btn btn-outline-secondary" type="submit" id="submit">전송</button>
														</form>
														</div>
														
														
													
												
						  
						  
						  
						  
						  
        			
        			
        			
        		
        		
        		
        		
        		
        		</div>
        	
        	
        		</div>
        </div>
    </div>
</body>
</html>