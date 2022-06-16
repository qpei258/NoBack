<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="left">
            <div id="logo">
                <a href='<c:url value="/"/>'><img src='<c:url value="/resources/img/logo.png"/>'></a>
            </div>
            <div id="sidebar">
                <ul style="list-style: none; padding-left:25px;">
                    <span style="line-height: 60px; font-size: 40px; font-weight: 700;">カテゴリー</span>
                    <li><a href='<c:url value="/"/>'>ホーム</a></li>
                    <li><a href='<c:url value="/notice/noticeList"/>'>公知事項</a></li>
                    <li><a href='<c:url value="/schedule/schedule"/>'>社内日程</a></li>
                    <li><a href='<c:url value="/sign/sdelay"/>'>電子決裁</a></li>
                    <li><a href='<c:url value="/board/boardList"/>'>自由掲示板</a></li>
                    <li><a href='<c:url value="/messenger/messengerList"/>'>メッセンジャー</a></li>
                    <c:if test="${LoginId == null }">
                    	<li><a href='<c:url value="/manager/login"/>'>ログイン</a></li>
                    </c:if>
                    <c:if test="${LoginId != null }">
                    	<li><a href='<c:url value="/manager/logout"/>'>ログアウト</a></li>
                    </c:if>
                </ul>
            </div>
            <div id="schedule">
                <a href='<c:url value="/schedule/schedule"/>'><img src='<c:url value="/resources/img/schedule.png"/>'></a>
            </div>
        </div>
</body>
</html>