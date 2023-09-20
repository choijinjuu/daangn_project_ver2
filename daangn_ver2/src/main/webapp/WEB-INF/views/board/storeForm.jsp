<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* 동네가게에서는 동네가게 카테고리 색깔 주황색으로 고정 */
        #store{
            color: rgb(246, 117, 37) !important;
        }
		#main_banner{
			height: 310px;
			width: 100%;
		}
		#main_banner img{
			height: 100%;
			width: 100%;
		}
		#main_content{
			width: 800px;
			margin: auto;
		}
		#content_title{
			height: 130px;
			width: 100%;
		}
		#content_title>div{
			float: left;
		}
		#content_title_el1{
			height: 100%;
			width: 90%;
		}
		#content_title_el1 span{
			font-weight: 600;
			font-size:32px;
			line-height: 5.3;
			margin-left: 175px;
			cursor: default;
		}
		#content_title_el3{
			height: 100%;
			width: 10%;
		}
		#content_btn_area{
			width: 70px;
			height: 30px;
			margin-top: 70px;
		}
		#content_btn_area button{
			width: 100%;
			height: 100%;
			background-color: white;
			border-radius: 10px;
			border: 0.1em solid black;
		}
		#content_btn_area button:hover{
			cursor: pointer;
			background-color: rgb(244, 244, 244);
		}
		#content_cate{
			height: 60px;
		}
		#content_cate div{
			margin-top: -20px;
			margin-left: 160px;
		}
		#content_cate ul{
		    background-color: blue;
		}
		#content_cate li{
			float: left;
		    list-style: none;
		    padding: 10px;
		}
		#content_cate button{
			margin-top: -20px;
			border-radius: 20px;
			background-color: white;
			cursor: pointer;
			border: 1px solid rgb(222, 222, 222);
			padding: 8px;
		}
		#content_el{
			width: 100%;
			/* 단 나누기 */
			display: grid;
			grid-template-columns: repeat(2, 1fr);
			/* column-count: 2;
			-webkit-column-count: 2; */
		}
		#content_el_1{
			height: 130px;
			width: 100%;
		}
		#flea_con{
			height: 90%;
			width: 95%;
			border-radius: 10px;
			margin: auto;
			margin-top: 5px;
		}
		#flea_con:hover{
			background-color:rgba(0, 0, 0, 0.1);
			cursor: pointer;
		}
		#flea_con>div{
			float: left;
		}
		#flea_img{
			border-radius: 10px;
			height: 115px;
			width: 30%;
		}
		#flea_img img{
			border-radius: 10px;
			width: 100%;
			height: 100%;
		}
		#flea_text{
			padding-top: 15px;
			padding-left: 10px;
		}
		#flea_title strong{
			font-size: 18px;
		}
		#flea_title span{
			font-size: 13px;
			margin-left: 3px;
			color: rgb(136, 136, 136);
		}
		#flea_price{
			margin-top: -2px;
			font-size: 16px;
			width: 250px;
			height: 50px;
		}
		#flea_reply{
			margin-top: -3px;
			font-size: 12px;
			color: rgb(143, 143, 143);
		}
		.page_area{
			width: 800px;		
			margin: auto;
		}
		.page{
			padding: 20px;
			width: 100px;
			margin: auto;
		}
		.page button{
			whidth: 15px;
			height: 30px;
			border-radius: 2px;
			border: 0.1em solid rgb(231, 231, 231);	
        	background-color: white;
		}
		.page button:hover{
        	background-color: rgb(244, 244, 244);
        	cursor: pointer;
        }
	</style>
</head>
<body>
	<%@ include file = "../../views/common/header.jsp" %>
	
	<div id="main_wrap">
		<div id="main_banner">
			<img src="resources/css_img/stores_banner_img.png">
		</div>
		<div id="main_content">
			<div id="content_title">
				<div id="content_title_el1"><span>다양한 동네가게를 볼 수 있어요</span></div>
				<div id="content_title_el3">
					<div id="content_btn_area">
						<c:choose>
							<c:when test="${empty loginMember }">
								<!-- 로그인 안되어있으면 -->
								<button type="button" onclick="loginGo();">글쓰기</button>
							</c:when>
							<c:when test="${not empty loginMember }">
								<!-- 로그인 되어있으면 -->
								<button type="button" onclick="location.href='insertForm.bo'">글쓰기</button>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div id="content_cate">
				<div>
					<ul>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=0'">전체</button></li>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=1'">식당</button></li>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=2'">카페</button></li>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=3'">뷰티/미용</button></li>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=4'">운동</button></li>
						<li><button onclick="location.href='listForm.bo?category=2&currentPage=1&subCategory=5'">기타</button></li>
					</ul>
				</div>
			</div>
			<div id="content_el">
				<c:forEach var="b" items="${list }">
					<div class="box" id="content_el_1" onclick="location.href='boardDetail.bo?cate=2&boardNo=${b.boardNo}&memNo=${b.memNo }'">
						<div id="flea_con">
							<div id="flea_img">
								<img src="${b.attachment.atPath }">
							</div>
							<input type="hidden" id="memNo" name="memNo" value='${b.memNo }'>
							<div id="flea_text">
								<div id="flea_title"><strong>${b.title }</strong></div>
									<c:choose>
										<c:when test="${fn:length(b.content) gt 26 }">
											<div id="flea_price"><span>${fn:substring (b.content, 0,26) }</span></div>
										</c:when>
										<c:when test="${fn:length(b.content) lt 26 }">
											<div id="flea_price"><span>${b.content }...</span></div>
										</c:when>
									</c:choose>
								<div id="flea_reply">조회수 ${b.count }</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="page_area">
			<div class="page">
	            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	            	<button type="button" onclick="location.href='listForm.bo?category=2&currentPage=${p }&subCategory=0'" >${p }</button>
	            </c:forEach>
			</div>
		</div>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
	
	<script>
		//로그인 안되어있는데 글쓰기 버튼 눌렀을시
		function loginGo(){
			alert('로그인이 필요합니다..');
			//로그인 모달 창 보여주기
			$('#exampleModal').modal('show');
		}
	</script>
</body>
</html>