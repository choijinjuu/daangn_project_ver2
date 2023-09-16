<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#flea{
            color: rgb(246, 117, 37) !important;
        }
		#fleaDe_wrap{
			width: 800px;
			margin: auto;
		}
		.flea_all{
			width: 85%;
			margin: auto;
		}
		#fleaDe_img_area{
			height: 505px;
			margin-top: 25px;
		}
		#fleaDe_img_area img{
			width: 100%;
			height: 100%;
			border-radius: 20px;
		}
		#fleaDe_title_area{
			height: 80px;
		}
		#fleaDe_title_area>div{
			float: left;
		}
		#flea_profile_area{
			height: 50px;
			width: 8%;
			margin-top: 15px;
			border-radius: 100px;
		}
		#flea_profile_area img{
			width: 100%;
			height: 100%;
			border-radius: 100px;
		}
		#flea_id_area{
			height: 45px;
			margin-top: 21px;
			margin-left: 10px;
		}
		#flea_id{
			font-size: 15px;
		}
		#flea_address{
			font-size: 13px;
			color: rgb(135, 135, 135);
			margin-top: 2px;
		}
		#flea_btn_area{
			margin-left: 410px;
			margin-top: 35px;
		}
		#flea_btn_area button{
			border-radius: 3px;
			border: 0.1em solid rgb(135, 135, 135);
			color: rgb(135, 135, 135);
        	background-color: white;
		}
		#flea_btn_area button:hover{
			background-color: rgb(235, 235, 235);
			color: rgb(75, 75, 75);
			cursor: pointer;
		}
		#flea_title{
			height: 58px;
			width: 680px;
			margin: auto;
			font-size: 19px;
			line-height: 4.5;
		}
		#flea_cate{
			height: 23px;
			font-size: 14px;
			color: rgb(135, 135, 135);
		}
		#flea_money{
			height: 30px;
		}
		#flea_all_el2 pre{
			width: 680px;
			margin: auto;
			padding-bottom: 20px;
			font-size: 17px;
			color: rgb(55, 55, 55);
			white-space: pre-wrap;
		}
		#reply_delete_area{
			float: right;
			margin-top: 5px;
		}
		#reply_delete_area button{
			border: 0.5px solid rgb(129, 129, 129);
			border-radius: 5px;
		}
		#reply_delete_area button:hover{
			background-color: rgb(235, 235, 235);
			cursor: pointer;
		}
		#reply_area{
			height: 110px;
			width: 660px;
			margin: auto;
		}
		#reply_area_1{
			width: 650px;
			margin: auto;
			border-bottom: 0.5px solid rgb(129, 129, 129);
		}
		#reply_area_1 pre{
			padding-left: 10px;
		}
		#writer_date{
			font-size: 13px;
			margin-left: 10px;
			padding: 0 0 5px 0;
			color: rgb(129, 129, 129);
		}
		#reply_write{
			border: 1px solid black;
			padding: 15px;
			margin: auto;
			width: 640px;
			height: 160px;
			border: 0.5px solid rgb(129, 129, 129);
		}
		.writer_profile{
			height: 35px;
		}
		.writer_profile>div{
			float: left;
		}
		#witer_img{
			width: 40px;
			height: 35px;
		}
		#witer_img img{
			border-radius: 50px;
			width: 100%;
			height: 100%;
		}
		.writer_profile button{
			background-color: white;
			cursor: pointer;
			border: 0px;
		}
		.writer_profile span{
			margin-left: 5px;
			line-height: 2.3;
			font-size: 15px;
		}
		#reply_write textarea{
			width: 635px;
			height: 80px;
			border: 0px;
			margin-top: 3px;
			resize: none;
			padding: 5px;
		}
		#writer_btn{
			border-top: 1px solid rgb(129, 129, 129);
		}
		#writer_btn button{
			margin-top: 5px;
			height: 30px;
			float: right;
			background-color: white;
			border: 0.5px solid rgb(129, 129, 129);
			border-radius: 5px;
		}
		#writer_btn button:hover{
			background-color: rgb(235, 235, 235);
			cursor: pointer;
		}
		#reply_secret{
			margin-right: 5px;
		}
		#secret_img{
			width: 20px;
			height: 20px;
		}
	</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>

	<div id="fleaDe_wrap">
		<div class="flea_all" id="fleaDe_img_area">
			<img src="${b.attachment.atPath }">
		</div>
		<div class="flea_all" id="fleaDe_title_area">
			<div id="flea_profile_area"><img src="${b.member.profileImg }"></div>
			<div id="flea_id_area">
				<div id="flea_id"><a><strong>${b.member.nickName }</strong></a></div>
				<div id="flea_address">${b.member.address }</div>
			</div>
			<div id="flea_btn_area">
				<%-- <%if (loginMember!=null && loginMember.getMemberId().equals(b.getWriter())) {%> --%>
					<!-- 로그인 되어있으며 게시글 작성자일때 -->
					<%-- <button type="button" onclick="location.href='<%=contextPath%>/update.bo?category=1&boardNo=<%=b.getBoardNo()%>'">수정</button>
					<button type="button" onclick="boardDelete();">삭제</button>				
				<%}else if (loginMember!=null && !loginMember.getMemberId().equals(b.getWriter()) || loginMember == null) {%> --%>
					<!-- 로그인 되어있지만 게시글 작성자가 아닐때
						또는 로그인 안되어있을때 -->
					<button style="visibility: hidden;">수정</button>
					<button style="visibility: hidden;">삭제</button>
				<%-- <%}%> --%>
			</div>
		</div>
		<hr style="border: 0.1px solid rgb(224, 224, 224); width: 680px;">
		<div class="flea_all" id="fleaDe_text_area">
			<div>
				<div id="flea_title"><strong>${b.title }</strong></div>
				<div id="flea_cate">${b.subCategory }  ∙ 조회수 ${b.count }</div>
				<div id="flea_money"><strong><fmt:formatNumber value="${b.price }" pattern="#,###"/>원</strong></div>
			</div>
			<div id="flea_all_el2">
				<pre>${b.content }</pre>
			</div>
		</div>
		<hr style="border: 0.1px solid rgb(224, 224, 224); width: 680px;">
		
		<%-- <%for (Reply r : rlist) {%>
			<div id='reply_area'>
				<div id='reply_area_1'>
					<input type='hidden' value="<%=r.getReplyNo()%>">
					<div class='writer_profile'>
						<div id='witer_img'>
							<img src='<%=r.getProfileImg()%>'>
						</div>
						<div>
							<button><span><strong><%=r.getWriter()%></strong></span></button>
							<%if (r.getSecret()==2) {%>
								<img id="secret_img" src="resources/css_img/key_img.png">
							<%} %>
						</div>
						<!-- 글 작성자 이거나 댓글 작성자일떄 -->
						<%if (loginMember!=null && r.getMemberNo()==loginMember.getMemberNo() || loginMember!=null && b.getMemberNo()==loginMember.getMemberNo()) {%>
							<div id='reply_delete_area'>
								<button type='button' onclick="location.href='<%=contextPath%>/reply.re?cate=1&replyNo=<%=r.getReplyNo()%>&boardNo=<%=b.getBoardNo()%>&memNo=<%=b.getMemberNo()%>'">삭제</button>
							</div>
						<%}%>
					</div>
					<div>
						<%if ((loginMember!=null && r.getSecret()==2 && loginMember.getMemberNo()==r.getMemberNo())
								|| (loginMember!=null && r.getSecret()==2 && loginMember.getMemberNo()==b.getMemberNo())) {%>
							<!-- 로그인 되어있을때 본인이 작성한 댓글 or 게시글 작성자는 비밀댓글 보이도록 -->
							<pre><%=r.getContent() %></pre>
						<%} else if(r.getSecret()==1){%>
							<!-- 일반 댓글은 보이도록 -->
							<pre><%=r.getContent() %></pre>
						<%} else {%>
							<pre>비밀댓글 입니다.</pre>
						<%} %>
					</div>
					<div id='writer_date'>
						<span><%=r.getCreateDate() %></span>
					</div>
				</div>
			</div>
		<%} %>
		<div id=fleaDe_reply>
			<div id="reply_write">
				<%if (loginMember!=null) {%>
					<div class="writer_profile">
						<div id="witer_img">
							<img src="<%=loginMember.getProfile_img()%>">
						</div>
						<div><button><span><strong><%=loginMember.getMemberId() %></strong></span></button></div>
					</div>				
				<%}else {%>
					<div class="writer_profile">
						<div id="witer_img">
							<img src="resources/css_img/noLoginMem.png">
						</div>
						<div><button><span><strong>로그인을 해주세요!</strong></span></button></div>
					</div>
				<%} %>
				<div>
					<textarea name="replyContent" id="replyContent" placeholder="우리모두 훈훈해지는 댓글을 남겨주세요!"></textarea>
				</div>
				<div id="writer_btn">
					<%if (loginMember==null) {%>
						<!-- 로그인하지 않은 회원은 댓글버튼 1개만 보여주기 -->
						<button type="button" onclick="insertReply()">댓글쓰기</button>
					<%}else if(loginMember!=null) {%>
						<!-- 로그인한 회원은 버튼 두개 다 보여주기 -->
						<button type="button" onclick="insertReply()">댓글쓰기</button>
						<button id="reply_secret" onclick="insertReply2()">비밀댓글</button>
					<%} %>
				</div>
			</div>
		</div> --%>
	</div>
	
	<%@ include file = "../common/footer.jsp" %>
	
	<%-- <script>
		//게시물 삭제
		function boardDelete(){
			var result = confirm("게시물을 정말 삭제하시겠습니까?");
			
			if(result){
				alert("삭제되었습니다.");
				location.href = "<%=contextPath%>/delete.bo?cate=1&boardNo=<%=b.getBoardNo()%>";
			}else{
				alert("삭제가 취소되었습니다.");
			}
		}
		
		//댓글 목록
		 function selectReview(){
	      		$.ajax({
	      			url : "reply.re",
	      			data : {boardNo : <%=b.getBoardNo()%>},
	      			type : "get",
	      			success : function(rlist){
						var result = "";
	      					console.log(rlist)
							for(var i in rlist){
								result +="<div id='reply_area'>"
										+"<div id='reply_area_1'>"
										+"<div class='writer_profile'>"
										+"<div id='witer_img'>"
										+"<img src=''>"
										+"</div>"
										+"<div><button><span><strong>"+rlist[i].memberNo+"</strong></span></button></div>"
										+"<div id='reply_delete_area'>"
										+"<button type='button' onclick='replyDelete()'>삭제</button>"
										+"</div>"
										+"</div>"
										+"<div>"
										+"<pre>"+rlist[i].content+"</pre>"
										+"</div>"
										+"<div id='writer_date'>"
										+"<span>"+rlist[i].createDate+"</span>"
										+"</div>"
										+"<input type='hidden' value="+rlist[i].replyNo+">"
										+"</div>"
										+"</div>";
							}
							
							$("#fleaDe_text_area").append(result);
	      			}
	      		});
	      };
		
		//댓글 목록 불러오기
		$(function(){
      		selectReview();
      	});
		
		//댓글 등록
		//로그인 되어있다면
		<%if (loginMember!=null) {%>
			//일반댓글 등록
	    	function insertReply(){
				$.ajax({
					url : "reply.re?secret=1",
	        		data : {memberNo : <%=loginMember.getMemberNo()%>,
	        				boardNo : <%=b.getBoardNo()%>,
	        				replyContent : $("#replyContent").val()
	        				},
	        		type : "post",
	        		success : function(result){
	        				if(result>0){
			        			alert("댓글 작성이 완료되었습니다!");
			        			$("#replyContent").val("");
	        					
			        			selectReview();
			        			
			        			location.reload();
	        				}else{
	        					alert("댓글을 작성해주세요.");
	        				}
		        			
		        		}
	        		});
	        	}
	    	
	    	//비밀댓글 등록
	    	function insertReply2(){
				$.ajax({
					url : "reply.re?secret=2",
	        		data : {memberNo : <%=loginMember.getMemberNo()%>,
	        				boardNo : <%=b.getBoardNo()%>,
	        				replyContent : $("#replyContent").val()
	        				},
	        		type : "post",
	        		success : function(result){
	        				if(result>0){
			        			alert("댓글 작성이 완료되었습니다!");
			        			$("#replyContent").val("");
	        					
			        			selectReview();
			        			
			        			location.reload();
	        				}else{
	        					alert("댓글을 작성해주세요.");
	        				}
		        		}
	        		});
	        	}
	      <%}else {%>
				function insertReply(){
			      	alert("로그인 후 댓글 작성이 가능합니다.");
			      	location.href='<%=contextPath%>/login.me';
		    }
	      <%}%>
	</script> --%>
</body>
</html>