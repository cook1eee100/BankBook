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
	<form action="delnoteproc.jsp" method="POST">
	<div class="footer-1">
	  <table class="table table-hover">
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
		    <th scope="col">삭제</th>
		  </tr>
		</thead>
		
	<%
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try{
			String sql = "select * from moneynote";
			pstmt=conn.prepareStatement(sql);
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
				    <td>
				      <div class="form-check">			
				        <input name="check" class="form-check-input" type="checkbox" value="<%=no%>">
				      </div>
				    </td>
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
	<div class="footer-1" align="center">
	  <button type="submit" class="btn btn-primary">삭제</button>
	  <button type="reset" class="btn btn-primary">리셋</button>
	</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>