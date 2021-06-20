<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css?after">
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="dbconn.jsp" %>
	
	<div class="footer-1">
	  <h1>수입지출 기록 검색</h1>
	</div>
	<form action="shownote.jsp" method="POST">
	  <div class="divbox-1">
        <input type="radio" class="form-check-input" name="search1" value="inout" id="id1" checked> <label for="id1">수입/지출 (in / out 으로 검색)</label>
        <input type="radio" class="form-check-input" name="search1" value="note" id="id2"> <label for="id2">내용</label>
        <input type="radio" class="form-check-input" name="search1" value="iodate" id="id3"> <label for="id3">수입/지출일 (0000.00.00 형식)</label>
      </div>
      <div class="divbox-2">
        <div class="d-flex">
          <input class="form-control me-sm-2" name="search2" type="text" placeholder="Search">
          <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </div>
	  </div>
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
<script>

</script>


</html>