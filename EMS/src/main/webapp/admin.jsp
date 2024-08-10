<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    font-family: 'Helvetica', Arial, sans-serif;
    color: #333;
    background-image: url('images/adminpic2.jpg'); /* Path to your background image */
    background-size: cover;
    background-position: center;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
  }

  .navbar {
    background-color: #5a2d6d; /* Changed to a darker purple */
    padding: 15px; /* Add some padding to the navbar */
  }

  .navbar-brand {
    color: #fff; /* White color for brand name */
    font-weight: bold;
  }

  .nav-link {
    color: #fff; /* White color for navbar links */
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
    padding: 10px 15px;
  }

  .nav-link:hover {
    color: #d9a8c2; /* Light purple color on hover */
  }

  .nav-item {
    margin-bottom: 10px; /* Add space between nav items */
  }

  .sidebar {
    background-color: #7d3f8c; /* Purple background for sidebar */
    height: 100%; /* Full height */
    width: 250px; /* Fixed width for sidebar */
    padding: 20px; /* Add some padding to the sidebar */
    position: fixed; /* Fix sidebar to the left */
    top: 0;
    left: -250px; /* Initially hidden */
    transition: left 0.3s ease; /* Smooth slide-in effect */
  }

  .sidebar.active {
    left: 0; /* Show sidebar when active */
  }

  .container {
    flex: 1;
    padding: 30px;
    background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin-top: 20px; /* Space from navbar */
    margin-left: 20px; /* Initial margin */
    transition: margin-left 0.3s ease; /* Smooth margin adjustment */
  }

  .container.shifted {
    margin-left: 270px; /* Adjusted margin when sidebar is shown */
  }

  h2 {
    color: #7d3f8c; /* Purple color for the header */
    margin-bottom: 20px;
    text-align: center;
    font-size: 28px; /* Increased font size for header */
  }

  .toggle-btn {
    font-size: 24px;
    cursor: pointer;
    color: #fff; /* White color for toggle button */
  }
</style>
</head>
<body>

<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="index.jsp">Home</a>
  <span class="toggle-btn" onclick="toggleSidebar()">&#9776;</span>
</nav>

<div class="d-flex">
  <!-- Sidebar -->
  <nav class="sidebar" id="sidebar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="add-event.jsp">Add Event</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="update-event.jsp">Update Event</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="show-all-events.jsp">Show All Events</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addcertificates.jsp">Generate Certificate</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewAllCertificates.jsp">View All Certificates</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="delete-event.jsp">Delete Event</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Logout</a>
      </li>
    </ul>
  </nav>

  <!-- Main content -->
  <div class="container" id="main-content">
    <h2>Welcome, Admin</h2>
    <!-- Admin functionalities can be added here -->
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  function toggleSidebar() {
    document.getElementById('sidebar').classList.toggle('active');
    document.getElementById('main-content').classList.toggle('shifted');
  }
</script>
</body>
</html>
