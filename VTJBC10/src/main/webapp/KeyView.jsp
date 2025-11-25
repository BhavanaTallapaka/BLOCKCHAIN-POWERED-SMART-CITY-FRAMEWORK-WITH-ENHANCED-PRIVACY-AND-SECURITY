<%@ page import="com.google.zxing.BarcodeFormat, com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix" %>
<%@ page import="java.io.ByteArrayOutputStream, javax.imageio.ImageIO, java.awt.image.BufferedImage" %>
<%@page import="com.bean.RequestData"%>
<%@page import="com.dao.Database"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<section class="contact-section section-padding section-bg" id="section_5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                            <h2 class="mb-5">Get in touch</h2>
                        </div>

                       
                        <div>
                            <table border="1" style="width: 90%;">

<thead>
<tr style="color: green; font-size: 120%;">
<td>Fid</td>
<td>File Name</td>
<td>Key</td>

</tr>

<% 
    String uid = (String) session.getAttribute("cid");
    List<RequestData> it = Database.keyView(uid);
    if (it == null) { 
%>
        <p>it is null</p>
<% 
    } else { 
        for (RequestData rd : it) { 
            String status = rd.getStatus(); // The string to encode in QR code
            // QR code generation logic
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(status, BarcodeFormat.QR_CODE, 200, 200); // Create a 200x200 QR code
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            BufferedImage image = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
            for (int x = 0; x < 200; x++) {
                for (int y = 0; y < 200; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF); // Set black or white color for QR code
                }
            }
            ImageIO.write(image, "PNG", baos);
            byte[] qrImage = baos.toByteArray(); // The byte array representation of the QR code

            // Include the QR code image in the response as base64
            String base64QR = java.util.Base64.getEncoder().encodeToString(qrImage);
%>
            <tr style="color: brown">
                <td><%= rd.getFid() %></td>
                <td><%= rd.getFileNAme() %></td>
               
                <td>
                    <h5>
                        <a href="download.jsp?Fid=<%= rd.getFid() %>&Key=<%= rd.getStatus() %>">Download</a>
                    </h5>
                    <!-- Display the QR code as an image -->
                    <img src="data:image/png;base64,<%= base64QR %>" alt="QR Code">
                </td>
            </tr>
<% 
        }
    } 
%>
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