<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta charset="utf-8">
  <title>BizPage Bootstrap Template</title>
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
							href="Search.jsp">Search</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="KeyView.jsp">Key View</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="clientlogin.jsp">Logout</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="client.jsp">Contact</a></li>

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

						<h2 class="text-white">Topics Listing</h2>
					</div>

				</div>
			</div>
		</header>


		<section class="timeline-section section-padding" id="section_3">
			<div class="section-overlay"></div>

			<div class="container">
				<div class="row">

					<div class="col-12 text-center">
						<h2 class="text-white mb-4">
							How does it work?
							</h1>
					</div>

					<div class="col-lg-10 col-12 mx-auto">
						<div class="timeline-container">
							<ul class="vertical-scrollable-timeline"
								id="vertical-scrollable-timeline">
								<div class="list-progress">
									<div class="inner"></div>
								</div>

								<li>


        
<%


	if(request.getAttribute("result")!=null){
		ResultSet rs=(ResultSet) request.getAttribute("result");
		String uid=null;
		if(session.getAttribute("cid")!=null){
			 uid=(String)session.getAttribute("cid");
		}else{
			/* System.out.println("session is null"); */
		}
		
		%>
		
		
		<table border="1" style=" padding: 20px;" class="table table-bordered">
		
		<h3>Based On Your Search Results</h3>
	<thead class="thHead">
					<tr>
					<th><b>FId</b></th>
						<th><b>File Name</b></th>
						<th><b>Encrypted Data</b></th>
						
						
						<th><b>OwnerID</b></th>
						<th><b>Status</b></th>
					</tr>
				</thead>
				
				<%
				
				while(rs.next()){%>
				<tr style="color: white; width: 70%;">
	
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(4) %></td>
		
		
		<td><%=rs.getString(6) %></td>
		
		
		
		
		
						
					<td><h4><a href="request.jsp?Id=<%=rs.getString(1) %>&&userId=<%=uid%>&&FName=<%=rs.getString(2)%>">Request</a></h4></td>
						
						<%-- <td><h4><a href="AcessData.jsp?Id=<%=rs.getString(1) %>&&userId=<%=uid%>&&FName=<%=rs.getString(2)%>">Download</a></h4></td> --%>
		
		</tr>
					
				<% }
				
				%>
				
			

</table>
		
	<%}
	else{%>
	<p>No result found</p>	
<% 	}
	
	%>

                   


<div class="icon-holder">
										<i class="bi-search"></i>
									</div>
								</li>

								
							</ul>
						</div>
					</div>

					<div class="col-12 text-center mt-5">
						<p class="text-white">
							Want to learn more? <a href="#"
								class="btn custom-btn custom-border-btn ms-3">Check out
								Youtube</a>
						</p>
					</div>
				</div>
			</div>
		</section>
	</main>


	<footer class="site-footer section-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-12 mb-4 pb-2">
					<a class="navbar-brand mb-2" href="index.html"> <i
						class="bi-back"></i> <span>Topic</span>
					</a>
				</div>

				<div class="col-lg-3 col-md-4 col-6">
					<h6 class="site-footer-title mb-3">Resources</h6>

					<ul class="site-footer-links">
						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">Home</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">How it works</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">FAQs</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">Contact</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-4 col-6 mb-4 mb-lg-0">
					<h6 class="site-footer-title mb-3">Information</h6>

					<p class="text-white d-flex mb-1">
						<a href="tel: 305-240-9671" class="site-footer-link">
							305-240-9671 </a>
					</p>

					<p class="text-white d-flex">
						<a href="mailto:info@company.com" class="site-footer-link">
							info@company.com </a>
					</p>
				</div>

				<div class="col-lg-3 col-md-4 col-12 mt-4 mt-lg-0 ms-auto">
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">English</button>

						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button">Thai</button></li>

							<li><button class="dropdown-item" type="button">Myanmar</button></li>

							<li><button class="dropdown-item" type="button">Arabic</button></li>
						</ul>
					</div>

					<p class="copyright-text mt-lg-5 mt-4">
						Copyright © 2048 Topic Listing Center. All rights reserved. <br>
						<br>Design: <a rel="nofollow" href="https://templatemo.com"
							target="_blank">TemplateMo</a>
					</p>

				</div>

			</div>
		</div>
	</footer>

	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/custom.js"></script>



                 
                     
            
         
   
    <!-- end slider section -->
    
   


</body>
</html>