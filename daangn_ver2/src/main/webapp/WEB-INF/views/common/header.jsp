<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <title>Document</title>

	<!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
	<!-- 다음 주소 검색 API 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- css참조 -->
	<link rel="stylesheet" href="resources/css/common.css">
	
	<!-- 모달을 사용하기 위한 부트스트랩CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<!-- alertify를 사용하기 위한 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.0/css/alertify.css"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.0/alertify.js"></script>    
<body>

	<!-- 알림창 -->
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.success('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

    <div class="menubar_wrap">
        <div class="menubar_el1" id="banner">
            <div id="banner_img"><a href="index.jsp"><img src="resources/css_img/logo.png"></a></div>
        </div>
        <div class="menubar_el1" id="menu">
            <div id="flea"><a href="listForm.bo?category=1&currentPage=1&subCategory=0" id="flea">중고거래</a></div>
            <div id="market"><a href="listForm.bo?category=2&currentPage=1&subCategory=0" id="store">동네가게</a></div>
            <div id="job"><a href="listForm.bo?category=3&currentPage=1&subCategory=0" id="job">알바</a></div>
        </div>
        <div class="menubar_el1" id="search">
            	<div id="search_text"><input type="text" id="text_area" placeholder="&nbsp;물품이나 동네를 검색해보세요!"></div>
            	<div id="search_img"><button type="submit"><img src="resources/css_img/search_img.png"></button></div>
        </div>
        <div class="menubar_el1" id="loginbar">
        	<c:choose>
        		<c:when test="${empty loginMember }">
        			<!-- 로그인 전 -->
	        	    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button>
    	        	<button type="button" id="jointext" onclick="location.href='enrollForm.me'">회원가입</button>
        		</c:when>
        		<c:when test="${not empty loginMember }">
		            <div onclick="location.href='mypage.me'"><img id="profile_img"></div>
		            <a href="mypage.me">마이페이지</a>
		            <a href="logout.me" id="logout">로그아웃</a>
        		</c:when>
        	</c:choose>
        </div>
    </div>
    
  	<!-- 로그인 모달 -->
  	<form action="login.me">
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<img src="resources/css_img/login_img.png" alt="">
		      		</div>
		      		<div class="modal-body">
					<div id="id-pwd">
			        	<div id="id-input">
			            	<input type="text" id="userId" name="userId" placeholder="아이디">
			            </div>
						<div id="pwd-input">
							<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" autocomplete="off">
						</div>
		            </div>
		            <div id="cookie-ck">
			             <input type="checkbox" id="saveId" name="saveId">
			             <label for="saveId">아이디 저장</label>
		            </div>
		            <div id="login-fales">
		            	아이디나 비밀번호가 없다
		     		</div>
		            <div>
		            	<button type="submit" id="login-button">로그인</button>
		            </div>
		      		</div>
					<div class="modal-footer">
					      <a href="searchIdForm.me">아이디 찾기</a> |
					      <a href="searchPwdForm.me">비밀번호 찾기</a> |
					      <a href="enrollForm.me">회원가입</a>
					</div>
		    	</div>
		  	</div>
		</div>
  	</form>
  	
  	<script>
  		//쿠키에 저장된 아이디값 가져오기
		$(function(){
			var saveId = "${cookie.memId.value}"
			if(saveId != ""){//넘어오는 쿠키값이 있으면...
			$("#userId").val(saveId);
			$("#saveId").attr("checked",true);
			}
			
			var che = $("#userId").is(':checked');
		});
  	</script>

</body>
</html>