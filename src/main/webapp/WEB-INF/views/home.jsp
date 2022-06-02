<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Noback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/home.css" />
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		
		function chatPopup(num) { //팝업 기능 추가 작업중
			window.open('messenger/chat?num='+num, 'win', 'top=400,left=600,width=560,height=600,location=no,status=no');

		}
		
		function re() {
			location.reload();
		}
		setTimeout(re, 2000);
	</script>
</head>
<body>
<div id="container">
		<%@ include file="sidebar.jsp" %>
        <div id="content">
            <div id="menubar">
                <div class="topmenu" ><a href='<c:url value="/"/>' style="color: white;">홈</a></div>
                <div class="topmenu"><a href='<c:url value="/notice/noticeList"/>' style="color: rgb(80, 80, 80);">공지사항</a></div>
                <div class="topmenu"><a href='<c:url value="/sign/sdelay"/>' style="color: rgb(80, 80, 80);">전자결재</a></div>
                <c:if test="${LoginId == null }">
                	<div class="topmenu"><a href='<c:url value="/manager/login"/>' style="color: rgb(80, 80, 80);">로그인</a></div>
                </c:if>
                <c:if test="${LoginId != null && LoginLevel <= 2}">
                	<div class="topmenu" ><a href='<c:url value="/mypage/update"/>' style="color: rgb(80, 80, 80);">마이페이지</a></div>
                </c:if>
                <c:if test="${LoginId != null && LoginLevel >= 3}">
                	<div class="topmenu"><a href='<c:url value="/manager/memberlist"/>' style="color: rgb(80, 80, 80);">관리자페이지</a></div>
                </c:if>
            </div>
            <div id="maincontent1">
				<div id="my">
					<c:if test="${LoginId != null }">
						<div id="profile">
							<div class="photo">
								<img src="<c:url value='/resources/img/프로필.png'/>">
							</div>
							<div id="info" onclick="location.href='<c:url value="/mypage/update"/>'" >
								<span style="font-weight: 700; font-size: 35px;">${member.employee_name }</span><br>
								<span style="font-size: 25px;">${member.employee_dep } ${member.employee_pos }</span>
							</div>
							<div style="clear: both; font-size: 25px; margin: 245px 20px; text-align: center; border: 1px solid rgb(148, 202, 238);">
								최근접속일 2022-06-01
							</div>
						</div>
					</c:if>
					<c:if test="${LoginId == null }">
						<div id="unlog">
							로그인이 필요합니다.
						</div>
					</c:if>
				</div>
				<div id="alarm">
					<div id="precent">
						<div style="font-size: 25px; margin: 40px 20px 20px 20px; text-align: center; border: 1px solid rgb(238, 238, 238);">
							${currentTime } <b>${member.employee_name }</b> 님의 현황입니다.
						</div>
						<div style="font-size: 25px; margin: 10px auto; border: 1px solid rgb(238, 238, 238);">
							<div class="pre" style="margin-left: 120px;">
								<img src="<c:url value='/resources/img/새메신저.png'/>" style="width: 80px; height: 80px; border: 1px solid rgb(238, 238, 238); margin-left: 10px;">
								<button type="button" class="btn btn-outline-secondary position-relative" style="border: 1px solid rgb(238, 238, 238); font-weight: 700;" onclick="location.href='messenger/messengerList'">
									새 메시지
									<c:if test="${alarm.messenger == 1}">
										<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">new<span class="visually-hidden">unread messages</span></span>
									</c:if>
								</button>
							</div>
							<div class="pre" style="margin-left: 30px;">
								<img src="<c:url value='/resources/img/새일정.png'/>" style="width: 80px; height: 80px; border: 1px solid rgb(238, 238, 238); ">
								<button type="button" class="btn btn-outline-secondary position-relative" style="border: 1px solid rgb(238, 238, 238); font-weight: 700;" onclick="location.href='schedule/schedule'">
									새 일정
									<c:if test="${alarm.schedule == 1}">
										<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">new<span class="visually-hidden">unread messages</span></span>
									</c:if>
								</button>
							</div>
							<div class="pre">
								<img src="<c:url value='/resources/img/새결제.png'/>" style="width: 80px; height: 80px; border: 1px solid rgb(238, 238, 238); clear: both;">
								<button type="button" class="btn btn-outline-secondary position-relative" style="border: 1px solid rgb(238, 238, 238); font-weight: 700;" onclick="location.href='sign/sdelay'">
									새 결제
									<c:if test="${alarm.sign == 1}">
										<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">new<span class="visually-hidden">unread messages</span></span>
									</c:if>
								</button>
							</div>
							
						</div>
					</div>
				</div>
            </div>
            <div id="maincontent2">
				<div id="notice">
					<div id="list">
						<h2 style="margin: 25px 40px 10px 40px; color: rgb(100, 100, 100); font-weight: 700"><a href='<c:url value="/notice/noticeList"/>'>공지사항</a></h2>
						<c:forEach var="notice" items="${noticelist }">
							<div class="noti" style="font-size: 25px; margin:0px 80px 0px 40px; color: rgb(120, 120, 120); border-bottom: 1px solid rgb(100, 100, 100);">
								<a href='<c:url value="/notice/notice?num=${notice.notice_num }"/>'>・${notice.notice_title}</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="messenger">
					<div id="mess">
						<h2 style="margin: 25px 40px 10px 40px; color: rgb(100, 100, 100); font-weight: 700"><a href='<c:url value="/messenger/messengerList"/>'>메신저</a></h2>
						<c:forEach items="${messengerlist }" var="mess">
							<div class="talk" onclick="chatPopup('${mess.employee_num}')">
								<img src="<c:url value='/resources/img/프로필.png'/>" class="photo" style="width: 80px; height: 80px; clear: both; margin: 20px 15px 20px 40px; ">
								<div class="talk" style="font-size: 25px; border: 1px solid rgb(238, 238, 238); color: rgb(100, 100, 100);"><h2 style="color: rgb(100, 100, 100); font-weight: 700; margin-top: 15px;">${mess.messenger_writer_name }</h2>${mess.messenger_content }</div>
							</div>
						</c:forEach>
					</div>
				</div>
            </div>
        </div>
    </div>
</body>
</html>

