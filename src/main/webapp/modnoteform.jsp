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
		String ch = request.getParameter("check");
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql =null;
		
		try {
			int no = Integer.parseInt(ch);
			sql = "select * from moneynote where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				no = rs.getInt("no");
				String email = rs.getString("email");
				int money = rs.getInt("money");
				String inout = rs.getString("in_out");
				String note = rs.getString("note");
				String iodate = rs.getString("iodate");
				String memo = rs.getString("memo");
				String confirm = rs.getString("confirm");
			%>
			
			<h1 style="padding-top:2rem; padding-left:2rem;">수입지출 기록 변경</h1>
				<div class="layout-2">
					<form action="modnoteproc.jsp" method="POST">
						<label class="form-label mt-4">번호</label>
						<input type="text" class="form-control" name="no" value="<%=no%>" readonly="">
						<label class="form-label mt-4">이메일</label>
						<input type="email" class="form-control" name="email" value="<%=email%>" readonly="">
						<label class="form-label mt-4">용돈</label>
						<input type="text" class="form-control" name="money" value="<%=money%>">
						<label class="form-label mt-4">수입/지출</label>
						<div class="form-check">
					      <label class="form-check-label">
					        <input type="radio" class="form-check-input" name="inout" value="in">in
					      </label>
					    </div>
					    <div class="form-check">
					      <label class="form-check-label">
					        <input type="radio" class="form-check-input" name="inout" value="out">out
					      </label>
					    </div>
						<label class="form-label mt-4">내용</label>
						<input type="text" class="form-control" name="note" value="<%=note%>">
						<label class="form-label mt-4">수입지출일</label>
						<input type="text" class="form-control" name="iodate" value="<%=iodate%>">
						<small class="form-text text-muted"> 입력 형식 : ex) 0000.00.00 </small><br>
						<label class="form-label mt-4">메모</label>
			      		<textarea class="form-control" name="memo" rows="3"><%=memo %></textarea>
			      		<label class="form-label mt-4">변경여부</label>
						<input type="text" class="form-control" name="confirm" value="<%=confirm%>" readonly="">
					    <br>
					    <button type="submit" class="btn btn-primary">변경</button>
					    <button type="reset" class="btn btn-primary">리셋</button>
					</form>
				</div>	
	
			<%
			}
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