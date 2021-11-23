<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Business Registration</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #f7faf8">
	<%@include file="component/navBar.jsp"%>

	<div class="container-fluid ">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<form action="register" method="post">
							<h4 class="text-center text-info">Business Registration</h4>

							<%
							String sucssMsg = (String) session.getAttribute("sucssMsg");
							String errorMsg = (String) session.getAttribute("errorMsg");

							if (sucssMsg != null) {
							%>
							<p class="text-success text-center"><%=sucssMsg%></p>
							<%
							session.removeAttribute("sucssMsg");
							}
							if (errorMsg != null) {
							%>
							<p class="text-danger text-center"><%=errorMsg%></p>
							<%
							session.removeAttribute("errorMsg");
							}
							%>

							<div class="form-group">
								<label for="exampleInputEmail1">Business Owner Name</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>