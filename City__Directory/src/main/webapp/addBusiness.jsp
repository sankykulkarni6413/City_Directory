<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Business</title>
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
						<h4 class="text-center text-info">Add Business Details</h4>
						<%
						String succMsg = (String) session.getAttribute("sucssMsg");
						String failedMsg = (String) session.getAttribute("errorMsg");

						if (succMsg != null) {
						%>
						<p class="text-success text-center"><%=succMsg%></p>
						<%
						session.removeAttribute("succMsg");
						}
						if (failedMsg != null) {
						%>
						<p class="text-danger text-center"><%=failedMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						<form action="addBusiness" method="post">
							<%
							if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="userid">
							<%
							}
							%>

							<div class="form-group">
								<label for="exampleInputEmail1">Business Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Business Owner Name</label> <input
									name="oname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile/Phone No.</label> <input
									name="phone_no" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<!-- <div class="form-group">
								<label for="exampleInputEmail1">Business Type</label> <input
									name="btype" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Ex. Grocery" required>
							</div>
							 -->
							 <div class="form-row">
							<div class="form-group col-md-6">
								<label for="SelectCity" >Business Type</label> <select
									class="form-control" placeholder="Choose City" name="btype" aria-describedby="emailHelp id="exampleFormControlSelect1">
									<option value="" disabled selected>Select your business type</option>
									<option>Grocery</option>
									<option>Kirana Shop</option>
									<option>Pet Shop</option>
									<option>Cloth Shop</option>
									<option>Fertilizer</option>
									<option>Gift Shop</option>
									<option>Hardware</option>
									
									
								</select>
							</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Business Address</label> <input
									name="b_address" type="text" class="form-control"
									id="inputAddress" placeholder="123 Main Road Nanded" required>
							</div>
							<!-- <div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input name="city"
										type="text" class="form-control" id="inputCity" required>
								</div> -->
							<div class="form-row">
							<div class="form-group col-md-6">
								<label for="SelectCity" >Select City</label> <select
									class="form-control" name="city" id="exampleFormControlSelect1">
									<option value="" disabled selected>Choose City</option>
									<option>Islampur</option>
									<option>Nanded</option>
									<option>Pune</option>
									<option>Kolhapur</option>
									<option>Sangali</option>
								</select>
							</div>
							</div>
							<div class="form-group col-md-6">
								<label for="inputZip">Pin Code</label> <input name="pin"
									type="text" class="form-control" id="inputZip" required>
							</div>
					</div>


					<div class="form-group p-2 text-center">
						<div class="file-field text-center">
							<div class="btn btn-primary  btn-sm float-left">
								<span>Choose files</span> <input type="file">
								<p class="text-sm m-0">Upload Any Business proof (Business
									Licence, GST Return, Proof issued by any government authority)</p>
							</div>

						</div>
					</div>
					<br>

					<div class="text-center">
						<button type="submit" class="btn btn-primary m-2">Register</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>