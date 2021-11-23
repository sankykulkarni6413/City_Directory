
<%@page import= "java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/city.jpg");
	width: 100%;
	height: 100vh;
	max-width: 100%;
	max-height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
<div class="container">
  <h1 style="display:inline">City Directory</h1>
  <h5 >For all type of Business</h5>
  
</div>

    <%@include file="component/navBar.jsp"%>
	<%
		Connection conn = DbConnect.getConn();
		out.print(conn);
	%>
	<div class="container back-img  text-center">
		<br>
		<h1>WelCome to City Directory</h1>
		
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>