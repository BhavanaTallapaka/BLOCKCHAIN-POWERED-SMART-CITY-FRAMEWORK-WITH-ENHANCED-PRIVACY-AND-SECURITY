<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
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
String fid=request.getParameter("fid");
String fname=request.getParameter("fname");
String cid=request.getParameter("cid");
PrintWriter o=response.getWriter();

String sql="select ENCKey from upload where  fid='"+fid+"' and FileName='"+fname+"'";
Connection connection=Database.getConnection();
PreparedStatement ps=connection.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
String key=rs.getString(1);
sql="update searchdata set status='"+key+"' where fid='"+fid+"' and fname='"+fname+"'  ";
connection=Database.getConnection();
ps=connection.prepareStatement(sql);
int i=ps.executeUpdate();
if(i>0){
	 o.println("<script type=\"text/javascript\">");
		o.println("alert(' MSP Verified Client Sucessfully...');");
		o.println("window.location='Msphome.jsp';</script>");}
else{
	 o.println("<script type=\"text/javascript\">");
		o.println("alert('404  Details Not Found...');");
		o.println("window.location='clientsearch.jsp';</script>");
}}
%>

</body>
</html>