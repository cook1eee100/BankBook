<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	Connection conn=null;
	
	String url="jdbc:mysql://localhost:3306/moneyweb";
	String user="root";
	String password="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url, user, password);
%>
