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
	<%@ include file="header.jsp"%>
	<%@ include file="dbconn.jsp" %>
	<%
		String email = request.getParameter("email");
		String pMoney = request.getParameter("money");
		String inout = request.getParameter("inout");
		String note = request.getParameter("note");
		String iodate = request.getParameter("iodate");
		String memo = request.getParameter("memo");
		
		int money = Integer.parseInt(pMoney);
		
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into moneynote(email, money, in_out, note, iodate, memo) values(?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, money);
			pstmt.setString(3, inout);
			pstmt.setString(4, note);
			pstmt.setString(5, iodate);
			pstmt.setString(6, memo);
			pstmt.executeUpdate();
	%>
	  <div class="footer-1">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">이메일</th>
		      <th scope="col">용돈</th>
		      <th scope="col">수입/지출</th>
		      <th scope="col">내용</th>
		      <th scope="col">수입/지출일</th>
		      <th scope="col">메모</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="table-success">
		      <td><%=email %></td>
		      <td><%=money %></td>
		      <td><%=inout %></td>
		      <td><%=note %></td>
		      <td><%=iodate %></td>
		      <td><%=memo %></td>
		    </tr>
		  </tbody>
		</table>
	  </div>
	<%
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
	
	
	
	<%@ include file="footer.jsp"%>
</body>
</html>
