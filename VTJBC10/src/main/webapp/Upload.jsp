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



		<section class="faq-section section-padding" id="section_4">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 col-12">
						<h2 class="mb-4">Frequently Asked Questions</h2>
					</div>

					<div class="clearfix"></div>

					<div class="col-lg-5 col-12">
						<img src="images/faq_graphic.jpg" class="img-fluid" alt="FAQs">
					</div>

					<div class="col-lg-6 col-12 m-auto">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										Upload Data?</button>
								</h2>

								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<center>



											<form action="Upload" method="post"
												enctype="multipart/form-data">
												<table>

													<tr>
														<td>FileName:</td>
														<td><input type="text" name="fName"></td>
													</tr>

													<tr>
														<td>UploadFile:</td>
														<td><input type="file" name="File"></td>
													</tr>


													<!-- <tr><td>Key:</td><td><input type="text" name="key" maxlength="16"></td></tr> -->



													<tr>
														<td><button>Submit</button></td>
													</tr>
													<!-- <button onclick="history.go(-1)">Go Back</button> -->
												</table>
										</center>
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										How to find a topic?</button>
								</h2>

								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										You can search on Google with <strong>keywords</strong> such
										as templatemo portfolio, templatemo one-page layouts,
										photography, digital marketing, etc.
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Does it need to paid?</button>
								</h2>

								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										You can modify any of this with custom CSS or overriding our
										default variables. It's also worth noting that just about any
										HTML can go within the
										<code>.accordion-body</code>
										, though the transition does limit overflow.
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>






		<!-- JAVASCRIPT FILES -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/jquery.sticky.js"></script>
		<script src="js/click-scroll.js"></script>
		<script src="js/custom.js"></script>
</body>
</html>