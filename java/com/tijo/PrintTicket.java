package com.tijo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrintTicket extends HttpServlet {
	Process processObj;
	public void init()
	{
		processObj =(Process) getServletContext().getAttribute("processObj");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		HashMap<String,LinkedList<String>> particularUserTickets = processObj.getTickets((String)request.getSession().getAttribute("userEmail"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = (String) request.getSession().getAttribute("name");
		if(name == null)
		{
			response.sendRedirect("Login.jsp");
		}else {
		out.println("<html>");
	    out.println("<head>");
	    out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<nav class=\"navbar navbar-dark bg-primary\">");
		out.println("<a class=\"navbar-brand\">Welcome:"+ name +"</a>");
		out.println("<form class=\"form-inline\" action=\"Logout\">\r\n" + 
				"  <button class=\"btn btn-outline-light my-2 my-sm-0\" type=\"submit\">Logout</button></a>\r\n" + 
				"  </form>\r\n" + 
				" </nav>");
		out.println("<div class=\"container\">\r\n" + 
				"<div class=\"jumbotron\">");
	    out.println("<h2>Your Tickets:</h2><br>");
	    for(Map.Entry map:particularUserTickets.entrySet()) 
	    {
	    	out.println("<h3>Bus Route:"+map.getKey()+": "+map.getValue()+"</h3>");
	    }
	    out.println("</div>\r\n" + 
	    		"</div>");
	    out.println("</body>");
		out.println("</html>");
		}
	}
}
