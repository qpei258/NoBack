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
                	<div class="topmenu" ><a href='<c:url value="/mypage/mypage"/>' style="color: rgb(80, 80, 80);">마이페이지</a></div>
                </c:if>
                <c:if test="${LoginId != null && LoginLevel >= 3}">
                	<div class="topmenu"><a href='<c:url value="/manager/memberlist"/>' style="color: rgb(80, 80, 80);">관리자페이지</a></div>
                </c:if>
            </div>
            <div id="maincontent1">
				<div id="my">
					<c:if test="${LoginId != null }">
						<div id="profile">
							<div id="photo">
								<img src="<c:url value='/resources/img/프로필.png'/>">
							</div>
							<div id="info">
								<span style="font-weight: 700; font-size: 35px;">정대균</span><br>
								<span style="font-size: 25px;">프로젝트 리더</span>
							</div>
							<div style="clear: both; font-size: 25px; margin: 245px 20px; text-align: center; border: 1px solid rgb(148, 202, 238);;">
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
					
					</div>
				</div>
            </div>
        </div>
    </div>
</body>
</html>
