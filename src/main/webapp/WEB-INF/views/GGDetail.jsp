<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%   request.setCharacterEncoding("UTF-8");%>
<%  response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/GGDetail.css">
<style>
body {
 background: url('image/back.png') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 }
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
   $("#cmtForm").submit(function(){
      if($("textarea[name=ggcmCont]").val()==null || $("textarea[name=ggcmCont]").val()==""){
         swal("댓글을 작성해주세요");
         return false;
      }
   });
});
</script>

<body>

   <div id="container">
      <div id="a"><%@ include file="/WEB-INF/views/Header.jsp"%></div>
		<div id="b">
			<div id="bodyMain">
					<br/>
					<table border="1" bordercolor="white">
						<col width="100">
						<tr>
							<td colspan="2" class="th">
								<div id="ggTitle">좋은글 게시판 상세보기</div>
							</td>
						</tr>
						<tr>
							<td class="th">조회수</td>
							<td><input type="text" value="${dto.ggReadcnt }" readonly="readonly" class="Mtd"></td>
						</tr>
						<tr>
							<td class="th">작성일</td>
							<td><input type="text" value="<fmt:formatDate value="${dto.ggDate}" pattern="yyyy-MM-dd HH:mm"/>" readonly="readonly" class="Mtd"></td>
						</tr>
						<tr>
							<td class="th">제　목</td>
							<td><input type="text" value="${dto.ggTitle }" readonly="readonly" class="Mtd"></td>
						</tr>
						<tr>
							<td class="th">작성자</td>
							<td><input type="text" value="${dto.ggWriter }" readonly="readonly" class="Mtd"></td>
						</tr>
						<tr>
							<td class="th">내　용</td>
							<td>
								<textarea rows="20" cols="50" readonly="readonly" class="Mtd" style="resize: none;">${dto.ggCont}</textarea>
								<c:if test="${!empty imgList}">
									<div>
										<c:forEach items="${imgList}" var="ggImgDto">
											<img src="GGimg/${ggImgDto.ggImgStoreName}" style="width:100%; max-height: 30%;">
										</c:forEach>
									</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
									<input type="button" value="글목록" onclick="location.href='GGListForm.do?nowpage=1'" id="btn001" class="btn-3">
								<c:if test="${login.memberNickname eq dto.ggWriter}">
									<input type="button" value="글수정" onclick="location.href='GGUpdateForm.do?ggNo=${dto.ggNo}'" id="btn002" class="btn-3">
								</c:if>
								<c:choose>
									<c:when test="${login.memberNickname eq dto.ggWriter}">
										<input type="button" value="글삭제" onclick="location.href='GGDelete.do?ggNo=${dto.ggNo}'" id="btn003" class="btn-3">
									</c:when>
									<c:when test="${login.memberRole eq 'ADMIN'}">
										<input type="button" value="글삭제" onclick="location.href='GGDelete.do?ggNo=${dto.ggNo}'" id="btn003" class="btn-3">
									</c:when>
								</c:choose>
							</td>
						</tr>
				
					</table>
					<br>
					<c:if test="${!empty dto2}">
						<div id="cml">댓글 목록</div>
							<c:forEach items="${dto2 }" var="ggcmDto">
							<div class="dv0">
								<div class="mdv1">
									<div>
									<div class="th2">작성자</div>
									<div class="td">${ggcmDto.ggcmWriter }</div>
									<div class="th2">작성일</div>
									<div class="td"><fmt:formatDate value="${ggcmDto.ggcmDate}" pattern="yyyy-MM-dd" /></div>
								<div class="mdv2">
									<c:if test="${login.memberNickname eq ggcmDto.ggcmWriter}">
										<input type="button" onclick="location.href='GGRepleyDelete.do?ggcmNo='+${ggcmDto.ggcmNo}+'&ggNo='+${ggcmDto.ggNo}" value="삭제" class="btn-3">
									</c:if>
								</div>
									<div class="cont"><textarea rows="3" cols="" style="resize: none; overflow: hidden;" readonly="readonly">${ggcmDto.ggcmCont }</textarea></div>
									</div>
								</div>
								<!-- <div class="dv1">
								</div> -->
							</div>
							<br/>								

							</c:forEach>
					</c:if>
                  <c:choose>
                     <c:when test="${login != null}">
                           <form action="GGRepleyInsert.do" id="cmtForm" method="post">
                              <input type="hidden" name="ggNo" value="${dto.ggNo}">
                              <br />
                              <table id="cmtDiv" border="1" bordercolor="white">
                                 <col width="125" class="ab">
                                 <col width="800">
                                 <col width="150">
                                 <tr>
                                    <td colspan="3" class="th"><div>댓글 작성</div></td>
                                 </tr>
                                 <tr>
                                    <td><input type="text" name="ggcmWriter" value="${login.memberNickname}" id="cmtd"></td>
                                    <td><textarea id="txtArea" rows="3" cols="" name="ggcmCont" style="resize: none; overflow: hidden;" placeholder="댓글 내용을 입력해주세요~" ></textarea></td>
                                    <td><input type="submit" value="댓글달기" id="Cbtn1" class="btn-3"></td>
                                 </tr>
                              </table>
                           </form>
                     </c:when>
                  </c:choose>
            <br>
         </div>
      </div>

      <div id="c"><%@ include file="/WEB-INF/views/Footer.jsp"%></div>
   </div>

</body>
</html>