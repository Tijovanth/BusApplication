package com.tijo;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home extends HttpServlet {
	
	Process processObj;
	boolean value;
	public void init()
	{
		processObj =(Process) getServletContext().getAttribute("processObj");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		System.out.println("Iam In Home Servlet");
		String pickupAndDrop = request.getParameter("pickupAndDrop");
		getServletContext().setAttribute("AllTickets", processObj.getAvailableTickets(pickupAndDrop));
	    response.sendRedirect("AvailableTickets.jsp?pickupAndDrop="+pickupAndDrop);
	}
}
