<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="layout-1">
		<div class="container">
			<h1 class="display-5">�뵷�� ���԰� ������ �����ϴ� �������Դϴ�.</h1>
		</div>
	</div>

	<c:choose>
		<c:when test="${empty sessionId}">
			<div class="container">
				<div align="center">
					<div class="col-md-4">
						<h5>�α��� �� ����ϼ���.</h5>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h5><%=sessionId%>�� ȯ���մϴ�.</h5>
		</c:otherwise>
	</c:choose>


	<%@ include file="footer.jsp"%>
</body>
</html>