<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Admin Page</title>
</head>
<body>
<%
  String name = (String) session.getAttribute("name");
  response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  if(name == null)
  {
   response.sendRedirect("Login.jsp");
  }else
  {
  	if(!name.equals("Tijo"))
  	{
  		response.sendRedirect("Home.jsp");
  	}
  }
%>
<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand"><%=name %></a>
  <form class="form-inline" action="Logout">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button></a>
  </form>
</nav>
<div class="container">
<div class="jumbotron">
<%  String value = request.getParameter("value");%>
<%if(value != null){ %>
<p>This route is already there</p>
<%} %>
<form action="Admin" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Arrival</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name = "pickup" aria-describedby="emailHelp" placeholder="Enter Arrival">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Destination</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="drop" placeholder="Enter Destination">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</body>
</html>