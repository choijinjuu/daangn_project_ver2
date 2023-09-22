<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#job{
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
			height: 120px;
			width: 100%;
		}
		#content_title>div, #content_title_el2>div{
			float: left;
		}
		#content_title_el1{
			height: 100%;
			width: 43%;
		}
		#content_title_el1 span{
			font-weight: 600;
			font-size:32px;
			line-height: 5.3;
			margin-left: 25px;
			cursor: default;
		}
		#content_title_el2{
			height: 100%;
			width: 40%;
		}
		#content_title_el3{
			height: 100%;
			width: 17%;
		}
		#flea_search{
			height: 30px;
			width: 180px;
			margin-top: 75px;
			margin-left: 60px;
		}
		#flea_search input{
			width: 100%;
			height: 100%;
			outline: none;
			border: 1px solid rgb(129, 129, 129);
		}
		#flea_btn{
			width: 35px;
			height: 30px;
			margin-top: 75px;
			margin-left: 10px;
		}
		#flea_btn button{
			width: 100%;
			height: 100%;
		}
		#content_btn_area{
			width: 70px;
			height: 28px;
			margin-top: 75px;
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
		/* 버튼 기본 CSS */
		.btn_el button{
			border-radius: 10px;
			border: 0.1em solid black;
        	background-color: white;
		}
		.btn_el button:hover{
        	background-color: rgb(244, 244, 244);
        	cursor: pointer;
        }
		#content_el{
			margin-top: 15px;
			width: 100%;
			/* 단 나누기 */
			display: grid;
			grid-template-columns: repeat(2, 1fr);
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
			float: left !important;
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
		#flea_title span{
			font-size: 18px;
			color: black;
		}
		#flea_price{
			padding-top: 5px;
			font-size: 15px;
			width: 250px;
			height: 50px;
			color: rgb(129, 129, 129);
		}
		#flea_reply{
			margin-top: -25px;
			font-size: 15px;
			color: rgb(129, 129, 129);
		}
		#list_empty{
			margin-left: 250px;
			width: 200px;
			font-size: 18px;
			color: rgb(129, 129, 129);
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
			<img src="resources/css_img/jobs_banner_img.png">
		</div>
		<div id="main_content">
			<form action="listForm.bo" method="GET">
				<div id="content_title">
					<div id="content_title_el1"><span>인기 당근알바</span></div>
					<div id="content_title_el2">
						<div id="flea_search">
							<input type="hidden" name="category" value="3">
							<input type="hidden" name="currentPage" value="1">
							<input type="hidden" name="subCategory" value="1">
							<input type="text" name="search" placeholder="주소로 검색">
						</div>
						<div class="btn_el" id="flea_btn">
							<button><img src="resources/css_img/search_img.png" style="width: 70%; height: 70%"></button>
						</div>
					</div>
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
			</form>
			<div id="content_el">
				<c:forEach var="b" items="${list }">
					<div class="box" id="content_el_1" onclick="location.href='boardDetail.bo?category=3&boardNo=${b.boardNo }&memNo=${b.memNo }'">
						<div id="flea_con">
							<div id="flea_img">
								<img src="${b.attachment.atPath }">
							</div>
							<div id="flea_text">
								<c:choose>
									<c:when test="${fn:length(b.title) gt 14 }">
										<div id="flea_title"><span><strong>${fn:substring (b.title, 0, 14) }...</strong></span></div>
									</c:when>
									<c:otherwise>
										<div id="flea_title"><span><strong>${b.title }</strong></span></div>								
									</c:otherwise>
								</c:choose>
								<div id="flea_price"><span>${b.address }</span></div>
								<div id="flea_reply">조회수 ${b.count }</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:choose>
					<c:when test="${empty list }">
						<div id="list_empty">
							<span>검색 결과가 없습니다.</span>
						</div>
					</c:when>
				</c:choose>
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