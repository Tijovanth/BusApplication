package com.tijo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookTickets extends HttpServlet {
    
	Process processObj;
	public void init()
	{
		processObj = (Process) getServletContext().getAttribute("processObj");
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		int len = Integer.parseInt(request.getParameter("len"));
		    HttpSession session =  request.getSession();
		   String userEmail = (String) session.getAttribute("userEmail");
		if(len == 1)
		{
			String value1 = request.getParameter("value1");
			String pickupAndDrop = request.getParameter("pickupAndDrop");
			processObj.BookTickets(pickupAndDrop, userEmail, value1);
			response.sendRedirect("Sucess.jsp");
		}else if(len == 2)
		{
		    String value1 = request.getParameter("value1");
		    String value2 = request.getParameter("value2");
		    String pickupAndDrop = request.getParameter("pickupAndDrop");
		    processObj.BookTickets(pickupAndDrop, userEmail, value1, value2);
		    response.sendRedirect("Sucess.jsp");
		}else
		{
			String value1 = request.getParameter("value1");
			String value2 = request.getParameter("value2");
			String value3 = request.getParameter("value3");
			String pickupAndDrop = request.getParameter("pickupAndDrop");
			processObj.BookTickets(pickupAndDrop, userEmail, value1, value2, value3);
			response.sendRedirect("Sucess.jsp");
		}
	}
}
