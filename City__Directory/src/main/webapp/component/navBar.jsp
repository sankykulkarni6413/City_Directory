<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i class="fas fa-city"></i>
		City Directory</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="addBusiness.jsp"><i class="far fa-building"></i> Add
					Business</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="viewBusiness.jsp"><i class="fas fa-eye"></i> View
					Directory</a></li>
			
			<li class="nav-item active"><a class="nav-link"
				href="allDirectory.jsp"><i class="fas fa-eye"></i> City Directory</a></li>

		</ul>
			<%User user =(User)session.getAttribute("user"); 
			if (user==null)
			{%>
			<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="fas fa-user"></i> Login</a> <a href="register.jsp"
				class="btn btn-warning ml-2"><i class="fas fa-address-card"></i>
				Register Business</a>
		</form>
				
			<%}
			else
			{%>
			<form class="form-inline my-2 my-lg-0">
			 <button class="btn btn-success"><%=user.getName() %></button>
			 <a data-toggle="modal" data-target="#exampleModalCenter" class = "btn btn-warning ml-2">Logout</a>
		</form>
			<%}
		%>
		
	</div>
	<!-- Log Out Popup -->
	


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Do You Want to Logout from City Directory ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <a href="logout" type="button" class="btn btn-primary" >Yes</a>
      </div>
    </div>
  </div>
</div>
</nav>