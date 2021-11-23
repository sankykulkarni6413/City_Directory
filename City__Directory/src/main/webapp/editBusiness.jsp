<%@page import="com.entity.Business"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Business Details</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navBar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please..");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid ">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-info">Update Business Details</h4>
						<%
						String failedMsg = (String) session.getAttribute("errorMsg");

						if (failedMsg != null) {
						%>
						<p class="text-danger text-center"><%=failedMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						<form action="update" method="post">
							<%
							int bid = Integer.parseInt(request.getParameter("bid"));
							BusinessDAO dao = new BusinessDAO(DbConnect.getConn());
							Business b = dao.getBusinessByID(bid);
							%>
							<input type="hidden" value="<%=bid%>" name="bid">
							<div class="form-group">
								<label for="exampleInputEmail1">Business Name</label> <input
									value="<%=b.getBname()%>" name="bname" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Business Owner Name</label> <input
									value="<%=b.getOname()%>" name="oname" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile/Phone No.</label> <input
									value="<%=b.getPhone()%>" name="phone_no" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Business Type</label> <input
									value="<%=b.getB_type()%>" name="btype" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Ex. Grocery">
							</div>
							<div class="form-group">
								<label for="inputAddress">Business Address</label> <input
									value="<%=b.getAddress()%>" name="b_address" type="text"
									class="form-control" id="inputAddress"
									placeholder="123 Main Road Nanded">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input name="city"
										value="<%=b.getCity()%>" type="text" class="form-control"
										id="inputCity">
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Pin Code</label> <input name="pin"
										value="<%=b.getPin()%>" type="text" class="form-control"
										id="inputZip">
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update
									Details</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>