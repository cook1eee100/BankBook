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
	
	<div class="footer-1" >
      <select class="form-select form-select-sm" id="">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
        <input type="text" class="form-control form-control-sm" id="" placeholder="�˻�����">
    </div>
	
	<div class="footer-1">
	  <table class="table table-hover" align="center">
		<thead>
		  <tr>
		    <th scope="col">��ȣ</th>
		    <th scope="col">�̸���</th>
		    <th scope="col">�뵷</th>
		    <th scope="col">����/����</th>
		    <th scope="col">����</th>
		    <th scope="col">����/������</th>
		    <th scope="col">�޸�</th>
		    <th scope="col">���氡�ɿ���</th>
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
				  </tr>
				</tbody>
					
				
	<%		
			}
		} catch (SQLException ex){
			out.println("����");
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