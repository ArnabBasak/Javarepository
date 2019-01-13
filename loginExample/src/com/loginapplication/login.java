package com.loginapplication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

@WebServlet("/login")
public class login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String pname = request.getParameter("password");
		if (uname.equals("admin") && pname.equals("admin"))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username",uname);
			response.sendRedirect("welcome.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}


}
