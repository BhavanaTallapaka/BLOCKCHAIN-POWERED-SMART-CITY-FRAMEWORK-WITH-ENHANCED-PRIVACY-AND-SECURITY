<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dao.Database"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    // Get the file ID from the request
    String fileId = request.getParameter("fid");
    
    if (fileId != null) {
        try {
            // Get a connection to the database
            Connection con = Database.getConnection();
            
            // Prepare the SQL delete statement
            String sql = "DELETE FROM upload WHERE fid= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fileId);
            
            // Execute the delete statement
            int result = ps.executeUpdate();
            
            // If the delete operation was successful, redirect to the main page
            if (result > 0) {
                out.println("<p>File deleted successfully.</p>");
                response.sendRedirect("viewfiles.jsp"); // Redirect to the page with the table
            } else {
                out.println("<p>Error deleting file.</p>");
            }
            
            // Close the connection
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>File ID is missing.</p>");
    }
%>

</body>
</html>