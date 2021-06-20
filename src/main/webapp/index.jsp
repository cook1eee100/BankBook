<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css?after">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="layout-1">
		<div class="container" align="center">
			<h1 class="display-5">용돈의 수입과 지출을 관리하는 페이지입니다.</h1>
		</div>
	</div>

	<c:choose>
		<c:when test="${empty sessionId}">
			<div class="container">
				<div align="center">
					<div class="col-md-4">
						<h5>로그인 후 사용하세요.</h5>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container">
				<div align="center">
					<div class="col-md-4">
						<h5><%=sessionId%>님 환영합니다.</h5>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


	<%@ include file="footer.jsp"%>
</body>
</html>