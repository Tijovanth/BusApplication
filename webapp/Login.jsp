<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Blue Bus Application</title>
</head>
<body>
<%
	String name = (String)session.getAttribute("name");
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(name != null)
{
	if(name.equals("Tijo"))
	{
		response.sendRedirect("Admin.jsp");
	}else{
    response.sendRedirect("Home.jsp");
	}
}
%>

<div class="container">
<div class="jumbotron">
    <h1>Welcome To Blue Bus Application</h1>
    <form action="Login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pwd" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
<div class="dropdown-divider" style="border:1px solid black"></div>
  <a class="dropdown-item" href="Register.jsp">New Around Here Sign Up?</a>
</div>
   </div>
</body>
</html>