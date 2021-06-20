<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css?after" />
<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="footer-1">
		<div class="container" align="center">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form action="processLoginMember.jsp" method="post">
				<div>
					<label for="inputUserName" >User Name</label> 
					<input type="text" class="input-1" placeholder="ID" name="id" required autofocus>
				</div>
				<div>
					<label for="inputPassword" >Password</label> 
					<input type="password" class="input-1" placeholder="Password" name="password" required>
				</div>
				<br>
				<button class="btn btn btn-primary btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>