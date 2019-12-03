<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Insert title here</title>
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
    	if(name.equals("Tijo"))
    	{
    		response.sendRedirect("Admin.jsp");
    	}
    }
%>
<%
ArrayList<String>  busList = (ArrayList<String>)application.getAttribute("busList");
%>
<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand">Welcome: <%=name %></a>
  <form class="form-inline" action="PrintTicket">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Print Tickets</button>
  </form>
  <form class="form-inline" action="Logout">
  <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button></a>
  </form>
</nav>
<div class="container">
<div class="jumbotron">
<form action="Home" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Choose Route</label>
    <select id="exampleInputEmail1" name="pickupAndDrop">
    <% for(int i = 0; i < busList.size(); i++){ 
    %>
  <option value=<%=busList.get(i) %>><%=busList.get(i) %></option>
  <%} %>
</select>
  </div>
  <input type="submit" class="btn btn-primary">
</form>
</div></div>
</body>
</html>