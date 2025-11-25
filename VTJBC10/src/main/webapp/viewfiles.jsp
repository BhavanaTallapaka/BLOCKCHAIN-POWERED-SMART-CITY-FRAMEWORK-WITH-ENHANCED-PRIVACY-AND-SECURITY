<%@page import="com.dao.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Topic Listing Page</title>

<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/bootstrap-icons.css" rel="stylesheet">

<link href="css/templatemo-topic-listing.css" rel="stylesheet">
<!--

TemplateMo 590 topic listing

https://templatemo.com/tm-590-topic-listing

-->
</head>

<body class="topics-listing-page" id="top">

	<main>

		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <i class="bi-back"></i>
					<span>Topic</span>
				</a>

				<div class="d-lg-none ms-auto me-4">
					<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-lg-5 me-lg-auto">
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#">Home</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="Upload.jsp">Upload</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="viewfiles.jsp">View Files</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="clientlogin.jsp">Logout</a></li>



						<!-- <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#section_5" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Pages</a>

                                <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                    <li><a class="dropdown-item active" href="topics-listing.html">Topics Listing</a></li>

                                    <li><a class="dropdown-item" href="contact.html">Contact Form</a></li>
                                </ul>
                            </li> -->
					</ul>

					<div class="d-none d-lg-block">
						<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
					</div>
				</div>
			</div>
		</nav>


		<header
			class="site-header d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Homepage</a></li>

								<li class="breadcrumb-item active" aria-current="page">Topics
									Listing</li>
							</ol>
						</nav>

						<h2 class="text-white">
							<%
String oid= (String)session.getAttribute("oid");

%>
							<h3>
								Welcome
								<%=oid %></h3>
						</h2>
					</div>

				</div>
			</div>
		</header>
		
		<section class="contact-section section-padding section-bg" id="section_5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                           
                        
                       
                        <div>

<table border="1" style=" padding: 20px;" class="table table-bordered"><br><br><br>
	 <h2 class="mb-5"> My Files</h2>
		<thead>
			<tr>
				<th>File Id</th>
				
				<th>File Name</th>
				<th>File Content</th>
				<th>User ID</th>
				
			</tr>
		</thead>

		<%
		//String oid=(String)session.getAttribute("oid");
		Connection con = Database.getConnection();
		String sql = "select * from upload where Oid='"+oid+"' ";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
		%>


		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3).substring(0, 32)%></td>
			<td><%=rs.getString(6)%></td>
			
			<td><a href="update.jsp?fid=<%=rs.getString(1) %> &&fname=<%=rs.getString(2) %> &&cont=<%=rs.getString(3) %>">Edit</a>
			<td><a href="delete.jsp?fid=<%=rs.getString(1) %> &&fname=<%=rs.getString(2) %> &&cont=<%=rs.getString(3) %>">Delete</a>
		</tr>

		<%
		}
		%>



	</table>
  </div>
</div>

                       
                </div>
            </section></main>


	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/custom.js"></script>



</body>
</html>