<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #f7faf8">
	<%@include file="component/navBar.jsp"%>


	<div class="container-fluid ">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">

						<%
						String invalidMsg = (String) session.getAttribute("invalidMsg");
						if (invalidMsg != null) {
						%>
						<p class="text-danger text-center"><%=invalidMsg%></p>
						<%
						}
						session.removeAttribute("invalidMsg");
						%>
						<%
						String logMsg = (String) session.getAttribute("logMsg");
						if (logMsg != null) {
						%>
						<p class="text-success text-center"><%=logMsg%></p>
						<%
						}
						session.removeAttribute("logMsg");
						%>

						<form action="login" method="post">
							<h4 class="text-center text-info">Login</h4>



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
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>