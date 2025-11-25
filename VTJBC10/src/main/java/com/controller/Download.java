package com.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Database;





@WebServlet("/Down1")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String fid=request.getParameter("fid");
			String key=request.getParameter("key");
			System.out.println(fid+"from donwload");
			try {
			Connection con=Database.getConnection();
			Statement st=con.createStatement();
			System.out.println("fid");
			ResultSet r=st.executeQuery("select FileName, fileContent from upload where fid='"+fid+"' and ENCKey='"+key+"'");
			
			
			if(r.next())
			{                                              
			
				
				
				Blob blob = r.getBlob(2);
				byte[] bar = blob.getBytes(1, (int) blob.length());
				

				FileOutputStream fos = new FileOutputStream("C:/Users/bhavi/eclipse-workspace/VTJBC10/src/main/webapp/Myfiles/" + r.getString(1)+".txt");
				fos.write(bar);
				
				fos.close();

				response.setContentType("text/html");
				PrintWriter out1 = response.getWriter();
				String filename = r.getString(1)+".txt";
				String filepath = "C:/Users/bhavi/eclipse-workspace/VTJBC10/src/main/webapp/Myfiles/";
				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

				FileInputStream fileInputStream = new FileInputStream(filepath + filename);

				int i;
				while ((i = fileInputStream.read()) != -1) {
			out1.write(i);

				}
				fileInputStream.close();
				out1.close();
			}
			
			}catch (Exception exception){
				exception.printStackTrace();
			}
	}

}
