package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Database;

/**
 * Servlet implementation class ClientRegisters
 */
@WebServlet("/ClientRegisters")
public class ClientRegisters extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRegisters() {
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
        String email = request.getParameter("email");
       
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone_number");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String city = request.getParameter("city");

        // Insert the data into the database
        try  {
        	System.out.println("from database");
        	Connection connection=Database.getConnection();
            String sql = "INSERT INTO client  VALUES (0,?, ?, ?, ?, ?, ?, ?,?,?)";
            
           PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, email);
                
                statement.setString(3, password);  // In production, hash the password
                statement.setString(4, phoneNumber);
                statement.setString(5, dob);
                statement.setString(6, address);
                statement.setString(7, city);
                statement.setString(8, "pending");
                statement.setString(9, "pending");

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().write("Registration successful! by"+" "+username);
                response.sendRedirect("clientlogin.jsp");
                
                } else {
                    response.getWriter().write("Error: Registration failed.");
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database connection error.");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
