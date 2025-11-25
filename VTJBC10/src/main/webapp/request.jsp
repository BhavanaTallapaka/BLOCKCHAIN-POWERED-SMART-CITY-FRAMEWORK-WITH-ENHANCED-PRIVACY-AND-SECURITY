<%@page import="com.dao.Database"%>
<%@page import="java.sql.ResultSet"%>
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
String fid=request.getParameter("Id");
String uid=request.getParameter("userId");
String fname=request.getParameter("FName");

if(session.getAttribute("uid")==null){%>
<p>session is null</p>
<% }
//String usid=(String)session.getAttribute("uid");


int i=Database.sendrequest(fid, fname, uid);
if(i>0){

response.sendRedirect("KeyView.jsp");


%>
<!-- <p>Sucessfully sent</p> -->


<script type="text/javascript">
       
        alert("Data Sent to MSP sucessfully!");
    </script>



	
<% }%>


</table>




</body>
</html>