<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/blog/resources/css/default.css" />
<title>Insert title here</title>
</head>
<body>
		<div id="left">
            <div id="logo">
                <a href='<c:url value="/"/>'><img src='<c:url value="/resources/img/logo.png"/>'></a>
            </div>
            <div id="sidebar">
                <ul style="list-style: none;">
                    <span style="line-height: 60px; font-size: 40px; font-weight: 700;">카테고리</span>
                    <li><a href='<c:url value="/"/>'>홈</a></li>
                    <li><a href='<c:url value="/notice/noticeList"/>'>공지사항</a></li>
                    <li><a href='<c:url value="/schedule/schedule"/>'>사내일정</a></li>
                    <li><a href='<c:url value="/sign/smain"/>'>전자결재</a></li>
                    <li><a href='<c:url value="/board/boardList"/>'>자유게시판</a></li>
                    <li><a href='<c:url value="/messenger/messenger"/>'>메신저</a></li>
                    <li><a href='<c:url value="/manager/login"/>'>로그인</a></li>
                </ul>
            </div>
            <div id="schedule">
                <a href="schedule"><img src='<c:url value="/resources/img/schedule.png"/>'></a>
            </div>
        </div>
</body>
</html>