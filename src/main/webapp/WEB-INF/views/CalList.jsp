<%@page import="com.lol.hgl.dao.CalDaoImple"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@page import="com.lol.hgl.dao.CalDao"%>
<%@page import="com.lol.hgl.dao.CalDaoImple"%>
<%@page import="com.lol.hgl.dto.calDto"%>
<%@page import="com.lol.hgl.dao.Util"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/CalList.css">
<style>
body {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$(".countView").hover(function(){
			var aCountView=$(this);
			var year=$(".y").text().trim();//년도
			var month=$(".m").text().trim();//월
			var cDate=aCountView.text().trim();//일
			var memberId = $("#memberId").val();

			var yyyyMMdd=year+isTwo(month)+isTwo(cDate);//8자리
			/* var memberId = $("login") */
			
			$.ajax({
				type:"post",
				url:"CalListCountAjax.do",
				data:"memberId="+memberId+"&yyyyMMdd="+yyyyMMdd,
				async:true,
				success:function(val){
					  var r = $.trim(val);
					aCountView.after("<div class='cPreview'>"+r+"개의 스케줄이 있습니다</div>");
				},
				error:function(){
					alert("countView hover ajax error");
				}
			});
		},function(){
			$(".cPreview").remove();
		});
	});
	
	function isTwo(n){
		return n.length<2?"0"+n:n;
	}
	
	function addSCH(num){
		var year2 = $("#year").val();
		var month2 = $("#month").val();
		var date2 = num;
		var lastDay2 = $("#lastDay").val();
		var memberId2 = $("#memberId").val();
		var memberNickname2 = $("#memberNickname").val();
		var popupX = (window.screen.width/2) - (530 / 2);
		var popupY= (window.screen.height/2)- (465/2);
		$.ajax({
				type:"post",
				url:"DayListCountAjax.do",
				data:"memberId="+memberId2+"&year="+year2+"&month="+month2+"&date="+num,
				success:function(val){
					var r = $.trim(val);	
					var count = parseInt(r);
					if(count>=3){
						alert("일정은 최대 3개까지 입력 가능합니다.");
					}else{
						window.name="Parent";
						window.open("CalInsertForm.do?year="+year2+"&month="+month2+"&date="+date2+"&lastDay="+lastDay2+"&memberId="+memberId2+"&memberNickname="+memberNickname2,"", 'status=no, width=530, height=465, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
					}
				},
				error:function(){
					alert("addSCH() Ajax error");
				}
			});

	}
	
	function DetSCH(num){
	 	var popupX = (window.screen.width/2) - (530 / 2);
		var popupY= (window.screen.height/2)- (465/2);
		window.name="Parent";
		window.open("calDetail.do?calNo="+num,"", 'status=no, width=530, height=465, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		}
	
	function addSCH2(){
		var year = $("#year").val();
		var month = $("#month").val();
		var date = $("#date").val();
		var lastDay = $("#lastDay").val();
		var memberId = $("#memberId").val();
		var memberNickname = $("#memberNickname").val();
		
		var popupX = (window.screen.width/2) - (515 / 2);
		var popupY= (window.screen.height/2)- (465/2);

		window.name="Parent";
		window.open("CalInsertForm.do?year="+year+"&month="+month+"&date="+date+"&lastDay="+lastDay+"&memberId="+memberId+"&memberNickname="+memberNickname,"", 'status=no, width=530, height=465, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		}
</script>
<%
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	System.out.println("CalList.jsp : " + paramYear);
	System.out.println("CalList.jsp : " + paramMonth);
	
	@SuppressWarnings("unchecked")
	List<calDto> cList = (List<calDto>)request.getAttribute("cList");
	
	Calendar cal =Calendar.getInstance();
	//현재 년도
	int year = cal.get(Calendar.YEAR);
	//현재 월 (0~11)
	int month = cal.get(Calendar.MONTH)+1;
	
	int date = cal.get(Calendar.DATE);
	
	//년도와 열 변경
	if(paramYear != null){
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth != null){
		month = Integer.parseInt(paramMonth);
	}
	
	//12월에서 다음 달로 넘어가면
	if(month > 12){
		month = 1;
		year++;
	}
	//1월에서 이전 달로 넘어가면
	if(month < 1){
		month = 12;
		year--;
	}
	
	//현재 월의 1일이 어떤 요일인지 구하기
	//1.현재 년도,현재 월에 대한 1일을 셋팅
	cal.set(year,month-1,1);
	//2.1일의 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	//마지막날 구하기
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	//달력에 일정을 표현하기
	CalDao dao = new CalDaoImple();
	calDto dto = new calDto();
	String yyyyMM = year + Util.isTwo(String.valueOf(month));
	//List<calDto> cList= dao.selectAll(paramMemberId, yyyyMM);
%>
<body>

	<input type="hidden" value="<%=year %>" id="year"/>
	<input type="hidden" value="<%=month %>" id="month"/>
	<input type="hidden" value="<%=date %>" id="date"/>
	<input type="hidden" value="<%=lastDay %>" id="lastDay"/>
	<input type="hidden" value="${login.memberNickname }" id="memberNickname"/>
	

	<div id="container">
	<div id="a"><%@ include file="/WEB-INF/views/Header.jsp"%></div>
	<br/>
	<div id="b">
	<input type="hidden" id="memberId" value="${login.memberId}"/>
	<table id="calendar">
		<tr id="topBar">
			<th colspan="7" class="th7">
			<div id="divIn">
				<div id="div1">
					<a href="CalListForm.do?year=<%=year-1%>&month=<%=month%>&memberId=${login.memberId}">◁</a>
					<a href="CalListForm.do?year=<%=year%>&month=<%=month-1%>&memberId=${login.memberId}">◀</a>
					
					<span class="y"><%=year %></span>년
					<span class="m"><%=month %></span>월
					
					<a href="CalListForm.do?year=<%=year%>&month=<%=month+1%>&memberId=${login.memberId}">▶</a>
					<a href="CalListForm.do?year=<%=year+1%>&month=<%=month%>&memberId=${login.memberId}">▷</a>
				</div>
				<div id="div2">
					<div>
						<input class="btn-3" type="button" value="일정추가" onclick="addSCH2();" />
					</div>
				</div>
			</div>
			</th>
		</tr>
		
		<tr id="calTr">
			<th class="th7">일</th><th class="th7">월</th><th class="th7">화</th><th class="th7">수</th><th class="th7">목</th><th class="th7">금</th><th class="th7">토</th>
		</tr>
		<tr>
<%
			//현재 월의 시작일 전까지 빈칸
			for(int i=0 ; i < dayOfWeek-1 ; i++){
				out.print("<td>&nbsp;</td>");
			}
			
			//현재 월의 1일부터 마지막 일 까지
			for(int i = 1; i <= lastDay; i++){
%>
			<td>
				<input type="hidden" value="<%=i%>" id="i"/>
				<a class="countView" style="color:<%=Util.fontColor(i,dayOfWeek)%>">
					<%=i %>
				</a>
				<a id="penIcon" href="#" onclick="addSCH(<%=i%>);">
					<!-- <img alt="일정추가" src="image/pen.png" style="with:15px;height:15px;"> -->
					<span class="glyphicon glyphicon-pencil" style="color:black;with:15px;height:15px;text-shadow: 1px 1px 0px gray;"></span>
				</a>
				<div class="cList">
					<%=Util.getCalView(i, cList) %>
				</div>
			</td>
<%
				//(dayOfWeek-1 : 공백 수 + i) : 현재 날짜
				if((dayOfWeek-1+i)%7 == 0){
					//줄바꿈 처리
					out.print("</tr><tr>");
				}
			}
			for(int i = 0 ; i < (7-(dayOfWeek - 1 + lastDay)%7)%7;i++){
				out.print("<td>&nbsp;</td>");
			}
%>
		</tr>
	</table>
	
	</div>
	<br/>
	
	<div id="c"><%@ include file="/WEB-INF/views/Footer.jsp"%></div>
	</div>

</body>
</html>