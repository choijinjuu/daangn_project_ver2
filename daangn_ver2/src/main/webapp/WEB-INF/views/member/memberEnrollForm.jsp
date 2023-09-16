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
	                <input class="enroll_area2" type="text" name="memId" id="memId" minlength="5" maxlength="12" placeholder="5~12자의 영문, 숫자" required>            
	                <div class="error_text" id="id_check"></div>
                </div>
                <div class="enroll_area">
                	<span><strong>닉네임</strong></span><br>
	                <input class="enroll_area2" type="text" name="nickName" id="nickName" minlength="2" maxlength="8" placeholder="2~8자의 한글,영문,숫자" required>  
	                <div class="error_text" id="nick_check"></div> 
                </div>
                <div class="enroll_area">
                	<span><strong>이름</strong></span><br>
	                <input class="enroll_area2" type="text" name="memName" id="memName" required>            
	                <div class="error_text" id=""></div>
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호</strong></span><br>
	                <input class="enroll_area2" type="password" name="memPwd" id="memPwd" minlength="4" maxlength="16" placeholder="4~16자 영문, 숫자, 특수문자(! . , ~)" required autocomplete="off">
	                <div class="error_text" id="pwd_check"></div>         
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호 확인</strong></span><br>
	                <input class="enroll_area2" type="password" name="memPwdCk" id="memPwdCk" maxlength="16" placeholder="비밀번호와 똑같이 입력해주십시오." required autocomplete="off">            
	                <div class="error_text" id="pwdCk_check"></div>        
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
                	<button type="submit" id="insertGo" onclick="return joinCk();">회원가입</button>
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
	    		$("#id_check").show();
	    		$.ajax({
	    			url : "check.me",
	    			data : {memId : memId.val()},
	    			success : function(result){
	    				if(result=="NNNNN"){//아이디 중복 존재
	    					$("#id_check").css({"color":"red"}).text("중복된 아이디가 존재합니다.");
	    				}else{//아이디 중복 없을때
	    					$("#id_check").css({"color":"green"}).text("사용 가능한 아이디 입니다.");
		    				
	    					//유효성 검사도 진행
		    				var regExp = /^[a-zA-Z0-9]+$/;
		    				if(!(regExp.test(memId.val()))){
		    					$("#id_check").css({"color":"red"}).text("아이디 형식이 올바르지 않습니다.");
		    				}
	    				}
	    			}
	    		})
	    	}else{//2글자 미만일때
	    		$("#id_check").hide(); //텍스트 숨김
	    	}
	    })
	    
	    /* 닉네임 중복 및 유효성 검사 */
	    var nickName = $("#nickName");
	    
	    nickName.keyup(function(){
	    		$("#nick_check").hide();
	    	if(nickName.val().trim().length>=2){
	    		$("#nick_check").show();
	    		$.ajax({
	    			url : "check.me",
	    			data : {nickName : nickName.val()},
	    			success : function(result){
	    				if(result=="NNNNN"){//아이디 중복 존재
	    					$("#nick_check").css({"color":"red"}).text("중복된 닉네임이 존재합니다.");
	    				}else{//아이디 중복 없을때
	    					$("#nick_check").css({"color":"green"}).text("사용 가능한 닉네임 입니다.");
	    					
		    				//유효성 검사도 진행
		    				var regExp = /^[가-힣a-zA-Z0-9]+$/;
		    				if(!(regExp.test(nickName.val()))){
		    					$("#nick_check").css({"color":"red"}).text("닉네임 형식이 올바르지 않습니다.");
		    				}
	    				}
	    			}
	    		})
	    	}else{//2글자 미만일때
	    		$("#id_check").hide(); //텍스트 숨김
	    	}
	    })
	    
	    //비밀번호 유효성 검사
		var memPwd = $("#memPwd");
		memPwd.keyup(function(){
			if(memPwd.val().trim().length>=1){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
				var regExp = /^[a-zA-Z0-9!.,~]+$/;
				if(!(regExp.test(memPwd.val()))){ //조건에 맞지 않으면
					$("#pwd_check").show();
					$("#pwd_check").css({"color":"red"}).text("비밀번호 향식이 올바르지 않습니다.");
				}else{//조건에 맞으면
					$("#pwd_check").hide();
				}
			}else{
				$("#pwd_check").hide();
			}
		});
	    
		//비밀번호 확인 메세지 지우기 (키업으로 비밀번호 지울시 text없애주기)
		$("#memPwdCk").keyup(function(){
			$("#pwdCk_check").hide();
		});
		
		//회원가입 버튼 클릭시 회원가입 진행
		function joinCk(){
			//비밀번호 확인 != 비밀번호시
			if($("#memPwd").val()!=$("#memPwdCk").val()){
				console.log("ddsdf");
				$("#pwdCk_check").show();
				$("#pwdCk_check").css({"color":"red"}).text("비밀번호가 일치하지 않습니다.");
				$("#checkPwd").focus();
				return false;
			}
		}
    </script>
    
</body>
</html>