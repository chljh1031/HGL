<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@page import="com.lol.hgl.dao.Util"%>
<%@page import="com.lol.hgl.dto.calDto"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 body {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>
<%
	calDto dto=(calDto)request.getAttribute("dto");

	Util util=new Util();
	util.setToDates(dto.getCalSch());
	
	Calendar cal =Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	int Uyear=Integer.parseInt(dto.getCalSch().substring(0, 4));
	int Umonth=Integer.parseInt(dto.getCalSch().substring(4, 6));
	int Udate=Integer.parseInt(dto.getCalSch().substring(6, 8));
	int Uhour=Integer.parseInt(dto.getCalSch().substring(8, 10));
	int Umin=Integer.parseInt(dto.getCalSch().substring(10));
	
%>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function Up(){
	$("#Up").show();
	$("#Dt").hide();
}

function setInterval2(){
	$("#Up").hide();
	$("#Dt").show();
}

function back(){
	var memberNickname = $("input[name=memberNickname]").val();
	var memberId = $("#memberId").val();
	var year =  $("select[name=year]").val();
	var month =  $("select[name=month]").val();
	window.opener.top.location.href="CalListForm.do?memberNickname="+memberNickname+"&memberId="+memberId+"&year="+year+"&month="+month;
	window.close()
}

function del(){
	var calNo = $("#calNo").val();
	var memberId = $("#memberId").val();
	var year =  $("select[name=year]").val();
	var month =  $("select[name=month]").val();
	var memberNickname = $("input[name=memberNickname]").val();
	window.opener.top.location.href="CalDelete.do?calNo="+calNo+"&memberId="+memberId+"&year="+year+"&month="+month+"&memberNickname="+memberNickname;
	window.close()
}

$(function(){
	$("#updateForm").submit(function(){
		var year = $("select[name=year]").val();
		var month= $("select[name=month]").val();
		var date = $("select[name=date]").val();
		var memberId = $("input[name=memberId]").val();
		var returnVar = true;
		var calSch = $("#calSch").val().substring(0,8);
		var updateSch = year;
		if(parseInt(month)<10){
			updateSch = updateSch +"0"+month;
		}else{
			updateSch = updateSch+month;
		}
		
		if(parseInt(date)<10){
			updateSch = updateSch+"0"+date;
		}else{
			updateSch = updateSch+date;
		}

		if($("#calTitle").val()==null || $("#calTitle").val()==""){
			alert("????????? ??????????????????");
			return false;
		}else if(!(calSch===updateSch)){
			$.ajax({
				type:"post", //????????????
				url:"DayListCountAjax.do", //??????url
				data:"memberId="+memberId+"&year="+year+"&month="+month+"&date="+date,
				async : false,
				success:function(val){
					var r = $.trim(val);	
					var count = parseInt(r);
					if(count>=3){
						alert("?????? ????????? ????????? ??? ????????????. ?????? ?????? ??????????????????.");
						returnVar = false;
					}
				}
		
			});
			
			if (!returnVar) { //false??? ????????? true??? ?????? if?????? ????????? > return false??? 
				return false;
			}
		
			
		
		}

});

});
</script>
<link rel="stylesheet" type="text/css" href="css/CalDetail.css">
</head>	
<body>

	
<div id="Dt">
<h1>?????? ????????????</h1>
<div id="CalForm0">
	<div id="backColor"></div>
	<table id="table">
			<col width="100">
			<col width="400">
			<tr>
				<th class="thPadding">?????????</th>
				<td><input id="inputSize" class="txtWidth" type="text" name="memberNickname" value="<%=dto.getMemberNickname()%>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th class="thPadding">?????????</th>
				<td><input id="inputSize" class="txtWidth" type="text" name="calTitle" value="<%=util.getToDates()%>" readonly="readonly"/></td>
			</tr>
			<tr>
				<th class="thPadding">?????????</th>
				<td><input id="inputSize" class="txtWidth" type="text" name="calTitle" value="<%=dto.getCalTitle()%>" readonly="readonly"/></td>
			</tr>
			<tr>
				<th class="thPadding">?????????</th>
				<td style="padding-left: 3.4px;"><textarea rows="10" cols="53" readonly="readonly" style=" resize: none;"><%=dto.getCalMemo()%></textarea> </td>
			</tr>
			<tr>
				<th class="thPadding2">????????????</th>
				<td>
					<div id="radioIn">
					<input id="inputSize2" type="text" value="???????????? : <%=dto.getCalSMS() %>" readonly="readonly">
					</div>
				
					<div>
						<input class="btn-3" type="button" value="??????" onclick="Up();"/>
						<input class="btn-3" type="button" value="??????" onclick="del();"/>
						<input class="btn-3" type="button" value="????????????" onclick="back();"/>
					</div>
				</td>
			</tr>
				
		</table>
</div>
</div>


<div id="Up">
<h1>?????? ????????????</h1>
<div id="CalForm0">
	<div id="backColor"></div>
	<form action="CalUpdate.do" method="post" id="updateForm">
		<input type="hidden" id="calNo" name="calNo" value="<%=dto.getCalNo()%>"/>
		<input type="hidden" id="memberId" name="memberId" value="<%=dto.getMemberId()%>"/>
		<input type="hidden" id="calSch" value="${dto.calSch}"/>
		<table id="table" id="table">
			<col width="100">
			<col width="400">
			<tr>
				<th class="thPadding3">?????????</th>
				<td><input style="padding-left: 2px;" id="inputSize" class="txtWidth" type="text" name="memberNickname" value="<%=dto.getMemberNickname()%>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th class="thPadding3" id="thPadding">?????????</th>
				<td style="padding-left: 3.4px;">
					<select name="year">
						<%
							for(int i=year-5; i<year+5;i++){
							%>
							<option value="<%=i%>" <%=Uyear==i?"selected":""%>><%=i%></option>
							<%
							}
						%>
					</select>???
					<select name="month">
						<%
							for(int i=1;i<13;i++){
								%>
								<option value="<%=i%>" <%=Umonth==i?"selected":""%>><%=i%></option>
								<%
							}
						%>
					</select>???
					<select name="date" id="date">
						<%
							for(int i=1;i<=31;i++){
								%>
								<option value="<%=i%>" <%=Udate==i?"selected":""%>><%=i%></option>
								<%
							}
						%>
					</select>???
					<select name="hour" id="hour">
						<%
							for(int i=0;i<24;i++){
								%>
								<option value="<%=i%>" <%=Uhour==i?"selected":""%>><%=i%></option>
								<%
							}
						%>
					</select>???
					<select name="min" id="min">
						<%
							for(int i=0;i<60;i++){
								%>
								<option value="<%=i%>" <%=Umin==i?"selected":""%>><%=i%></option>
								<%
							}
						%>
					</select>???
				</td>
			</tr>
			<tr>
				<th class="thPadding3">?????????</th>
				<td><input class="txtWidth" type="text" id="calTitle" name="calTitle" value="<%=dto.getCalTitle()%>"/></td>
			</tr>
			<tr>
				<th class="thPadding3">?????????</th>
				<td><textarea rows="10" cols="53" id="calMemo" class="txtWidth" name="calMemo"><%=dto.getCalMemo()%></textarea> </td>
			</tr>
			<tr>
				<th class="thPadding2">????????????</th>
				<td style="padding-left: 1.5px;">
				<%if(dto.getCalSMS().equals("Y")){
					%>
					<div id="radioIn"><input id="inputSize3" type="text" value="??????????????? ????????????" readonly="readonly"><input id="radio1" class="radioVal" type="radio" value="Y" name="calSMS" checked="checked"/><input id="radio2" class="radioVal" type="radio" value="N" name="calSMS"/></div>
					<%
				} else {
					%>
					<div id="radioIn"><input id="inputSize3" type="text" value="??????????????? ????????????" readonly="readonly"><input id="radio1" class="radioVal" type="radio" value="Y" name="calSMS"/><input id="radio2" class="radioVal" type="radio" value="N" name="calSMS" checked="checked"/></div>
					<%
				}
					%>
					<div>
						<button class="btn-3">????????????</button>
						<input class="btn-3" type="button" value="????????????" 
						onclick="location.href='calDetail.do?calNo=<%=dto.getCalNo()%>'"/>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>