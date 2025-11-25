 package com.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import javax.management.StringValueExp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.Database;
import com.bean.ABE;
import com.bean.Kubernutes;
import com.bean.RandomKeys;



/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig(maxFileSize = 16177215)
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Set<String> uniqueStrings = new HashSet<String>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
		String fName=request.getParameter("fName");
		Part file=request.getPart("File");
		
		HttpSession session=request.getSession();
		HttpSession session2=request.getSession();
		
	InputStream	inputStream, input1;
	input1 = file.getInputStream();
		int n=5;
		String fid=RandomKeys.getFid();
		session2.setAttribute("fid", fid);
		 if (isUnique(fName)) {
	           
	            uniqueStrings.add(fName);

	           
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<html><body>");
	            out.println("<p>String '" + fName + "' is unique!</p>");
	            out.println("</body></html>");
	        } else {
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<html><body>");
	            out.println("<p>String '" + fName + "' is repeated!</p>");
	            out.println("</body></html>");
	        }
		
		if(file!=null) {
			System.out.println(file.getContentType());
			System.out.println(file.getName());
			System.out.println(file.getSize());
			
			inputStream=file.getInputStream();
		//	System.out.println(inputStream);
			
			String integerValue= (String) session.getAttribute("oid");

			if (integerValue != null) {
			    
			    //int intValue = integerValue.value();
				
			    System.out.println("not null");
			    
			} else {
			   System.out.println("session is null");
			}
			String message=null;
			String pkey=null;
			 n=16;
			pkey=RandomKeys.RandGeneratedStr(n);
			
			
			BufferedInputStream reader = new BufferedInputStream(inputStream);
			String result1 = new BufferedReader(new InputStreamReader(inputStream))
			        .lines().collect(Collectors.joining("\n"));
			 int length=result1.length();
			   
			int a[]=Kubernutes.splitIntoParts(length, 3);
			StringBuffer sb = new StringBuffer();
			int str;
			while ((str = reader.read()) != -1) {
			//	System.out.print((char) str);
				
				sb.append((char) str);
			}
			
			
			  for(int i : a) { System.out.println("values from array"+i); } HashSet<String>
			  set=new HashSet<String>();
			 
			 for(int i=0;i<a.length;i++) {
			 
			 set.add(result1.substring(0,170)); }
			  
			  for(String s1: set) { System.out.println("set values"+s1); }
			
			   
			   String s1=result1.substring(0,300);
			   String h1=  ABE.encryption(fName, pkey);
			   if(s1!=null) {
				try {
					//int fileid=(Integer) session.getAttribute("fid");
					int i=   Database.node1(fid,integerValue, s1,h1);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   }
			   else {
				   System.out.println("data not inserted");
			   }
			  
			   String s2=result1.substring(301, 900);
			   String h2= ABE.encryption(s2, pkey);
			   if(s2!=null) {
					try {
						//int fileid=(Integer) session.getAttribute("fid");
						int i=   Database.node2(fid,integerValue, s2,h2);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				   }
				   else {
					   System.out.println("data not inserted");
				   } 
			
			
			
			String s = sb.toString();
			String fileData=ABE.encryption(s, pkey);
			//System.out.println(inputStream+" "+pkey+" "+skey+" "+fileData);
			
			try {
				Connection	conn = Database.getConnection();
					
					String sql= "insert into upload values(?,?,?,?,?,?)";
					PreparedStatement ps=conn.prepareStatement(sql);
					if(inputStream!=null) {
						
						ps.setString(1, fid);
						ps.setString(2, fName);
						ps.setBlob(3, input1);
						ps.setString(4,fileData);
						ps.setString(5, pkey);
						
						ps.setString(6, integerValue);
						
					}
					
					
					int i=ps.executeUpdate();
					if(i>0) {
						message="file uploaded sucessfully";
						
						response.sendRedirect("viewfiles.jsp");
						System.out.println(message);
					}else {
						System.out.println("not uploaded");
						response.sendRedirect("Upload.jsp");
					}
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		
			}
			

	}
	private boolean isUnique(String inputString) {
        return !uniqueStrings.contains(inputString);
    }
	

}
