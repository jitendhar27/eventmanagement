<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submission Received - Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
  text-align: center;
  background: #f0f0f0;
  margin: 0;
  padding-top: 70px;
  background-color: #E6E6FA;
}

h1 {
  font-size: 36px;
  color: #7d3f8c;
}

.message {
  font-size: 24px;
  color: #333;
  margin: 40px auto;
  padding: 20px;
  max-width: 600px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position: relative;
}

.message .highlight {
  color: #7d3f8c;
  font-weight: bold;
}

.message .icon {
  font-size: 50px;
  color: #7d3f8c;
  margin-bottom: 20px;
}

.gold-navbar {
  background-color: #a57fc0;
  padding: 10px;
  width: 100%;
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 999;
}

.gold-navbar a {
  color: white;
  text-decoration: none;
  font-size: 24px;
  margin: 0 20px;
  transition: 0.3s;
}

.gold-navbar a:hover {
  color: #7d3f8c;
}

.links {
  margin-top: 30px;
}

.links a {
  display: inline-block;
  margin: 10px;
  padding: 10px 20px;
  color: #7d3f8c;
  border: 1px solid #7d3f8c;
  border-radius: 5px;
  text-decoration: none;
  transition: 0.3s;
}

.links a:hover {
  background-color: #7d3f8c;
  color: white;
}
</style>
</head>
<body>

  <div class="gold-navbar">
    <a href="login.jsp">LOGIN</a>
    <a href="Gallery.jsp">EVENTS</a>
    <a href="AboutUs.jsp">ABOUT US</a>
    <a href="contactus.jsp">CONTACT US</a>
  </div>

  <div class="message">
    <div class="icon">✔️</div>
    <p><span class="highlight">Thank you</span> for your feedback. We appreciate you taking the time to get in touch with us.</p>
  </div>

  <div class="links">
    <a href="index.jsp">Go to Home</a>
    <a href="Gallery.jsp">View Events</a>
    <a href="AboutUs.jsp">Learn About Us</a>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
