package com.tijo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
 
	Process processObj; 
	public void init()
	{
		processObj = new Process();
		getServletContext().setAttribute("processObj", processObj);
	}
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) 
      throws IOException, ServletException {

	  String name = request.getParameter("name");
	  String email = request.getParameter("email");
	  String phoneNumber = request.getParameter("phone");
	  String password = request.getParameter("pwd");
	  response.setContentType("text/html");
	  PrintWriter out = response.getWriter();
	  System.out.println(processObj);
	  int check = processObj.registerValidation(name, password, email, phoneNumber);
	  if( check == 1)
	  {
		  out.println("Phone Number Should be 10 Numbers");
		  request.getRequestDispatcher("/Register.jsp").include(request, response);
	  }else if(check == 3)
	  {
		  out.println("This Email-Id is already defined");
		  request.getRequestDispatcher("/Register.jsp").include(request, response);
	  }else
	  {
		  response.sendRedirect("Login.jsp");
	  }
  }
}
