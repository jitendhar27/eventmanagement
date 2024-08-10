<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Registration - Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
  background: url("images/pic14.jpg") no-repeat center center fixed;
  background-size: cover;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0;
}

.navbar {
  background-color: #7d3f8c; /* Purple background for navbar */
}

.navbar-brand {
  color: #fff; /* White color for brand name */
  font-weight: bold;
}

.navbar-nav a {
  color: #fff; /* White color for navbar links */
  text-decoration: none;
  margin: 0 15px;
  font-weight: bold;
  transition: color 0.3s;
}

.navbar-nav a:hover {
  color: #d9a8c2; /* Light purple color on hover */
}

.container {
  background-color: rgba(255, 255, 255, 0.9);
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 800px;
  margin: 20px auto; /* Center the container */
  flex: 1;
}

h2 {
  color: #7d3f8c; /* Purple color for the header */
  text-align: center;
  margin-bottom: 30px;
}

.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border: none;
  margin-bottom: 30px;
}

.card-img-top {
  height: 200px; /* Adjust the height as needed */
  object-fit: cover;
}

.card-body {
  text-align: center;
}

.card-title {
  font-size: 1.5rem;
  color: #7d3f8c; /* Purple color for the title */
}

.footer {
  background-color: #7d3f8c; /* Purple background for footer */
  color: #fff;
  text-align: center;
  padding: 10px 0;
  margin-top: auto;
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="welcome.jsp">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="Gallery.jsp">Gallery</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="event-registration.jsp">Event Registration</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="AboutUs.jsp">About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contactus.jsp">Contact Us</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="index.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
  <h2>Choose an Event Type</h2>

  <!-- Event Types Gallery -->
  <div class="row">
    <!-- Technical Events -->
    <div class="col-md-6">
      <div class="card">
        <img src="images/pic15.png" class="card-img-top" alt="Technical Event">
        <div class="card-body">
          <h5 class="card-title">Technical Events</h5>
          <p class="card-text">Explore a variety of technical events designed to enhance your skills and knowledge in the field of technology.</p>
          <a href="register-technical.jsp" class="btn btn-primary">Register</a>
        </div>
      </div>
    </div>
    <!-- Non-Technical Events -->
    <div class="col-md-6">
      <div class="card">
        <img src="images/pic16.jpeg" class="card-img-top" alt="Non-Technical Event">
        <div class="card-body">
          <h5 class="card-title">Non-Technical Events</h5>
          <p class="card-text">Discover a range of non-technical events that offer opportunities for cultural, artistic, and recreational activities.</p>
          <a href="register-nontech.jsp" class="btn btn-primary">Register</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<div class="footer">
  <p>&copy; 2024 KLU Event University Management. All rights reserved.</p>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
