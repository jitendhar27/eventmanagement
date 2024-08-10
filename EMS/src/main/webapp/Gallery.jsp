<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
  background: url('images/pic14.jpg') no-repeat center center fixed;
  background-size: cover;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0;
}

.navbar {
  overflow: hidden;
  background-color: #800080; /* Purple color */
  position: fixed; /* Fixed to the top */
  top: 0;
  width: 100%;
  z-index: 1000;
  display: flex;
  justify-content: space-between;
}

.navbar-left, .navbar-right {
  display: flex;
}

.navbar a {
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.navbar a:hover {
  background-color: #ddd;
  color: black;
}

.container {
  margin: 100px auto 20px; /* Add top margin to avoid overlap with navbar */
  padding: 30px;
  background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background for readability */
  border-radius: 12px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

h1 {
  text-align: center;
  color: #7d3f8c; /* Purple color for the header */
  margin-bottom: 30px;
}

.row {
  margin-bottom: 20px;
}

.card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s, box-shadow 0.3s, border-color 0.3s;
}

.card-img-top {
  height: 200px;
  object-fit: cover;
  border-radius: 12px 12px 0 0; /* Rounded corners at the top */
}

.card-body {
  padding: 15px;
}

.card-title {
  font-size: 1.25rem;
  color: #7d3f8c; /* Purple color for the title */
  margin-bottom: 10px;
  font-weight: bold;
}

.card-text {
  color: #555;
}

.card:hover {
  transform: scale(1.05);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
  border: 1px solid #7d3f8c; /* Add a border on hover */
}

.card:hover .card-img-top {
  filter: brightness(80%); /* Darken image on hover */
}

@media (min-width: 576px) {
  .col-sm-6 {
    margin-bottom: 20px;
  }
}

@media (max-width: 767px) {
  .card-img-top {
    height: 150px; /* Smaller image height on smaller screens */
  }
}
</style>
</head>
<body>

<div class="navbar">
  <div class="navbar-left">
    <a href="welcome.jsp">Home</a>
  </div>
  <div class="navbar-right">
    <a href="myevents.jsp">MY Events</a>
    <a href="Gallery.jsp">Gallery</a>
    <a href="event-registration.jsp">Event Registration</a>
    <a href="aboutUs.jsp">About Us</a>
    <a href="contactUs.jsp">Contact Us</a>
  </div>
</div>

<div class="container">
  <h1>Image Gallery</h1>
  <div class="row">
    <!-- Image 1 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic32.jpg" class="card-img-top" alt="Image 1">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 2 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic33.jpg" class="card-img-top" alt="Image 2">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 3 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic34.jpg" class="card-img-top" alt="Image 3">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 4 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic35.jpg" class="card-img-top" alt="Image 4">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 5 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic36.jpg" class="card-img-top" alt="Image 5">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 6 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic37.jpg" class="card-img-top" alt="Image 6">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 7 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic38.jpg" class="card-img-top" alt="Image 7">
        <div class="card-body">
         
        </div>
      </div>
    </div>
    <!-- Image 8 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic39.jpg" class="card-img-top" alt="Image 8">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 9 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic40.jpg" class="card-img-top" alt="Image 9">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 10 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic41.jpg" class="card-img-top" alt="Image 10">
        <div class="card-body">
          
        </div>
      </div>
    </div>
    <!-- Image 11 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic42.jpg" class="card-img-top" alt="Image 11">
        <div class="card-body">

        </div>
      </div>
    </div>
    <!-- Image 12 -->
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card">
        <img src="images/pic43.jpeg" class="card-img-top" alt="Image 12">
        <div class="card-body">
          
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
