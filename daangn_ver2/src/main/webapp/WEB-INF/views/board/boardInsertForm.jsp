<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#board_wrap{
			width: 800px;
			margin: auto;
		}
		#board_title{
			height: 100px;
			line-height: 5;
			font-size: 23px;
		}
		#content_area{
			width: 100%;
			padding-top: 20px;
		}
		.board_area, .board_area1, .board_area2{
			width: 100%;
			height: 60px;
		}
		.board_area>div, .board_area1>div, .board_area2>div{
			float: left;
		}
		.board_area_1{
			width: 140px;
			height: 100%;
			line-height: 2.6;
		}
		.board_area_2{
			height: 100%;
			line-height: 2.6;
		}
		.board_area_2 select{
			height: 30px;
			outline: none;
			cursor: pointer;
		}
		.board_area_2 input{
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
			border-bottom: 0.5px solid rgb(194, 194, 194);
			width: 522px;
			font-size: 18px;
			outline: none;
			background: white;
		}
		#content_id{
			height: 180px;
		}
		#content_id textarea{
			margin-top: 20px;
			border: 0.5px solid rgb(194, 194, 194);
			height: 150px;
			width: 522px;
			resize: none;
			outline: none;
		}
		#board_area_2 img{
			width: 150px;
			height: 120px;
		}
		#board_btn_area{
			height: 110px;
		}
		#board_btn{
			width: 500px;
			height: 45px;
		}
		.board_area_2 button{
			width: 100%;
			height: 100%;
			background-color: rgb(255, 102, 31);
			border-radius: 20px;
			font-weight: 600;
			font-size: 16px;
			cursor: pointer;
			margin-top: 30px;
		}
		.board_area_2 button:hover{
			opacity: 0.7;
		}
		#open_m, #close_m{
			margin-left: 5px;
		}
		#job_date{
			width: 120px !important;
			font-size: 17px !important;
		}
		.job_area{
			width: 120px !important;
		}
		.job_area input{
			width: 100%;
		}
		#file_div{
			height: 150px;
		}
		.board_area_2 img{
            width: 170px;
            height: 150px;
        }
	</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<div id="board_wrap">
		<div id="board_title">
			<strong>글 등록하기</strong>
		</div>
		<div id="content_area">
			<form action="insert.bo" method="post" id="content_area_form" enctype="multipart/form-data">
				<!-- 회원 번호도 넘기기 -->
				<input type="hidden" name="memNo" id="memNo" value="${loginMember.memNo }">
				<div class="board_area">
					<div class="board_area_1"><strong>카테고리 분류</strong></div>
					<div class="board_area_2" id="board_area_2">
						<select name="category" id="category">
				            <option value="0">카테고리 분류</option>
				            <option value="1">중고거래</option>
				            <option value="2">동네가게</option>
				            <option value="3">알바</option>
				        </select>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>제목</strong></div>
					<div class="board_area_2">
						<input type="text" name="title" id="title" required>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>작성자</strong></div>
					<div class="board_area_2">
						<input type="text" value="${loginMember.nickName }" placeholder="" disabled>
					</div>
				</div>
				<div class="board_area add1">
					<div class="board_area_1"><strong>주소</strong></div>
					<div class="board_area_2">
						<input type="text" name="address" id="address" value="" onclick="postcode();">
					</div>
				</div>
				<div class="board_area add3" id="content_id">
					<div class="board_area_1"><strong>내용</strong></div>
					<div class="board_area_2">
						<textarea name="content" id="content" required></textarea>
					</div>
				</div>
				<!-- 파일 미리보기 영역 -->
				<div class="board_area" id="file_div">
					<div class="board_area_1"><strong>첨부파일</strong></div>
					<div class="board_area_2">
	                    <img id="contentImg1">
	                    <img id="contentImg2">
	                    <img id="contentImg3">
					</div>
                </div>
				<!-- 파일 첨부 영역 -->
                <div id="file_area">
                    <input type="file" name="upfile" id="file1" onchange="LoadImg(this,1);">
                    <input type="file" name="upfile" id="file2" onchange="LoadImg(this,2);">
                    <input type="file" name="upfile" id="file3" onchange="LoadImg(this,3);">
                </div>
				<div class="board_area" id="board_btn_area">
					<div class="board_area_1"></div>
					<div class="board_area_2" id="board_btn">
						<button type="submit">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file = "../common/footer.jsp" %>
	
	<script>
		
		var category = document.getElementById("category");
		var address = document.getElementById("address");
		var board_area1 = document.createElement("div");
		var board_area2 = document.createElement("div");
		var newSelect = document.createElement("select");
		/* 카테고리 name 넣어주기 */
		newSelect.name = "subCategory";
		
		/* 대분류 카테고리마다 속성 변경하기 */
		category.addEventListener("change", function(){
			
			if(this.value == "1"){ /* 중고거래 선택시 */
				
				/* 새로운 카테고리 생성 */
				newSelect.className = "newSelect";
				newSelect.innerHTML= '<select name="subCategory" id="subCategory">'+
										'<option value="1">디지털기기</option>'+
										'<option value="2">스포츠/레저</option>'+
										'<option value="3">생활/가전</option>'+
										'<option value="4">티켓/교환권</option>'+
										'<option value="5">기타</option>'+
									'</select>';
				document.querySelector("#board_area_2").appendChild(newSelect);
				
				/* 주소 불러오기 */
				address.value= "${loginMember.address}";
				address.disabled = true;
				
				/* 새로운 가격 div 생성 */
				board_area1.className = "board_area1";
				board_area1.innerHTML= '<div class="board_area_1">'+
											'<strong>가격</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<input type="number" name="price" id="price">'+
										'</div>';
				document.querySelector(".add1").after(board_area1);
				
			}else if(this.value == "2"){ /* 동네가게 선택시 */
				
				/* 새로운 카테고리 생성 */
				newSelect.className = "newSelect";
				newSelect.innerHTML= '<select name="subCategory" id="subCategory">'+
										'<option value="1">식당</option>'+
										'<option value="2">카페</option>'+
										'<option value="3">뷰티/미용</option>'+
										'<option value="4">운동</option>'+
										'<option value="5">기타</option>'+
									'</select>';
				document.querySelector("#board_area_2").appendChild(newSelect);
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
				
				/* 새로운 오픈시간 div 생성 */
				board_area1.className = "board_area2";
				board_area1.innerHTML= '<div class="board_area_1 add2">'+
											'<strong>매장 시간</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<select name="open_h" id="open_h">'+
												'<option value="00">00시</option>'+
												'<option value="08">08시</option>'+
												'<option value="09">09시</option>'+
												'<option value="10">10시</option>'+
												'<option value="11">11시</option>'+
												'<option value="12">12시</option>'+
											'</select>'+
											'<select name="open_m" id="open_m">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
											'<strong> ~ </strong>'+
												'<select name="close_h" id="close_h">'+
												'<option value="00">00시</option>'+
												'<option value="17">17시</option>'+
												'<option value="18">18시</option>'+
												'<option value="19">19시</option>'+
												'<option value="20">20시</option>'+
												'<option value="21">21시</option>'+
											'</select>'+
											'<select name="close_m" id="close_m">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
										'</div>';
				document.querySelector(".add1").after(board_area1);
				
			}else if(this.value == "3"){ /* 알바 선택시 */
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
				
				/* 새로운 근무 날짜 div 생성 */
				board_area1.className = "board_area2";
				board_area1.innerHTML= '<div class="board_area_1">'+
											'<strong>근무 날짜</strong>'+
										'</div>'+
										'<div class="board_area_2 job_area">'+
											'<input type="date" name="jobDate" id="jobDate">'+
										'</div>';
				document.querySelector(".add1").after(board_area1);

				/* 1차분류 카테고리 삭제 */
				document.querySelector("#board_area_2").removeChild(newSelect);
				
			}else{
				/* 1차분류 카테고리 삭제 */
				document.querySelector("#board_area_2").removeChild(newSelect);
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
			}
		})
		
		/* 다음 주소 검색 API */
    	function postcode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//원하는 값 주소창에 넣어주기
		        	document.getElementById("address").value=data.address;
		        }
		    }).open();	
    	}
		
		//첨부 파일 영역 숨기기
		$(function(){
			$("#file_area").hide();
            $("#contentImg1").click(function(){
                $("#file1").click();
            });
            $("#contentImg2").click(function(){
                $("#file2").click();
            });
            $("#contentImg3").click(function(){
                $("#file3").click();
            });
		})
		
		//파일 미리 보기
        function LoadImg(inputFile,num){
            //console.log(inputFile.files.length);
            //파일 있으면 1, 없으면 0
            if(inputFile.files.length == 1){ //파일이 있으면
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                //FileReader : 파일 읽어줄 객체
                //readAsDataURL : 파일 읽어줄 메소드 -> 읽어들이는 순간 url부여

                reader.onload = function(e){
                    //url
                    console.log(e.target.result);
                    //src에 url을 부여하면 미리보기 가능
                    switch(num){
                        case 1 :$("#contentImg1").attr("src",e.target.result); break;
						case 2 :$("#contentImg2").attr("src",e.target.result); break;
						case 3 :$("#contentImg3").attr("src",e.target.result); break;
                    }
                }
            }else{
                switch(num){
					case 1 :$("#contentImg1").attr("src",null); break;
					case 2 :$("#contentImg2").attr("src",null); break;
					case 3 :$("#contentImg3").attr("src",null); break;
                }
            }
        }
	</script>
</body>
</html>