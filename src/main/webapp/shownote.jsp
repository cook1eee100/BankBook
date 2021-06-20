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
	

	<div class="footer-1">
	  <table class="table table-hover" align="center">
		<thead>
		  <tr>
		    <th scope="col">번호</th>
		    <th scope="col">이메일</th>
		    <th scope="col">용돈</th>
		    <th scope="col">수입/지출</th>
		    <th scope="col">내용</th>
		    <th scope="col">수입/지출일</th>
		    <th scope="col">메모</th>
		    <th scope="col">변경가능여부</th>
		  </tr>
		</thead>
		
	<%
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String sql=null;
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		
		if (search1.equals("total")){
			sql = "select * from moneynote";
		} else if (search1.equals("inout")){
			sql = "select * from moneynote where in_out=?";
		} else if (search1.equals("note")){
			sql = "select * from moneynote where note LIKE ?";
			search2 = String.format("%%%s%%", search2);
		} else if (search1.equals("iodate")){
			sql = "select * from moneynote where iodate=?";
		}
		
		
		
		try{
			if (search2.equals("")){
				sql = "select * from moneynote";
				pstmt=conn.prepareStatement(sql);
			}
			else{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, search2);
			}
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String email = rs.getString("email");
				int money = rs.getInt("money");
				String inout = rs.getString("in_out");
				String note = rs.getString("note");
				String iodate = rs.getString("iodate");
				String memo = rs.getString("memo");
				String confirm = rs.getString("confirm");
	%>
				<tbody>
				  <tr class="table-secondary">
				    <th scope="row"><%=no %></th>
				    <td><%=email %></td>
				    <td><%=money %></td>
				    <td><%=inout %></td>
				    <td><%=note %></td>
				    <td><%=iodate %></td>
				    <td><%=memo %></td>
				    <td><%=confirm %></td>
				  </tr>
				</tbody>
					
				
	<%		
			}
		} catch (SQLException ex){
			out.println("실패");
			out.println("SQLException: " + ex.getMessage());
		}finally{
			if (rs!=null)
				rs.close();
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
		}
	%>
	  </table>
	</div>
	
	
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>