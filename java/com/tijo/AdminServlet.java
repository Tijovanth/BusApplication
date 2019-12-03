package com.tijo;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminServlet extends HttpServlet {
    
	Process processObj;
	public void init()
	{
		processObj = (Process) getServletContext().getAttribute("processObj");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		response.setContentType("text/html");
		String pickup = request.getParameter("pickup");
		String drop = request.getParameter("drop");
		pickup = pickup.toUpperCase();
		drop = drop.toUpperCase();
		String pickupAndDrop = pickup+"-"+drop;
		if(!processObj.Buses.containsKey(pickupAndDrop))
		{
			processObj.Buses.put(pickupAndDrop,new HashMap<String,LinkedList<String>>());
			processObj.busList.add(pickupAndDrop);
			response.sendRedirect("Sucess.jsp");
		}else
		{
			request.getRequestDispatcher("/Admin.jsp?value=true").include(request,response);
		}
	}
}
