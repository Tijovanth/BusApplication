package com.tijo;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    
	Process processObj;
	boolean value;
	public void init()
	{
		processObj = (Process) getServletContext().getAttribute("processObj");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int check = processObj.loginValidation(email, password);
		if(check == 1)
		{
			out.println("First You Should Register");
			request.getRequestDispatcher("/Login.jsp").include(request, response);
		}else if(check == 2)
		{
			out.println("Email-Id Invalid");
			request.getRequestDispatcher("/Login.jsp").include(request, response);
		}else if(check == 4)
		{
			out.println("Password Invalid");
			request.getRequestDispatcher("/Login.jsp").include(request, response);
		}else if(check == 5)
		{
			HttpSession session = request.getSession();
			session.setAttribute("name","Tijo");
			response.sendRedirect("Admin.jsp");
		}else
		{
			if(value == true)
			{
				 getServletContext().setAttribute("noSession",true);
			     response.sendRedirect("Home.jsp?name=" + URLEncoder.encode(processObj.getUserName(email),"UTF-8"));
			}else {
				 getServletContext().setAttribute("noSession",false);
				 getServletContext().setAttribute("busList", processObj.busList);
				 HttpSession session = request.getSession();
				 session.setAttribute("name",processObj.getUserName(email));
				 session.setAttribute("userEmail", email);
				 response.sendRedirect("Home.jsp");
			}
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException{
		 value = Boolean.parseBoolean(request.getParameter("value"));
	}
}
