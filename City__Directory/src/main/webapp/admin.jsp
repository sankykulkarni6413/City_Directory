<%@page import="com.entity.Business"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
<%@include file="component/navBar.jsp"%>
<div class="container">
		<div class="row p-4">

			<%
			BusinessDAO dao = new BusinessDAO(DbConnect.getConn());
			List<Business> business = dao.getDirectory();

			for (Business b : business) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h5><%=b.getBname()%></h5>
						<p><%=b.getOname()%></p>
						<p><%=b.getPhone()%></p>
						<p><%=b.getB_type()%></p>
						<p><%=b.getAddress()%></p>
						<p><%=b.getCity()%></p>
						<p><%=b.getPin()%></p>
						
						<div class="text-center">
							<a href="editBusiness.jsp?bid=<%=b.getId()%>"
								class="btn btn-primary btn-sm">Edit</a> <a
								href="delete?bid=<%=b.getId()%>" class="btn btn-warning btn-sm">Delete</a>
						</div>
						<div class="text-center m-3">
							<a href="editBusiness.jsp?bid=<%=b.getId()%>"
								class="btn btn-danger btn-sm">Reject</a> <a
								href="delete?bid=<%=b.getId()%>" class="btn btn-success btn-sm">Approve</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>


	</div>
	

</body>
</html>