<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/AdminUserInfo.css">
<style>
body {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>
<body>

	<div id="container">
		<div>
		<div id="cover">
			<div id="idSize"><strong>${dto.memberNickname}님의 정보 내역</strong></div>
			<br>
			
			<div class="divIn">
					<div id="backColor"></div>
					<table>
						<col width="624px">
						<col width="624px">
						<tr>
							<td class="div1" id="ans">ID</td>
							<td class="div2" id="res">${dto.memberId}</td>
						</tr>
						<tr>
							<td class="div1" id="ans">닉네임</td>
							<td class="div2" id="res">${dto.memberNickname}</td>
						</tr>
						<tr>
							<td class="div1" id="ans">이메일</td>
							<td class="div2" id="res">${dto.memberEmail}</td>
						</tr>
						<tr>
							<td class="div1" id="ans">제재여부</td>
							<td class="div2" id="res">${dto.memberProhibitChk}</td>
						</tr>
						<tr>
							<td class="div1" id="ans">제재횟수</td>
							<td class="div2" id="res">${dto.memberProhibitCount}</td>
						</tr>
						<tr>
							<td class="div1" id="ans">제재해제시간</td>
							<c:choose>
								<c:when test="${ empty dto.memberProhibitTime}">
									<td class="div2" id="res">정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td class="div2" id="res">${dto.memberProhibitTime}</td>
								</c:otherwise>
							</c:choose>

						</tr>
					</table>
				</div>
				
					<br/>
					
				<div class="divIn">
					<div id="backColor2"></div>
					<table>
						<col width="624px">
						<col width="624px">
						<tr onclick="javascript:opener.location.href='AdminSearchGG.do?memberNickName=${dto.memberNickname}&nowpage=1';self.close();" id="cursor">
							<td class="div3" id="ans">좋은글 게시판 작성글 갯수</td>
							<td class="div4" id="res">${ggCount}</td>
						</tr>
						<tr onclick="javascript:opener.location.href='AdminSearchFWLB.do?memberNickName=${dto.memberNickname}&nowpage=1';self.close();" id="cursor">
							<td class="div3" id="ans">위시리스트 게시판 작성글 갯수</td>
							<td class="div4" id="res">${fwlbCount}</td>
						</tr>
					</table>
				</div>
		</div>
		</div>
	</div>

</body>
</html>