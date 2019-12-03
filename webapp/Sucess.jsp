<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<% String name = (String)request.getSession().getAttribute("name"); 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(name == null)
{
	response.sendRedirect("Login.jsp");
}
else if(name.equals("Tijo"))
{
%>
<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand">Welcome: <%=name %> </a>
  <form class="form-inline" action="Logout">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button></a>
  </form>
 </nav>
  <div class="container">
<div class="jumbotron">
<h1>Registered SucessFull</h1>
<a href="Admin.jsp"><button class="btn btn-primary">Back</button></a>
</div>
</div>
<% } else{ %>
<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand">Welcome: <%=name %> </a>
  <form class="form-inline" action="PrintTicket">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Print Tickets</button>
  </form>
  <form class="form-inline" action="Logout">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button></a>
  </form>
 </nav>
  <div class="container">
<div class="jumbotron">
<h1>Booking SucessFull</h1>
<a href="Home.jsp"><button class="btn btn-primary">Home</button></a>
</div>
</div>
<%} %>
</body>
</html>