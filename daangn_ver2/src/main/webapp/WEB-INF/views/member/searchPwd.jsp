<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 모달을 사용하기 위한 부트스트랩CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<style>
	#search_Id {
	height: auto;
	}
	.inquiry.non_sign {
		width: 670px !important;
		margin: 0 auto !important;
	}
	.content_header {
		border-bottom: 2px solid #e5e5e5;
	}
	.content_header h2 {
		position: relative;
		float: left;
		clear: both;
		height: 21px;
		margin-bottom: -2px;
		padding: 0 2px 0 1px;
		border-bottom: 2px solid #4d4d4d;
	}
	.section_find .btn_area {
		padding: 17px 0 15px;
	}
	#search_Id .btn_area,#idModal .btn_area {
		text-align: center;
	}
	.input_box2 .phold {
		position: absolute;
		top: 0;
		left: 4px;
		color: #888;
		line-height: 25px;
	}
	.box6 {
		position: relative;
		z-index: 100;
		padding: 39px 40px 60px;
		border: 1px solid #e5e5e5;
		width: 650px;
		margin: auto;
		height: 270px;
	}
	.box_inn_sub p{
		font-size: 16px;
    	margin-top: 8px;
	}
	.box_inn .dsc {
		line-height: 18px;
		padding-top: 4px;
		color: #666;
	}
	.box_inn .label_rd {
		font-size: 18px;
		font-weight: 700;
		line-height: 18px;
		margin-left: -2px;
		letter-spacing: -1px;
		color: #333;
	}
	.box_inn dl {
		padding-top: 14px;
	}
	.box_inn dt {
		font-weight: 700;
		float: left;
		width: 90px;
		height: 25px;
		margin-top: 4.5px;
		font-size: 14px;
	}
	.box_inn dd {
		position: relative;
		width: 488px;
		height: 25px;
		margin-top: 6px;
		vertical-align: top;
	}
	.box_inn .label_txt {
		line-height: 25px;
		color: #333;
	}
	#search_Id label, #idModal label {
		cursor: pointer;
	}
	.box_inn .input_txt {
		line-height: 23px;
		height: 29px;
		padding-left: 3px;
		vertical-align: top;
		border: 1px solid #ccc;
	}
	#search_Id .blind, #idModal .blind {
		visibility: hidden;
		position: absolute;
		top: 0;
		left: 0;
		width: 0;
		height: 0;
		font-size: 0;
		line-height: 0;
	}
	.btn_ct {
		width: 97px;
		height: 25px;
		margin-left: 1px;
		background-position: 0 -210px;
	}
	.btn_next2 {
		width: 60px;
		height: 33px;
		background-position: 0 0;
	}
	.btn_next2{
		position: relative;
		display: inline-block;
		background: url(https://static.nid.naver.com/images/web/user/sp_find_idpw.png) no-repeat;
	}
	#search_Id, #search_Id button, #idModal, #idModal button{
		font-family: '돋움',Dotum,AppleGothic,sans-serif;
		font-size: 12px;
	}
	.content_header:after {
		font-size: 0;
		line-height: 0;
		display: block;
		clear: both;
		content: '';
	}
	.box_inn dl:after {
		display: block;
		clear: both;
		content: '';
	}
	#emailNm{
		margin-left: 50px;
	}
	#email{
		margin-left: 50px;
	}
	#search_Id button, .btn_next1, #search_Id_Modal button{
		background-color: #f8f8f8;
		border: 1px solid rgb(202, 202, 202);
		border-radius: 3px;
		height: 29px;
		position: relative;
		font-size: 14px;
		left: 5px;
	}
	#emailAuthNo{
		width: 217px;
    	margin-top: 15px;
   		margin-left: 50px;
   		font-size: 14px;
	}
	/* 모달영역 */
	#search_Id_Modal{
		display: none;
		position: fixed;
		top: 25%;
		left: 50%;
		height: 300px;
		transform: translate(-50%, -50%);
		box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
	}
	#searchId_Modal{
		width: 400px;
	}
	.dsc{
		font-size: 14px;
    	margin-top: -10px;
	}
	#searchIdGo{
	    position: relative;
	    width: 217px;
	    top: -25px;
	    left: 70px;
	}
	
	.modal-header p{
		font-weight: 600;
	    font-size: 18px;
	    position: relative;
	    left: 150px;
	}
	.dsc{
		font-size: 16px;
   		margin-top: -10px;
	}
	dt{
		font-weight: 700;
    	line-height: 2;
	}
	</style>
	
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div id="search_Id">
		<div id="id_container">
			<div id="id_content" class="non_sign inquiry">
				<div class="content_header">
					<h2 ><img src="https://static.nid.naver.com/images/web/user/h_find_pw2.gif" width="70" height="16" style="position: relative; top: -18px;" alt="비밀번호 찾기"></h2>
				</div>
				<div class="section section_find" style="margin-top: 30px;">
					<form id="fm" name="fm">
						<fieldset>	
							<div class="box6">
								<div id="div_email" class="box_inn selected">
									<div for="r_pn2" class="label_rd">본인확인 이메일로 인증</div>
									<div class="box_inn_sub">
										<p class="dsc">회원가입시 입력한 아이디와 이메일이 같아야, 인증번호를 받을 수 있습니다.</p>	
										<dl>
											<dt><label for="emailNm" class="label_txt">아이디</label></dt>
											<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px" required></dd>
											<dt class="text_top"><label for="id_email" class="label_txt">이메일 주소</label></dt>
											<dd class="text_top">
												<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px" required>
												<button class="btn_next1" type="button" onclick="searchId();">인증번호 받기</button>
											</dd>
											<dd class="ct" style="margin-top: -10px;">
												<span class="input_box2">
													<span id="span_emailAuthNo" class="phold" style="margin-top: 15px; margin-left: 130px;"></span>
													<input type="text" id="emailAuthNo" name="emailAuthNo" maxlength="4" class="input_txt" placeholder="인증번호 4자리 숫자 입력" disabled>
													<p id="searchId_Text" style="font-size: 11px; color: red; margin-left: 129px;"></p>
												</span>								
											</dd>	
										</dl>
									</div>		
								</div>
							</div>
							<div class="btn_area">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#searchIdModal" style="color: black; line-height: 1; margin-left: -20px;">다음</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="searchIdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p>비밀번호 찾기 결과</p>
	      </div>
	      <div class="modal-body" id="searchId_Modal">
			<div class="box_inn_sub">
				<p class="dsc">변경하실 비밀번호를 입력해주세요.</p>	
				<dl style="position: relative; top: 10px;">
					<dt><label for="memPwd" class="label_txt">비밀번호</label></dt>
					<dd><input type="password" id="memPwd" name="memPwd" placeholder="4~16자 영문, 숫자" minlength="4" maxlength="16" class="input_txt" style="position: relative; width:217px; top: -30px; left: 105px;"><br></dd>
				</dl>
				<dl style="position: relative; top: -30px;">
					<dt><label for="memPwdCk" class="label_txt">비밀번호확인</label></dt>
					<dd><input type="password" id="memPwdCk" name="memPwdCk" class="input_txt" style="position: relative; width:217px; top: -30px; left: 105px;"><br></dd>
				</dl>
				<p id="pwd_check" style="font-size: 11px; color: red; margin-left: 102px; margin-top: -63px;"></p>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" onclick="location.href='index.jsp'" style="background-color: white; border-radius: 5px; width: 120px;">메인페이지로</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>