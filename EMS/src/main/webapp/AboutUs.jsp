<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
 /* Navbar */
.navbar {
  background-color: #7d3f8c; /* Purple background for navbar */
  padding: 15px; /* Increased padding for better spacing */
  border-bottom: 2px solid #d9a8c2; /* Light purple bottom border */
}

.navbar-brand {
  color: #fff;
  font-size: 26px; /* Increased font size for the brand */
  font-weight: bold;
  text-transform: uppercase; /* Capitalize brand name */
  transition: color 0.3s, transform 0.3s;
}

.navbar-brand:hover {
  color: #d9a8c2; /* Light purple color on hover */
  transform: scale(1.05); /* Slight scale effect on hover */
}

.navbar-nav {
  margin-left: auto; /* Align nav items to the right */
}

.navbar-nav .nav-item {
  margin-left: 20px; /* Space between nav items */
}

.navbar-nav a {
  color: #fff;
  text-decoration: none;
  font-size: 18px; /* Font size for nav links */
  font-weight: 500; /* Medium font weight */
  transition: color 0.3s, border-bottom 0.3s;
}

.navbar-nav a:hover {
  color: #d9a8c2; /* Light purple color on hover */
  border-bottom: 2px solid #d9a8c2; /* Underline effect on hover */
}

/* Responsive navbar */
@media (max-width: 767px) {
  .navbar {
    text-align: center;
  }

  .navbar-nav {
    margin: 0;
  }

  .navbar-nav .nav-item {
    margin: 10px 0; /* Space between nav items on small screens */
  }

  .navbar-brand {
    margin-bottom: 15px; /* Space below brand name on small screens */
  }
}

/* General Styles */
body {
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
  background: url('images/back.jpg') no-repeat center center fixed; /* Background image */
  background-size: cover; /* Cover the entire page */
  margin: 0;
}

.container {
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h1, h2 {
  color: #7d3f8c; /* Purple color for headers */
}

h2 {
  margin-top: 30px;
}

p {
  line-height: 1.6;
}

.section {
  margin-bottom: 40px;
  padding: 20px;
  border-radius: 10px;
  background-color: #f9f9f9; /* Light gray background */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section.highlighted {
  border: 2px solid #7d3f8c; /* Purple border for highlighted sections */
  background-color: #e6dff0; /* Light purple background for highlight */
}

.section h2 {
  color: #7d3f8c; /* Purple color for section headers */
}

.section h2::after {
  content: '';
  display: block;
  width: 50px;
  height: 3px;
  background-color: #7d3f8c; /* Purple underline */
  margin: 10px auto;
}

.team-member {
  border: 1px solid #7d3f8c; /* Purple border */
  border-radius: 5px;
  padding: 15px;
  margin-bottom: 20px;
  background-color: #fff;
  text-align: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s, box-shadow 0.3s;
}

.team-member:hover {
  transform: translateY(-5px); /* Lift effect on hover */
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Enhanced shadow on hover */
}

.team-member img {
  border-radius: 50%;
  width: 120px;
  height: 120px;
  object-fit: cover;
  transition: transform 0.3s;
}

.team-member img:hover {
  transform: scale(1.1); /* Slight zoom effect on hover */
}

.team-member h3 {
  color: #7d3f8c; /* Purple color for team member names */
}

.team-member p {
  color: #666;
}

footer {
  background-color: #7d3f8c; /* Purple footer background */
  color: #fff;
  padding: 20px 0;
  text-align: center;
}

footer a {
  color: #fff;
  text-decoration: none;
  font-weight: bold;
  transition: color 0.3s;
}

footer a:hover {
  color: #d9a8c2; /* Light purple color on hover */
}

ul {
  list-style: none;
  padding: 0;
}

ul li {
  margin-bottom: 10px;
}

ul a {
  color: #7d3f8c; /* Purple color for links */
  text-decoration: none;
  transition: color 0.3s;
}

ul a:hover {
  text-decoration: underline;
  color: #d9a8c2; /* Light purple color on hover */
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="#">University Event Management</a>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="events.jsp">Events</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
  <h1>About Us</h1>

  <div id="our-mission" class="section highlighted">
    <h2>Our Mission</h2>
    <p>At Event University Management, our mission is to streamline event management and enhance the overall experience for students and organizers alike. We strive to provide a comprehensive platform that simplifies the organization, registration, and management of university events.</p>
  </div>

  <div id="our-team" class="section highlighted">
    <h2>Our Team</h2>
    <div class="row">
      <div class="col-md-4">
        <div class="team-member">
          <img src="images/pic24.jpg" alt="Team Member 1">
          <h3>Charitha Sri Jakkampudi</h3>
          <p>Team Member</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="team-member">
          <img src="images/mypic.jpg" alt="Team Member 2">
          <h3>Balabadra Navya Sri</h3>
          <p>Team Lead</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="team-member">
          <img src="images/pic23.jpg" alt="Team Member 3">
          <h3>Jitendar</h3>
          <p>Team Member</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2024 Event University Management. All rights reserved.</p>
  <p><a href="index.jsp">Back to Home</a></p>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
