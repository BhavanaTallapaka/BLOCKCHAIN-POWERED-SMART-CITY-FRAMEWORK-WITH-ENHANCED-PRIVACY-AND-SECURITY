package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ABE;
import com.bean.RandomKeys;
import com.dao.Database;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
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
		String fid=request.getParameter("fid");
		String fname=request.getParameter("fname");
		String cont=request.getParameter("cont");
	String	pkey=RandomKeys.RandGeneratedStr(16);
		String h1=  ABE.encryption(cont, pkey); 
	PrintWriter o=response.getWriter();
		
		try {
		
		Connection conn=Database.getConnection();
		
		String sql="update upload set fileContent='"+cont+"' where fid='"+fid+"' and FileName='"+fname+"' ";
		PreparedStatement ps=conn.prepareStatement(sql);
		int i=ps.executeUpdate();
		if(i>0) {
		String	sql1="update upload set  ENCKey='"+pkey+"' where fid='"+fid+"' and FileName='"+fname+"'";
		Connection	conn1=Database.getConnection();
		PreparedStatement	ps1=conn1.prepareStatement(sql1);
			ps1.executeUpdate();
			 o.println("<script type=\"text/javascript\">");
				o.println("alert(' Updated Successfully...');");
				o.println("window.location='viewfiles.jsp';</script>");
			
		}else {
			 o.println("<script type=\"text/javascript\">");
				o.println("alert(' Data Not Updated...');");
				o.println("window.location='update.jsp';</script>");
		}
		
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
