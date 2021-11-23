<%@page import="java.util.List"%>
<%@page import="com.entity.Business"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Businesses</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
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