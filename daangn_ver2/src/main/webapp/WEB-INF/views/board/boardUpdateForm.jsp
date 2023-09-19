<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- <style>
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
		}
		.board_area, .board_area1, .board_area2{
			width: 100%;
			height: 50px;
		}
		.board_area>div, .board_area1>div, .board_area2>div{
			float: left;
		}
		.board_area_1{
			width: 140px;
			height: 100%;
			line-height: 4;
		}
		.board_area_2{
			height: 100%;
			line-height: 4;
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
			width: 500px;
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
			width: 500px;
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
			margin-top: 30px;
		}
		.board_area_2 button{
			width: 100%;
			height: 100%;
			background-color: rgb(255, 102, 31);
			border-radius: 20px;
			font-weight: 600;
			font-size: 16px;
			cursor: pointer;
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
	</style> -->
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
	<%-- <div id="board_wrap">
		<div id="board_title">
			<strong>글 수정하기</strong>
		</div>
		<div id="content_area">
			<form action="update.bo?boardNo=${b.boardNo }" method="post" id="content_area_form" enctype="multipart/form-data">
				<!-- 회원 번호도 넘기기 -->
				<input type="hidden" name="memNo" id="memNo" value="${b.memNo }">
				<div class="board_area">
					<div class="board_area_1"><strong>카테고리 분류</strong></div>
					<!-- 들어온 카테고리에 따라 -->
					<div class="board_area_2" id="board_area_2">
						<select name="category" id="category">
				            <option value="0">카테고리 분류</option>
				            <option value="1">중고거래</option>
				            <option value="2">동네가게</option>
				            <option value="3">알바</option>
				        </select>
				        <c:choose>
				        	<c:when test="${b.category eq '1' }">
						        <select name="subCategory" id="subCategory" class="newSelect">
									<option value="1">디지털기기</option>
									<option value="2">스포츠/레저</option>
									<option value="3">생활/가전</option>
									<option value="4">티켓/교환권</option>
									<option value="5">기타</option>
								</select>
				        	</c:when>
				        	<c:when test="${b.category eq '2' }">
								<select name="subCategory" id="subCategory" class="newSelect">
									<option value="1">식당</option>
									<option value="2">카페</option>
									<option value="3">뷰티/미용</option>
									<option value="4">운동</option>
									<option value="5">기타</option>
								</select>
				        	</c:when>
				        </c:choose>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>제목</strong></div>
					<div class="board_area_2">
						<input type="text" name="title" id="title">
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>작성자</strong></div>
					<div class="board_area_2">
						<input type="text" value="${b.member.nickName }" disabled>
					</div>
				</div>
				<div class="board_area add1">
					<div class="board_area_1"><strong>주소</strong></div>
					<div class="board_area_2">
						<input type="text" name="address" id="address" onclick="postcode();">
					</div>
				</div>
				<!-- 들어온 카테고리에 따라 -->
				<c:choose>
					<c:when test="${b.category eq '1' }">
						<div class="board_area1">
							<div class="board_area_1"><strong>가격</strong></div>
							<div class="board_area_2">
								<input type="number" name="price" id="price" value="${b.price }">
							</div>
						</div>
						<div class="board_area add3" id="content_id">
							<div class="board_area_1"><strong>내용</strong></div>
							<div class="board_area_2">
								<textarea name="content" id="content">${b.content }</textarea>
							</div>
						</div>
					</c:when>
					<c:when test="${b.category eq '2' }">
						<div class="board_area2">
							<div class="board_area_1 add2"><strong>매장 시간</strong></div>
							<div class="board_area_2">
								<select name="open_h" id="open_h">
									<option value="00">00시</option>
									<option value="08">08시</option>
									<option value="09">09시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
								</select>
								<select name="open_m" id="open_m">
									<option value="00">00분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
								<strong> ~ </strong>
									<select name="close_h" id="close_h">
									<option value="00">00시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
								</select>
								<select name="close_m" id="close_m">
									<option value="00">00분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
							</div>
						</div>
						<div class="board_area add3" id="content_id">
							<div class="board_area_1"><strong>내용</strong></div>
							<div class="board_area_2">
								<textarea name="content" id="content">${b.content }</textarea>
							</div>
						</div>
					</c:when>
					<c:when test="${b.category eq '3' }">
						<div class="board_area2">
							<div class="board_area_1"><strong>근무 날짜</strong></div>
							<div class="board_area_2 job_area">
								<input type="date" name="jobDate" id="jobDate">
							</div>
						</div>
						<div class="board_area add3" id="content_id">
							<div class="board_area_1"><strong>내용</strong></div>
							<div class="board_area_2">
								<textarea name="content" id="content">${b.content }</textarea>
							</div>
						</div>
					</c:when>
				</c:choose>
				<div class="board_area">
					<div class="board_area_1"><strong>첨부파일</strong></div>
					<div class="board_area_2">
						<input type="file" id="file1" name="file1">
					</div>
				</div>
				<div class="board_area" id="board_btn_area">
					<div class="board_area_1"></div>
					<div class="board_area_2" id="board_btn">
						<button type="submit">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div> --%>
	
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
				        <c:if test="${b.category }"></c:if>
				        <c:choose>
				        	<c:when test="${b.category eq '1' }">
						        <select name="subCategory" id="subCategory" class="newSelect">
									<option value="1">디지털기기</option>
									<option value="2">스포츠/레저</option>
									<option value="3">생활/가전</option>
									<option value="4">티켓/교환권</option>
									<option value="5">기타</option>
								</select>
				        	</c:when>
				        	<c:when test="${b.category eq '2' }">
								<select name="subCategory" id="subCategory" class="newSelect">
									<option value="1">식당</option>
									<option value="2">카페</option>
									<option value="3">뷰티/미용</option>
									<option value="4">운동</option>
									<option value="5">기타</option>
								</select>
				        	</c:when>
				        </c:choose>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>제목</strong></div>
					<div class="board_area_2">
						<input type="text" name="title" id="title" value="${b.title }" required>
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
						<input type="text" name="address" id="address" value="${b.address }" onclick="postcode();">
					</div>
				</div>
				<!-- 들어온 카테고리에 따라 -->
				<c:choose>
					<c:when test="${b.category eq '1' }">
						<div class="board_area1">
							<div class="board_area_1"><strong>가격</strong></div>
							<div class="board_area_2">
								<input type="number" name="price" id="price" value="${b.price }">
							</div>
						</div>
					</c:when>
					<c:when test="${b.category eq '2' }">
						<div class="board_area2">
							<div class="board_area_1 add2"><strong>매장 시간</strong></div>
							<div class="board_area_2">
								<select name="open_h" id="open_h">
									<option value="00">00시</option>
									<option value="08">08시</option>
									<option value="09">09시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
								</select>
								<select name="open_m" id="open_m">
									<option value="00">00분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
								<strong> ~ </strong>
									<select name="close_h" id="close_h">
									<option value="00">00시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
								</select>
								<select name="close_m" id="close_m">
									<option value="00">00분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
							</div>
						</div>
					</c:when>
					<c:when test="${b.category eq '3' }">
						<div class="board_area2">
							<div class="board_area_1"><strong>근무 날짜</strong></div>
							<div class="board_area_2 job_area">
								<input type="date" name="jobDate" id="jobDate">
							</div>
						</div>
					</c:when>
				</c:choose>
				<div class="board_area add3" id="content_id">
					<div class="board_area_1"><strong>내용</strong></div>
					<div class="board_area_2">
						<textarea name="content" id="content" required>${b.content }</textarea>
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
	
	<!-- 값 미리 넣어놓기 -->
	<c:choose>
		<c:when test="${b.category eq '1' }">
			<script>
				$(function(){
					//값 집어넣기
					$("#category").val(${b.category}).attr("selected","selected");
					$("#subCategory").val(${b.subCategory}).attr("selected","selected");
					/* $("#title").val('${b.title}'); */
					/* $("#address").val('${b.address}'); */
				})
			</script>
		</c:when>
		<c:when test="${b.category eq '2' }">
			<script>
				$(function(){
					//값 집어넣기
					$("#category").val('${b.category}').attr("selected","selected");
					$("#subCategory").val('${b.subCategory}').attr("selected","selected");
				/* 	$("#title").val('${b.title}'); */
					/* $("#address").val('${b.address}'); */
				})
			</script>
		</c:when>
		<c:when test="${b.category eq '3' }">
			<script>
				$(function(){
					//값 집어넣기
					$("#category").val('${b.category}').attr("selected","selected");
				/* 	$("#subCategory").val('${b.subCategory}').attr("selected","selected"); */
					/* $("#title").val('${b.title}');
					$("#address").val('${b.address}'); */
				})
			</script>
		</c:when>
	</c:choose>
</body>
</html>