package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Database;

/**
 * Servlet implementation class Clogin
 */
@WebServlet("/Clogin")
public class Clogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        HttpSession session=request.getSession();
        session.setAttribute("cid", username);

        // Query the database for the user
        String query = "SELECT * FROM client WHERE email = ? AND password = ? and SC!='pending'";

        try {
        	Connection connection=Database.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
            
            // Set the parameters for the prepared statement
            statement.setString(1, username);
            statement.setString(2, password);  // In production, you should hash the password before checking

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	response.getWriter().write("<script type='text/javascript'>alert('Login successful! Welcome, " + username + "');</script>");
            	 response.sendRedirect("chome.jsp");
                // Optionally, redirect to another page (like user dashboard)
                // response.sendRedirect("dashboard.jsp");
            } else {
                // Login failed: No user found with the given username and password
            	 response.getWriter().write("<script type='text/javascript'>alert('Invalid username or password');</script>");
            	 response.sendRedirect("clientlogin.jsp");
					/* response.getWriter().write("Invalid username or password."); */
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database connection error.");
        }
	}

}
