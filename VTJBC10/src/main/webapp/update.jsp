<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit File Content</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<style>
    body {
        background: linear-gradient(to right, #74ebd5, #ACB6E5);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding-top: 60px;
    }

    .navbar {
        background-color: #ffffffcc;
        backdrop-filter: blur(10px);
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }

    .navbar-nav .nav-link {
        color: #333;
        font-weight: 500;
        transition: color 0.3s;
    }

    .navbar-nav .nav-link:hover {
        color: #007BFF;
    }

    .form-container {
        background-color: #fff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        max-width: 900px;
        margin: auto;
    }

    textarea {
        resize: vertical;
    }

    button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 25px;
        border-radius: 8px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
    <div class="container-fluid px-5">
        <a class="navbar-brand fw-bold" href="#">My Editor</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav ms-lg-5 me-lg-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Upload.jsp">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="viewfiles.jsp">View Files</a></li>
                <li class="nav-item"><a class="nav-link" href="clientlogin.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<%
    String fid = request.getParameter("fid");
    String fname = request.getParameter("fname");
    String con = request.getParameter("cont");
%>

<!-- Form Section -->
<div class="container mt-5">
    <div class="form-container">
        <h2 class="mb-4 text-center text-primary">Edit File Content</h2>
        <form action="Edit" method="post">
            <div class="mb-3">
                <label for="fid" class="form-label">File ID</label>
                <input type="text" class="form-control" name="fid" value="<%=fid %>" readonly>
            </div>
            <div class="mb-3">
                <label for="fname" class="form-label">File Name</label>
                <input type="text" class="form-control" name="fname" value="<%=fname %>" readonly>
            </div>
            <div class="mb-3">
                <label for="cont" class="form-label">Edit Content</label>
                <textarea class="form-control" name="cont" rows="10"><%=con %></textarea>
            </div>
            <div class="text-center">
                <button type="submit">Update</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
