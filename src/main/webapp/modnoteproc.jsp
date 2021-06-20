<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
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
	
	

	<%
		String pNo = request.getParameter("no");
		String email = request.getParameter("email");
		String pMoney = request.getParameter("money");
		String inout = request.getParameter("inout");
		String note = request.getParameter("note");
		String iodate = request.getParameter("iodate");
		String memo = request.getParameter("memo");
		String confirm = request.getParameter("confirm");
		
		int no = Integer.parseInt(pNo);
		int money = Integer.parseInt(pMoney);
		
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "update moneynote set money=?, in_out=?, note=?, iodate=?, memo=? where no = ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, money);
			pstmt.setString(2, inout);
			pstmt.setString(3, note);
			pstmt.setString(4, iodate);
			pstmt.setString(5, memo);
			pstmt.setInt(6, no);
			pstmt.executeUpdate();
	
			response.sendRedirect("modnote.jsp");
		} catch(SQLException ex){
			out.println("실패");
			out.println("SQLException: "+ex.getMessage());
		} finally{
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
		}
	%>
	<%@ include file="footer.jsp" %>
</body>
</html>