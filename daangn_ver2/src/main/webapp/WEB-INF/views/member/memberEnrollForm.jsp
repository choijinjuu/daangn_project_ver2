<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css 참조 -->
	<link rel="stylesheet" href="resources/css/member.css">

</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<hr style="border: 0.3px solid rgb(232, 232, 232);">
	
	<div id="enroll_wrap">
		<div id="enroll_text">
			<span>회원가입</span>
			<hr>
		</div>
        <div id="enroll_form">
            <form action="insert.me" method="post">
                <div class="enroll_area">
                	<span><strong>아이디</strong></span><br>
	                <input class="enroll_area2" type="text" name="memId" id="memId" placeholder="5~12자의 영문, 숫자" required>            
	                <div class="error_text" id="id_check"><strong></strong></div>
                </div>
                <div class="enroll_area">
                	<span><strong>닉네임</strong></span><br>
	                <input class="enroll_area2" type="text" name="nickName" id="nickName" placeholder="2~8자의 한글,영문,숫자" required>  
	                <!-- <div class="error_text"><strong>중복된 닉네임이 존재합니다.</strong></div>      -->     
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호</strong></span><br>
	                <input class="enroll_area2" type="password" name="memPwd" id="memPwd" placeholder="8~16자 영문, 숫자, 특수문자(! . , ~)" required autocomplete="off">
	                <!-- <div class="error_text"><strong>잘못된 비밀번호 입니다.</strong></div>  -->             
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호 확인</strong></span><br>
	                <input class="enroll_area2" type="password" name="memPwdCk" id="memPwdCk" placeholder="비밀번호와 똑같이 입력해주십시오." required autocomplete="off">            
	                <!-- <div class="error_text"><strong>비밀번호가 일치하지 않습니다.</strong></div>      -->             
                </div>
                <div class="enroll_area">
                	<span><strong>이메일</strong></span><br>
	                <input class="enroll_area2" type="email" name="email" id="email" required>            
                </div>
                <div class="enroll_area">
                	<span><strong>주소</strong></span><br>
	                <input class="enroll_area2" name="address" id="address" type="text"  onclick="postcode();" required>            
                </div>
                <div id="enroll_go">
                	<button>회원가입</button>
                </div>
            </form>
        </div>
        <div id="daangn_img">
        	<img src="resources/css_img/daangn_img.png">
        </div>
    </div>
    
    <script>
	    /* 다음 주소 검색 API */
		function postcode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//원하는 값 주소창에 넣어주기
		        	document.getElementById("address").value=data.address
		        }
		    }).open();	
		}
	    
	    /* 아이디 중복 및 유효성 검사 */
	    var memId = $("#memId");
	    
	    memId.keyup(function(){
	    	if(memId.val().trim().length>=2){
	    		$("id_check").show();
	    		$.ajax({
	    			url : "check.me",
	    			data : {memId : memId.val()},
	    			success : function(result){
	    				if(result=="NNNNN"){//아이디 중복 존재
	    					$("#id_check").css({"color":"red","font-size":"12px"}).text("중복된 아이디가 존재합니다.");
	    				}else{//아이디 중복 없을때
	    					$("#id_check").css({"color":"green","font-size":"12px"}).text("사용 가능한 아이디 입니다.");
	    				
		    				//유효성 검사도 진행
		    				var regExp = /^[a-zA-z0-9]+$/;
		    				if(!(regExp.text(memId.val()))){
		    					$("#id_check").css({"color":"red","font-size":"12px"}).text("아이디 형식이 올바르지 않습니다.");
		    				}
	    				}
	    			}
	    		})
	    	}else{//2글자 미만일때
	    		$("#id_check").hide(); //텍스트 숨김
	    	}
	    })
	    
	    
    </script>
    
</body>
</html>