<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form action="confirmnoteproc.jsp" method="POST">
	<div class="footer-1">
	  <table class="table table-hover">
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
		    <th scope="col">Ȯ��</th>
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
				        <c:choose>
				          <c:when test="${confirm eq 'Y'}">
				            <input name="check" class="form-check-input" type="checkbox" value="<%=no%>" disabled="">
				          </c:when>
				          <c:otherwise>
				            <input name="check" class="form-check-input" type="checkbox" value="<%=no%>">
				          </c:otherwise>
				        </c:choose>  
				      </div>
				    </td>
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
	<div class="footer-1" align="center">
	  <button type="submit" class="btn btn-primary">����</button>
	  <button type="reset" class="btn btn-primary">����</button>
	</div>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>