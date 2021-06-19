<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sessionId=(String) session.getAttribute("sessionId");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">개인 재정 관리</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="writenote.html">수입/지출 기록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="shownote.jsp">기록 조회</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="confirmnote.jsp">기록 확정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="modnote.jsp">기록 변경 및 삭제</a>
        </li>
      </ul>
      <c:choose>
      	<c:when test="${empty sessionId}">
	      <a class="nav-link" href="#">로그인</a>
	      <a class="nav-link" href="#">회원가입</a>
	    </c:when>
	    <c:otherwise>
	      [<%=sessionId %>님]
	      <a class="nav-link" href="#">로그아웃</a>
	      <a class="nav-link" href="#">회원정보 수정</a>
	    </c:otherwise>
	  </c:choose>
    </div>
  </div>
</nav>