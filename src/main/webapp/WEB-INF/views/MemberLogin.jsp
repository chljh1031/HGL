<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<%
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login.jsp</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetswal/dist/sweetswal.min.js"></script>
<script type="text/javascript">

window.onload = function() {
	if("${msg1}" != null && "${msg1}".length > 0){
		swal("${msg1}");
	}else if("${msg2}" != null && "${msg2}".length > 0){
		swal({
		title:"회원기능 정지중입니다.",
		text:"${msg2}",
		icon:"warning",
		});
	}	
};

history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	history.go(1);
};

function MemberSearch(){
 	var popupX = (window.screen.width/2) - (500 / 2);
	var popupY= (window.screen.height/2)- (240/2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.name="Parent";
	window.open("MemberSearchForm.do","", 'status=no, width=500, height=240, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	
$(function(){
$("#myform").submit(function(){
    if($("input[name=memberId]").val()=="" || $("input[name=memberId]").val()== null){
    	swal("아이디를 입력해주세요");
		return false;
    }else if($("input[name=memberPw]").val()=="" || $("input[name=memberId]").val()== null){
    	swal("비밀번호를 입력해주세요");
    	 return false;
    }
	});
	
});
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="css/MemberLogin.css">

<style>
#cd-main-content {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
 
 #main-nav {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>

</head>

<body>

  <body>
	<main id="cd-main-content">
		<section id="cd-intro">
			<h1><b>행</b>복한 <b>가</b>족의 미<b>래</b></h1>
	
			<header class="cd-header">
				<a class="cd-menu-trigger" href="#main-nav">로그인<span></span></a>
			</header>
			<div class="cd-blurred-bg"></div>
		</section> <!-- cd-intro -->
	</main>
	
	<div class="cd-shadow-layer"></div>
	
	<nav id="main-nav">
		<ul id="loginUl" style="width: 500px;">
			<div class="liSize" style="height: 50px; width: 300px;"><h1><b>행</b>복한 <b>가</b>족의 미<b>래</b></h1></div>
			<li id="loginMain" style="height: 200px; margin-top: 50px;">
					<form action="MemberLogin.do" id="myform">
						<div id="loginImg">
							<div class="loginPadding">
								<span class="spanIdPw">ㅇ USERNAME　　　　　　　　　</span>
							</div>
							<div class="loginPadding">
								<input type="text" name="memberId" value="" placeholder=" 아이디를 입력해주세요.">
							</div>
							<div class="loginPadding">
								<span class="spanIdPw">ㅇ PASSWORD　　　　　　　　　</span>
							</div>
							<div class="loginPadding">
								<input type="password" name="memberPw" value="" placeholder=" 비밀번호를 입력해주세요.">
							</div>
							<div class="loginBtnPd">
								<input class="btn btn-3" id="loginBtn1" type="submit" value="Login">
							    <input class="btn btn-3" id="loginBtn1" type="button" value="SignUp" onclick="location.href='MemberSignUpForm.do'">
				                <input class="btn btn-3" id="loginBtn2" type="button" value="Forgot ID & PW" onclick="MemberSearch()">
							</div>
						<div id="loginImg2"></div>
						</div>
					</form>
			</li>
		</ul>
		<a href="#0" class="cd-close-menu">Close<span></span></a>
	</nav>
  </body>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="js/index.js"></script>




</body>

</html>