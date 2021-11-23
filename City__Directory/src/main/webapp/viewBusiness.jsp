<%@page import="com.entity.Business"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>City Directory</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%@include file="component/navBar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please..");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String succMsg = (String) session.getAttribute("succMsg");
	String failedMsg = (String) session.getAttribute("errorMsg");
	if (failedMsg != null) {
	%>
	<p class="text-danger text-center"><%=failedMsg%></p>
	<%
	session.removeAttribute("failedMsg");
	}

	if (succMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=succMsg%></div>

	<%
	session.removeAttribute("succMsg");
	}
	%>
	<div class="container">
		<div class="row p-4">

			<%
			if (user != null) {
				BusinessDAO dao = new BusinessDAO(DbConnect.getConn());
				List<Business> business = dao.getAllBusiness(user.getId());

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
								class="btn btn-primary btn-sm" hidden>Edit</a> <a
								href="delete?bid=<%=b.getId()%>" class="btn btn-warning btn-sm" hidden>Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}

			}
			%>

		</div>


	</div>

	


</body>
</html>