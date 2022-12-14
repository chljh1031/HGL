<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/FamDetail.css">
<style>
body {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="js/FChart.js"></script>
<script type="text/javascript">
function goDiseaseUpdate(){
 	var popupX = (window.screen.width/2)-(250 /2);
	var popupY= (window.screen.height/2)-(50 /2);

	window.name="Parent";
	window.open("FamDiseaseUpdateForm.do?famNo="+${famDto.famNo},"", 'status=no, width=450, height=200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}

function goHealthInfoAdd(){
 	var popupX = (window.screen.width/2)-(410/2);
	var popupY= (window.screen.height/2)-(240/2); 
	window.name="Parent";
	window.open("FamHealthInsertForm.do?famNo="+${famDto.famNo},"", 'status=no, width=410, height=240, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}

function showMenu(disea){
	var popupX = (window.screen.width/2)-(850/2);
	var popupY= (window.screen.height/2)-(250); 
	window.name="Parent";
	window.open("FamDiseaseMenu.do?disease="+disea,"", 'status=no, width=850, height=500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}


google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);
</script>
</head>
<body>
<div id="container">
	<div id="a"><%@ include file="/WEB-INF/views/Header.jsp"%></div>
		<div id="detail">
				<h2>${famDto.famName} ?????? ??????</h2>
			<div id="famDetail" style="display: flex;">
				<div id="famInfoFom">
					<input type="hidden" id="famNo" value="${famDto.famNo}">
					<div style="width:250px; height: 35px;"><img src="icon/Famuser.png">
						<input class="famInfo" type="text" value="${famDto.famName}" readonly="readonly">
					</div>
					<div style="width:250px; height: 35px;"><img src="icon/birthday.png">
						<input class="famInfo" type="text" value="${year}??? ${month}??? ${day}???" readonly="readonly">
					</div>
					<div style="width:250px; height: 35px;"><img src="icon/health.png">
						<input class="famInfo" type="text" value="${famDto.famHeight}cm" readonly="readonly">
					</div>
					<div style="width:250px; height: 35px;"><img src="icon/weight.png">
					<c:choose>
						<c:when test="${empty healthDto.healthWeight}">
							<input class="famInfo" type="text" value="????????? ????????? ????????????." readonly="readonly">
						</c:when>
						<c:otherwise>
							<input class="famInfo" type="text" value="${healthDto.healthWeight}kg" readonly="readonly">
						</c:otherwise>
					</c:choose>
					</div>
					<div style="width:250px; height: 70px;"><img src="icon/health.png">
						<c:choose>
							<c:when test="${empty healthDto.healthShrbp}">
								<input class="famInfo" type="text" value="????????? ????????? ????????????" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input class="famInfo" type="text" value="${healthDto.healthShrbp}mg" readonly="readonly">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty healthDto.healthRelbp}">
								<input class="famInfo" type="text" value="????????? ????????? ????????????" readonly="readonly" style="float:right">
							</c:when>
							<c:otherwise>
								<input class="famInfo" type="text" value="${healthDto.healthRelbp}mg" readonly="readonly">
							</c:otherwise>
						</c:choose>	
					</div>
					
					<div id="infoInsert">
						<button type="button" onclick="goHealthInfoAdd();">+????????????</button>
					</div>	
					
					<div style="margin-top: 35px">
					<table class="diseaseTable">
						<col width="65px">
						<col width="100px">
						<col width="75px">
						<tr>
							<th colspan="3" style="text-align: center;">?????? ?????? (?????? 3???)</th>
						<tr>
						<tr>
							<td>?????? :</td>
							<c:choose>
								<c:when test="${famDto.famDisease1 eq '????????????'}">
									<td>????????????</td>
								</c:when>
								<c:otherwise>
									<td>${famDto.famDisease1}</td>
									<td><button type="button" onclick="showMenu('${famDto.famDisease1}');">????????????</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>?????? :</td>
							<c:choose>
								<c:when test="${famDto.famDisease2 eq '????????????'}">
									<td>????????????</td>
								</c:when>
								<c:otherwise>
									<td>${famDto.famDisease2}</td>
									<td><button type="button" onclick="showMenu('${famDto.famDisease2}');">????????????</button></td>
								</c:otherwise>
							</c:choose>
						</tr>	
						<tr>
							<td>?????? :</td>
							<c:choose>
								<c:when test="${famDto.famDisease3 eq '????????????'}">
									<td>????????????</td>
								</c:when>
								<c:otherwise>
									<td>${famDto.famDisease3}</td>
									<td><button type="button" onclick="showMenu('${famDto.famDisease3}');">????????????</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td colspan="3"><button type="button" onclick="goDiseaseUpdate()" style="background: transparent;">????????????</button></td>
						</tr>	
					</table>
					
					<%-- <c:choose>
						<c:when test="${famDto.famDisease1 eq '????????????'}">
						</c:when>
						<c:otherwise>
						<div style="margin-left: 20px;">
						??????1 <span> ${famDto.famDisease1}</span>
						<button type="button" onclick="showMenu('${famDto.famDisease1}');">????????????</button>
						</div>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${famDto.famDisease2 eq '????????????'}">
						</c:when>
						<c:otherwise>
						<div style="margin-left: 20px;">
						??????2 <span> ${famDto.famDisease2}</span>
						<button type="button" onclick="showMenu('${famDto.famDisease2}');">????????????</button>
						</div>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${famDto.famDisease3 eq '????????????'}">
						</c:when>
						<c:otherwise>
						<div style="margin-left: 20px;">??????3
						<span> ${famDto.famDisease3}</span>
						<button type="button" onclick="showMenu('${famDto.famDisease3}');">????????????</button>
						</div>
						</c:otherwise>
					</c:choose> --%>
					</div>
				</div>	
					<div id="flaxGraph">
						<div id="graph"></div>
					</div>
			</div>
			<div id="famList">
				<button type="button" onclick="location.href='MemberInfoForm.do?memberNo='+${famDto.memberNo}">??????</button>
			</div>
		</div>
			<c:forEach items="${list}" var="healthDto" varStatus="status">
				<input type="hidden" name="health" id="dto${status.index}ShrBP" value="${healthDto.healthShrbp}" />
				<input type="hidden" name="health" id="dto${status.index}RelBP" value="${healthDto.healthRelbp}" />
				<input type="hidden" name="health" id="dto${status.index}Weigth" value="${healthDto.healthWeight}" />
			</c:forEach>
	<div id="c"><%@ include file="/WEB-INF/views/Footer.jsp"%></div>
</div>
	
</body>
</html>