<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>Document</title>
	<!-- 다음 주소 검색 API 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- css참조 -->
	<link rel="stylesheet" href="resources/css/common.css">
	
	<!-- 부트스트랩CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<body>

	<form action="">
    <div class="menubar_wrap">
        <div class="menubar_el1" id="banner">
            <div id="banner_img"><a href=""><img src="resources/css_img/logo.png"></a></div>
        </div>
        <div class="menubar_el1" id="menu">
            <div id="flea"><a href="" id="flea">중고거래</a></div>
            <div id="market"><a href="" id="store">동네가게</a></div>
            <div id="job"><a href="" id="job">알바</a></div>
        </div>
        <div class="menubar_el1" id="search">
            	<div id="search_text"><input type="text" id="text_area" placeholder="&nbsp;물품이나 동네를 검색해보세요!"></div>
            	<div id="search_img"><button type="submit"><img src="resources/css_img/search_img.png"></button></div>
        </div>
        <div class="menubar_el1" id="loginbar">
            <!-- <a data-toggle="modal" href="#loginModal" data-toggle="modal" data-target="#loginModal">로그인</a> -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button>
            <button type="button" id="jointext" onclick="location.href='enrollForm.me'">회원가입</button>
            <!-- <div onclick="location.href='mypage.me'"><img id="profile_img"></div>
            <a href="mypage.me">마이페이지</a>
            <a href="" id="logout">로그아웃</a> -->
        </div>
    </div>
    </form>
    
  	<!-- 로그인 모달 -->
  	<form action="">
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
			             <input type="checkbox" id="saveId" name="saveId" value="off">
			             <label for="saveId">아이디 저장</label>
		            </div>
		            <div id="login-fales">
		            	아이디나 비밀번호가 없다
		     		</div>
		            <div>
		            	<button type="button" id="login-button" onclick="return loginGo();">로그인</button>
		            </div>
		      		</div>
					<div class="modal-footer">
					      <a href="searchIdForm.me">아이디 찾기</a> |
					      <a href="searchPwdForm.me">비밀번호 찾기</a> |
					      <a href="enrollListForm.me">회원가입</a>
					</div>
		    	</div>
		  	</div>
		</div>
  	</form>

</body>
</html>