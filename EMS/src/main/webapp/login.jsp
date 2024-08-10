<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
 body {
  background-image: url('images/back.jpg');
  background-size: cover;
  background-position: center;
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
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
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 400px;
  margin: 80px auto; /* Center the container and add space from the navbar */
}

h2 {
  color: #7d3f8c; /* Purple color for the header */
  margin-bottom: 20px;
  text-align: center;
  font-size: 28px; /* Increased font size for header */
}

.form-group label {
  color: #7d3f8c; /* Purple color for labels */
  font-weight: bold; /* Bold labels */
}

.form-control {
  border-color: #7d3f8c; /* Purple border color */
  border-radius: 5px; /* Rounded borders for input fields */
}

.form-control:focus {
  border-color: #8a3c9e; /* Darker purple on focus */
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}

.btn-primary {
  background-color: #7d3f8c; /* Purple color for the submit button */
  border-color: #7d3f8c; /* Purple border color */
  border-radius: 5px; /* Rounded corners for the button */
}

.btn-primary:hover {
  background-color: #8a3c9e; /* Darker purple on hover */
  border-color: #8a3c9e; /* Darker purple border on hover */
}

a {
  color: #7d3f8c; /* Purple color for links */
}

a:hover {
  color: #8a3c9e; /* Darker purple on hover */
}

.text-center a {
  font-weight: bold; /* Bold text for links */
  text-decoration: none; /* Remove underline from links */
}

.text-center a:hover {
  text-decoration: underline; /* Underline on hover */
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="index.jsp">Home</a>
</nav>

<div class="container">
  <h2>Login</h2>
  <form action="login" method="post">
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" class="form-control" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Login</button>
    <p class="text-center mt-3">
      <a href="login-register.jsp">Don't have an account? Register here</a>
    </p>
  </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
