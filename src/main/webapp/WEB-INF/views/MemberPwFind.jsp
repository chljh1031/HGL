<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
$("input[name=memberPw").on("change",function() {
    var pwVal = $("input[name=memberPw]").val();
    if(pwVal==null || pwVal==""){
         $("input[name=memberPw]").attr('title','n');
    }else{
    $.ajax({
       type:"post",
       url : "pwChk.do",
       data:"pw="+pwVal,
       success : function(res) {
          var r = $.trim(res);
          if (r == "t") {  
             $("#pwValidity").val("o");
             $("input[name=memberPw]").attr('title','Y');
          }else{
        	  $("#pwValidity").val("x");
              $("input[name=memberPw]").attr('title','N');
          }
       }
    });
    }
 })
 
  $("input[name=memberPwChk]").on("keyup", function() {
	  var pw = $("input[name=memberPw]").val();
	  var pwChk = $("input[name=memberPwChk]").val();
	 
	if(pw == pwChk) {
		$("#pwSame").val("o");
		$("input[name=memberPwChk]").attr("title","Y");
	}else{
		$("#pwSame").val("x");
		$("input[name=memberPwChk]").attr("title","N");
	}
});
 

  $("#regist").submit(function(){
	if($("input[name=memberPw]").attr("title")=="N"){
		swal("비밀번호 형식을 확인해주세요.")
		return false;
	}else if($("input[name=memberPwChk]").attr("title")=="N"){
		swal("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
		return false;
	}
	window.opener.name = "Parent"; // 부모창의 이름 설정
    document.myForm.target = "Parent"; // 타켓을 부모창으로 설정
    self.close();
 })
})

/*
function goSubmit(){
	window.opener.name = "Parent"; // 부모창의 이름 설정
    document.myForm.target = "Parent"; // 타켓을 부모창으로 설정
    self.close();
}*/
</script>
</head>
<link rel="stylesheet" type="text/css" href="css/MemberPwFind.css">
<body>

	<div id="container">
		<div>
		<div id="cover">
			<form action="pwChange.do" name="myForm" method="post" id="regist">
				<input type="hidden" name="memberEmail" value="${email}">
				<input type="hidden" name="memberId" value="${id}">
				<div><div><b>비밀번호 변경</b></div></div><br/>
				<div id="div0">
					<div class="div1"><input type="text" class="input" readonly="readonly" value="비밀번호 입력" ></div>
					<div class="div2"><input type="password" class="input" placeholder="비밀번호를 입력해주세요." name="memberPw" title="N"></div>
					<div class="div3"><input type="text" class="input" placeholder="O or X" readonly="readonly" id="pwValidity" ></div>
				</div>
				<div id="div0">
					<div class="div1"><input type="text" class="input" readonly="readonly" value="비밀번호 재입력" ></div>
					<div class="div2"><input type="password" class="input" placeholder="비밀번호를 재입력해주세요." name="memberPwChk" title="N"></div>
					<div class="div3"><input type="text" class="input" placeholder="T or F" readonly="readonly" id="pwSame"></div>
				</div>
				<br/>
				<div id="div0">
					<div class="div4"><input type="submit" class="btn" value="비밀번호 변경완료"></div>
					<!--  <div class="div4"><input type="submit" class="btn" value="비밀번호 변경완료" onclick="goSubmit();"></div>-->
				</div>
			</form>
		</div>
		</div>
	</div>

</body>
</html>