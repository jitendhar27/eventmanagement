<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome - Event University Management</title>
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

h2, h3 {
  color: #7d3f8c; /* Purple color for the header */
  text-align: center;
}

h2 {
  margin-bottom: 20px;
  font-size: 28px; /* Increased font size for header */
}

h3.section-title {
  margin: 40px 0 20px;
}

.text-center {
  text-align: center;
}

.footer {
  background-color: #7d3f8c; /* Purple background for footer */
  color: #fff;
  text-align: center;
  padding: 10px 0;
  margin-top: auto;
}

.carousel-item img {
  width: 100%;
  height: 500px; /* Adjust the height as needed */
  object-fit: cover;
  border-radius: 10px;
}

.carousel-indicators li {
  background-color: #7d3f8c; /* Purple color for indicators */
}

.carousel-caption {
  background-color: rgba(0, 0, 0, 0.6);
  border-radius: 10px;
}

.sponsors img {
  max-height: 100px;
  margin: 10px;
}

.card-columns .card {
  margin-bottom: 20px;
}

.card-header, .card-footer {
  background-color: #7d3f8c;
  color: #fff;
}

.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border: none;
}

.highlighted-steps {
  background-color: #f9f2f4;
  border-left: 5px solid #7d3f8c;
  padding: 15px;
  border-radius: 5px;
}

.highlighted-steps li {
  margin-bottom: 10px;
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
        <a class="nav-link" href="myevents.jsp">My Events</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Gallery.jsp">Gallery</a>
      </li>
       </li>
      <li class="nav-item">
        <a class="nav-link" href="Mycertificates.jsp">My CERTIFICATES</a>
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
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
  <h2>Welcome to the Event University Management System!</h2>
  <p class="text-center">You have successfully logged in. Enjoy exploring our system.</p>

  <!-- Image Carousel -->
  <div id="imageCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#imageCarousel" data-slide-to="1"></li>
      <li data-target="#imageCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/pic10.jpg" alt="Event 1">
        <div class="carousel-caption d-none d-md-block">
          <h5>Event 1</h5>
          <p>Description of Event 1</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/pic9.jpeg" alt="Event 2">
        <div class="carousel-caption d-none d-md-block">
          <h5>Event 2</h5>
          <p>Description of Event 2</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/pic12.jpg" alt="Event 3">
        <div class="carousel-caption d-none d-md-block">
          <h5>Event 3</h5>
          <p>Description of Event 3</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <h3 class="mt-5">Steps to Register for an Event</h3>
  <ol class="highlighted-steps">
    <li>Firstly Login to the event registration page and if you are not having account register and login </li>
    <li>Navigate to the <a href="EventRegistration.jsp">Register Events</a> page to view the list of available events.</li>
    <li>Click on the event you are interested in to view more details.</li>
    <li>Click the "Register" button on the event details page.</li>
    <li>Then you will be registered for the event you want to join.</li>
    <li>You can also see the past event images on this <a href="Event.jsp">Events</a> page.</li>
  </ol>

  <!-- Upcoming Events -->
  <h3 class="section-title">Upcoming Events</h3>
  <div class="card-columns">
    <div class="card">
      <div class="card-header">Annual Tech Symposium</div>
      <div class="card-body">
        <p class="card-text">Date: August 20, 2024</p>
        <p class="card-text">Time: 9:00 AM - 5:00 PM</p>
      </div>
      <div class="card-footer">Location: Auditorium</div>
    </div>
    <div class="card">
      <div class="card-header">Cultural Fest</div>
      <div class="card-body">
        <p class="card-text">Date: September 15, 2024</p>
        <p class="card-text">Time: 10:00 AM - 6:00 PM</p>
      </div>
      <div class="card-footer">Location: Open Grounds</div>
    </div>
    <div class="card">
      <div class="card-header">Sports Meet</div>
      <div class="card-body">
        <p class="card-text">Date: October 10, 2024</p>
        <p class="card-text">Time: 8:00 AM - 4:00 PM</p>
      </div>
      <div class="card-footer">Location: Sports Complex</div>
    </div>
  </div>

  <!-- Sponsors -->
  <h3 class="section-title">Our Sponsors</h3>
  <div class="sponsors text-center">
    <img src="images/pic4.png" alt="Sponsor 1">
    <img src="images/pic5.jpeg" alt="Sponsor 2">
    <img src="images/pic6.jpeg" alt="Sponsor 3">
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
