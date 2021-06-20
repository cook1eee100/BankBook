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
	<jsp:include page="header.jsp" />
	<%@ include file="dbconn.jsp" %>
	<%
		String[] checkList = request.getParameterValues("check");
	
		PreparedStatement pstmt=null;
		String sql =null;
		
		try {
			
			if (checkList!=null){
				for (int i=0; i<checkList.length;i++){
					int no = Integer.parseInt(checkList[i]);
					sql = "delete from moneynote where no = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
				}
			}
			response.sendRedirect("delnote.jsp");
		} catch (SQLException ex){
			out.println("SQLException: "+ex.getMessage());
		} finally{
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
		}

	%>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>