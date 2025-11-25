<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dao.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bean.RandomKeys"%>
<%@page import="com.bean.Sha"%>
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

String name=request.getParameter("email");
String passwors=request.getParameter("passwors");

String sc=name+passwors;
String con=Sha.getHash(sc);
System.out.println(con);
String key=RandomKeys.Randprivatekeys(8);

String sql="update client set  Servicekey='"+key+"', SC='"+con+"' where email='"+name+"'";
Connection connection=Database.getConnection();
PreparedStatement ps=connection.prepareStatement(sql);
int i=ps.executeUpdate();
PrintWriter o=response.getWriter();
if(i>0){
	o.println("<script type=\"text/javascript\">");
	o.println("alert(' Smart created Sucessfully...');");
	o.println("window.location='Msphome.jsp';</script>");
}else{
	o.println("<script type=\"text/javascript\">");
	o.println("alert(' 404 Technical Issue Not Found...');");
	o.println("window.location='Msphome.jsp';</script>");
}
%>

</body>
</html>