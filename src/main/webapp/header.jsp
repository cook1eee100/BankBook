<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sessionId=(String) session.getAttribute("sessionId");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">���� ���� ����</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="writenote.html">����/���� ���</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="shownote.jsp">��� ��ȸ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="confirmnote.jsp">��� Ȯ��</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="modnote.jsp">��� ���� �� ����</a>
        </li>
      </ul>
      <c:choose>
      	<c:when test="${empty sessionId}">
	      <a class="nav-link" href="#">�α���</a>
	      <a class="nav-link" href="#">ȸ������</a>
	    </c:when>
	    <c:otherwise>
	      [<%=sessionId %>��]
	      <a class="nav-link" href="#">�α׾ƿ�</a>
	      <a class="nav-link" href="#">ȸ������ ����</a>
	    </c:otherwise>
	  </c:choose>
    </div>
  </div>
</nav>