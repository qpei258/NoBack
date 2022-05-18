<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/default.css">
<title>전자 결제 내역리스트</title>
</head>
<body>
		<div id="left">
            <div id="logo">
                <a href=""><img src="resources/img/logo.png"></a>
            </div>
            <div id="sidebar">
                <ul style="list-style: none;">
                    <span style="line-height: 60px; font-size: 40px; font-weight: 700;">카테고리</span>
                    <li><a href="/">홈</a></li>
                    <li><a href="notice">공지사항</a></li>
                    <li><a href="schedule">사내일정</a></li>
                    <li><a href="sign">전자결재</a></li>
                    <li><a href="board">자유게시판</a></li>
                    <li><a href="messenger">메신저</a></li>
                    <li><a href="login">로그인</a></li>
                </ul>
            </div>
            <div id="schedule">
                <a href="schedule"><img src="resources/img/schedule.png"></a>
            </div>
        </div>
        
        <p><a href="sign/swrite">결제서류 작성</a></p>
        
        <div id="containerBox">

		<div style="border-top: 1px dashed #c9c9c9; margin-top: 50px;"></div>

		<div class="docListTitle">결제 내역 전체 서류</div>
		
			<c:if test="${signapprvoCount == 0}">
				<div id="waitingDoc">
					승인할 문서가 없습니다.
				</div>
			</c:if>
			
			<c:if test="${totalWaitingCount ne 0}">
				<div id="waitingDoc">
					승인할 문서가 <span style="font-weight: bold">${signapprvoCount}</span> 건 있습니다.
				</div>
				<table class="table table-hover tblElecAppr" style="font-size: 14px; text-align: center;">
				    <thead>
						<tr>
							<th>기안일</th>
							<th>제목</th>
							<th>기안자</th>
							<th>결제상태</th>
						</tr>
				    </thead>
				    <tbody>
				<c:forEach var="signapprvo" items="${signList}">
				<tr> 
					<td>${signapprvo.date}</td>
					<td>${signapprvo.writeday}</td>
					<td>${signapprvo.emp_name}</td>
					<td>
						<c:if test="">
							대기
						</c:if>
						<c:if test="">
							승인
						</c:if>
						<c:if test="">
							반려
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
			
		<div style="border-top: 1px dashed #c9c9c9; margin-top: 50px;"></div>
		</div>
</body>
</html>