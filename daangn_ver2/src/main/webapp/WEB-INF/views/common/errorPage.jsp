<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<script>
		$(function(){
			alert("${errorMsg}");
			location.href="index.jsp";
		})
	</script>
	
	<jsp:include page="footer.jsp"/>	
</body>
</html>