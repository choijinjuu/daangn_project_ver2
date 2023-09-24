<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        #enroll_wrap{
            width: 800px;
            height: 850px;
            margin: auto;
            border-radius: 20px;
        }
        #enroll_text{
        	width: 700px;
        	height: 35px;
        	margin: auto;
        	padding-top: 20px;
        }
        #enroll_text>div{
        	float: left;
        	width: 33%;
        	margin: auto;
        }
        #enroll_text span{
        	font-size: 18px;
        	margin-left: 75px;
        	color: rgb(192, 192, 192);
        }
        #enroll_text span:hover{
        	color: rgb(53, 53, 53);
        	cursor: pointer;
        }
        #enroll_text_1{
        	color: rgb(53, 53, 53) !important;
        }
        #enroll_form{
            width: 600px;
            margin: auto;
        }
        #enroll_title{
        	height: 85px;
        	font-size: 23px;
        	line-height: 3;
        }
        #enroll_title strong{
        	margin-left: 5px;
        }
        /* 프로필 관련 css */
        #profile_area{
        	height: 130px;
        }
        #profile_area span{
        	margin-top: 45px;
        }
        #profile_area img{
        	width: 150px;
        	height: 120px;
        }
        .enroll_area>*{
        	float: left;
        }
        .enroll_area span{
        	width: 100px;
        	line-height: 2.5;
        }
        .enroll_area{
        	width: 100%;
        	height: 60px;
        	padding: 5px;
        }
        .enroll_area input{
        	border: 0px;
        	border-bottom: 0.1px solid rgb(225, 225, 225);
            outline: none;
            width: 450px;
            background-color: white;
            font-size: 18px;
        }
        #pwd_area input{
        	width: 350px;
        }
        #pwd_area button{
        	height: 30px;
        	background-color: white;
        	border: 0.5px solid rgb(182, 182, 182);
        	border-radius: 5px;
        }
        #pwd_area button:hover{
        	cursor: pointer;
        	background-color: rgb(246, 246, 246);
        }
        .enroll_area2{
        	width: 250px;
        	height: 25px;
        	border-radius: 5px;
        	margin-top: 5px;
        }
        #enroll_go{
        	margin-top: 10px;
        	height: 40px;
        	width: 100%;
        }
        #enroll_go button{
        	height: 100%;
        	width: 100%;
        	background-color: rgb(255, 98, 25);
        	border: 1px solid black;
        	border-radius: 5px;
        }
        #enroll_go button:hover{
        	background-color: rgb(255, 162, 119);
        	cursor: pointer;
        }
    </style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<hr style="border: 0.3px solid rgb(232, 232, 232);">
	
	<div id="enroll_wrap">
		<div id="enroll_text">
			<div><span id="enroll_text_1" onclick="location.href='mypage.me'"><strong>내 정보</strong></span></div>
			<div><span onclick="location.href='myBoard.me?currentPage=1'"><strong>나의 글</strong></span></div>
			<div><span onclick="location.href='myReply.me?currentPage=1'"><strong>나의 댓글</strong></span></div>
		</div>
		<hr id="enroll_text_hr">
        <div id="enroll_form">
        	<div id="enroll_title"><strong>회원정보 수정</strong></div>
            <form action="updateMy.me" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memNo" id="memNo" value="${loginMember.memNo }">
            	<div class="enroll_area" id="profile_area">
                	<span><strong>프로필 설정</span>
                	<!-- 프로필 미리보기 영역 -->
		            <img id="profileImg" name="profileImg" src="${loginMember.profileImg }">
                </div>
                <!--파일 첨부 영역 -->
				<div id="file-area" align="center">
					<input type="file" id="file1" name="file1" onchange="loadImg(event);">
				</div>
                <div class="enroll_area">
                	<span><strong>아이디</span>
	                <input class="enroll_area2" type="text" name="memberId" id="memberId" value="${loginMember.memId }" style="color: rgb(144, 144, 144);" disabled>            
                </div>
                <div class="enroll_area">
                	<span><strong>닉네임</span>
	                <input class="enroll_area2" type="text" name="nickName" id="nickName" value="${loginMember.nickName }">            
                </div>
                <div class="enroll_area">
                	<span><strong>이름</span>
	                <input class="enroll_area2" type="text" name="memName" id="memName" value="${loginMember.memName }" style="color: rgb(144, 144, 144);" disabled>            
                </div>
                <div class="enroll_area" id="pwd_area">
                	<span><strong>비밀번호</span>
	                <input class="enroll_area2" type="password" name="memPwd" id="memberPwd" value="">
	                <button type="button" onclick="togglePassword();">비밀번호 보기</button>      
                </div>
                <div class="enroll_area">
                	<span><strong>이메일</span>
	                <input class="enroll_area2" type="email" name="email" id="email" value="${loginMember.email }">            
                </div>
                <div class="enroll_area">
                	<span><strong>주소</span>
	                <input class="enroll_area2" name="address" id="address" type="text" value="${loginMember.address }"  onclick="postcode();">            
                </div>
                <div class="enroll_area">
                	<span><strong>정보 수정일</span>
	                <input class="enroll_area2" type="text" name="enrollDate2" id="enrollDate2" value="${loginMember.updateDate }" style="color: rgb(144, 144, 144);" disabled>            
                </div>
                <div class="enroll_area">
                	<span><strong>가입일</span>
	                <input class="enroll_area2" type="text" name="enrollDate" id="enrollDate" value="${loginMember.enrollDate }" style="color: rgb(144, 144, 144);" disabled>            
                </div>
                <div id="enroll_go">
                	<button type="submit"><strong>정보 수정</strong></button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
    	/* 다음 주소 검색 API */
    	function postcode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//원하는 값 주소창에 넣어주기
		        	document.getElementById("address").value=data.address;
		        }
		    }).open();	
    	}
    	
    	/* 비밀번호 보여주기 */
    	function togglePassword() {
		    var passwordField = document.getElementById("memberPwd");
		
		    if (passwordField.type === "password") {
		        passwordField.type = "text";
		    } else {
		        passwordField.type = "password";
		    }
		}
    	
    	/* 썸네일 첨부 */
    	$(function(){
    				$("#file-area").hide();
    				$("#profileImg").click(function(){
    					$("#file1").click();
    				});
    			});
                
    	function loadImg(event) {
    	    var fileInput = event.target;
    	    var profileImg = document.getElementById("profileImg");

    	    if (fileInput.files && fileInput.files[0]) {
    	        var reader = new FileReader();
    	        reader.onload = function(e) {
    	            profileImg.setAttribute("src", e.target.result);
    	        };
    	        reader.readAsDataURL(fileInput.files[0]);
    	    } else {
    	        profileImg.setAttribute("src", "");
    	    }
    	}
    </script>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>