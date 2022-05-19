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
                <a href="/blog"><img src="/blog/resources/img/logo.png"></a>
            </div>
            <div id="sidebar">
                <ul style="list-style: none;">
                    <span style="line-height: 60px; font-size: 40px; font-weight: 700;">카테고리</span>
                    <li><a href="/blog">홈</a></li>
                    <li><a href="notice">공지사항</a></li>
                    <li><a href="schedule">사내일정</a></li>
                    <li><a href="sign/smain">전자결재</a></li>
                    <li><a href="/blog/board/boardList">자유게시판</a></li>
                    <li><a href="messenger">메신저</a></li>
                    <li><a href="login">로그인</a></li>
                </ul>
            </div>
            <div id="schedule">
                <a href="schedule"><img src="/blog/resources/img/schedule.png"></a>
            </div>
        </div>
</body>
</html>