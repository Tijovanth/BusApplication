<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
 <%
    String name = (String)session.getAttribute("name");
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if(name == null)
    {
    	response.sendRedirect("Login.jsp");
    }
 String pickupAndDrop = request.getParameter("pickupAndDrop");
 ArrayList<String> Tickets = new ArrayList<>(25);
Collection<LinkedList<String>> availableTickets = (Collection<LinkedList<String>>)application.getAttribute("AllTickets");
 Iterator itr = availableTickets.iterator();
 while(itr.hasNext())
 {
	LinkedList<String> temp =(LinkedList<String>) itr.next();
	if(!temp.isEmpty())
	{
		Iterator it = temp.iterator();
		while(it.hasNext())
		{
			String t = (String)it.next();
			System.out.println(t);
			Tickets.add(t);
		}
	}
 }
 int len = Tickets.size();
 boolean isTrue = Tickets.isEmpty();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Available tickets</title>
</head>
<style>
button
{
width:100%;
height:100%;
}
#tijo
{
width:80%;
height:100%;
}
</style>

<script>
var count = 0; var slot = {};

function disableButtons()
{
	if(<%=!Tickets.isEmpty() %>)
		{
		<%for(int i=0;i<Tickets.size();i++){%>
		var id = <%= Tickets.get(i) %>
		   id.disabled = true;
		   id.style.backgroundColor = "red";
		   <%}%>
		}
}
function colorChange(id)
{
	 if(document.getElementById(id).style.backgroundColor == "yellow")
	 {
		 if( Object.keys(window.slot).length >  0)
	   	 {
		 document.getElementById(id).style.backgroundColor = "green";
		 delete window.slot[document.getElementById(id).value];
	   	 }  
	 }else{
		 if( Object.keys(window.slot).length < 3)
			 {
			 document.getElementById(id).style.backgroundColor = "yellow";
			 window.slot[document.getElementById(id).value] = document.getElementById(id).value;
			 }
		 else
			 {
			 alert("Maximum 3 Tickets will be allowed");
			 }
	     }
}
function send()
{
	if( Object.keys(window.slot).length != 0 )
	{
	var len = Object.keys(window.slot).length
	var values =  Object.values(slot);
	var pickupAndDrop = document.getElementById("pickupAndDrop").value;
	if(len == 1)
		{
		 location.replace("BookTickets?value1="+values[0]+"&len="+len+"&pickupAndDrop="+pickupAndDrop);
		}
	else if(len == 2)
		{
		location.replace("BookTickets?value1="+values[0]+"&value2="+values[1]+"&len="+len+"&pickupAndDrop="+pickupAndDrop);
		}
	else
		{
		location.replace("BookTickets?value1="+values[0]+"&value2="+values[1]+"&value3="+values[2]+"&len="+len+"&pickupAndDrop="+pickupAndDrop);
		}
	}else
		{
		alert("Please Click The Seats");
		}
}
</script>
</head>
<body onload="disableButtons()">
<input type="hidden" id="pickupAndDrop" value=<%=pickupAndDrop %> >
<div class="container">
<div class="jumbotron">
<h3><%=pickupAndDrop %></h3>
<table id="tijo">
<th>
<td style="text-align:center;">1</td>
<td style="text-align:center;">2</td>
<td style="text-align:center;">3</td>
<td>&nbsp</td>
<td style="text-align:center;">4</td>
<td style="text-align:center;">5</td>
</th>
<tr>
<td>A</td>
<td><button onclick="colorChange('A1')" id="A1" style="background-color:green;"  value=A1>A1</button></td>
<td><button onclick="colorChange('A2')" id="A2" style="background-color:green;"  value=A2>A2</button></td>
<td><button onclick="colorChange('A3')" id="A3" style="background-color:green;"  value=A3>A3</button></td>
<td></td>
<td><button onclick="colorChange('A4')" id="A4" style="background-color:green;"  value=A4>A4</button></td>
<td><button onclick="colorChange('A5')" id="A5" style="background-color:green;"  value=A5>A5</button></td>
</tr>
<tr>
<td>B</td>
<td><button onclick="colorChange('B1')" id="B1" style="background-color:green;"  value=B1>B1</button></td>
<td><button onclick="colorChange('B2')" id="B2" style="background-color:green;"  value=B2>B2</button></td>
<td><button onclick="colorChange('B3')" id="B3" style="background-color:green;"  value=B3>B3</button></td>
<td></td>
<td><button onclick="colorChange('B4')" id="B4" style="background-color:green;"  value=B4>B4</button></td>
<td><button onclick="colorChange('B5')" id="B5" style="background-color:green;"  value=B5>B5</button></td>
</tr>
<tr>
<td>C</td>
<td><button onclick="colorChange('C1')" id="C1" style="background-color:green;"  value=C1>C1</button></td>
<td><button onclick="colorChange('C2')" id="C2" style="background-color:green;"  value=C2>C2</button></td>
<td><button onclick="colorChange('C3')" id="C3" style="background-color:green;"  value=C3>C3</button></td>
<td></td>
<td><button onclick="colorChange('C4')" id="C4" style="background-color:green;"  value=C4>C4</button></td>
<td><button onclick="colorChange('C5')" id="C5" style="background-color:green;"  value=C5>C5</button></td>
</tr> 
<tr>
<td>D</td>
<td><button onclick="colorChange('D1')" id="D1" style="background-color:green;"  value=D1>D1</button></td>
<td><button onclick="colorChange('D2')" id="D2" style="background-color:green;"  value=D2>D2</button></td>
<td><button onclick="colorChange('D3')" id="D3" style="background-color:green;"  value=D3>D3</button></td>
<td></td>
<td><button onclick="colorChange('D4')" id="D4" style="background-color:green;"  value=D4>D4</button></td>
<td><button onclick="colorChange('D5')" id="D5" style="background-color:green;"  value=D5>D5</button></td>
</tr>
<tr>
<td>E</td>
<td><button onclick="colorChange('E1')" id="E1" style="background-color:green;"  value=E1>E1</button></td>
<td><button onclick="colorChange('E2')" id="E2" style="background-color:green;"  value=E2>E2</button></td>
<td><button onclick="colorChange('E3')" id="E3" style="background-color:green;"  value=E3>E3</button></td>
<td></td>
<td><button onclick="colorChange('E4')" id="E4" style="background-color:green;"  value=E4>E4</button></td>
<td><button onclick="colorChange('E5')" id="E5" style="background-color:green;"  value=E5>E5</button></td>
</tr>
</table><br>
<input type="submit" onclick="send()" class="btn btn-primary">
</div></div>
</body>
</html>