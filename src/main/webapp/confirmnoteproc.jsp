<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="dbconn.jsp" %>
	<%
		String[] checkList = request.getParameterValues("check");
	
		PreparedStatement pstmt=null;
		String sql =null;
		
		try {
			
			if (checkList!=null){
				for (int i=0; i<checkList.length;i++){
					int no = Integer.parseInt(checkList[i]);
					sql = "update moneynote set confirm = ? where no = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "Y");
					pstmt.setInt(2, no);
					pstmt.executeUpdate();
				}
			}
			response.sendRedirect("confirmnote.jsp");
		} catch (SQLException ex){
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