<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event University Management</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
  background-image: url('images/back.jpg');
  font-family: 'Helvetica', Arial, sans-serif;
  color: #333;
  text-align: center;
  background-color: #E6E6FA; /* Light purple background */
  margin: 0; /* Remove default body margin */
  display: flex;
  flex-direction: column;
  justify-content: space-between; /* Ensure footer is pushed to the bottom */
  min-height: 100vh;
}

h1 {
  font-size: 36px;
  color: #7d3f8c; /* Purple color */
}

h2 {
  color: #7d3f8c; /* Purple color */
}

p {
  font-size: 18px;
}

.gold-button {
  display: inline-block;
  background-color: #a57fc0; /* Light purple color */
  color: black;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  text-decoration: none;
  font-size: 24px;
  margin-bottom: 20px;
  position: relative;
  transition: 0.3s;
}

.gold-button:hover {
  background-color: #8a3c9e; /* Darker purple on hover */
  color: white;
}

.gold-button::before {
  content: '';
  position: absolute;
  width: 0;
  height: 3px;
  bottom: -3px;
  left: 50%;
  background-color: #7d3f8c; /* Purple color */
  transition: 0.3s;
}

.gold-button:hover::before {
  width: 100%;
  left: 0;
}

.gold-navbar {
  background-color: #a57fc0; /* Light purple color for the navbar */
  padding: 10px;
  width: 100%;
  display: flex;
  justify-content: flex-start; /* Align contents to the left */
  position: fixed;
  top: 0;
  left: 0;
  z-index: 999;
}

.gold-navbar a {
  color: white; /* White text color for navbar links */
  text-decoration: none;
  font-size: 24px;
  margin: 0 20px;
  transition: 0.3s;
}

.gold-navbar a:hover {
  color: #7d3f8c; /* Purple color on hover */
}

.carousel {
  width: 100%; /* Full width of the container */
  height: 400px; /* Fixed height for a consistent look */
  margin: 20px auto; /* Center the carousel */
  overflow: hidden; /* Hide overflow for a cleaner look */
}

.carousel-item img {
  width: 100%;
  height: 100%; /* Maintain aspect ratio */
  object-fit: cover; /* Cover the container area */
}

footer {
  background-color: #a57fc0; /* Light purple footer background */
  color: #fff;
  padding: 20px 0;
  text-align: center;
  width: 100%;
  position: relative;
  bottom: 0;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.footer-content > div {
  flex: 1;
  min-width: 200px;
  padding: 10px;
}

.footer-content h5 {
  margin-bottom: 20px;
  font-size: 18px;
}

.footer-content p {
  margin: 0;
  font-size: 14px;
}

.footer-content a {
  color: #fff;
  text-decoration: none;
  margin: 0 10px;
  font-size: 18px;
}

/* Card Styles */
.card-container {
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  padding: 20px;
  margin-bottom: 20px;
  text-align: center;
}

.card-container h2 {
  margin-bottom: 15px;
  color: #7d3f8c; /* Purple color */
}

.card-container p {
  font-size: 16px;
  color: #666;
}

.card-container .gold-button {
  margin-top: 15px;
}

/* Testimonials Section */
.testimonials {
  padding: 40px 0;
  background-color: #f9f9f9;
}

.testimonial-card {
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
  margin: 10px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.testimonial-card .quote {
  font-size: 18px;
  color: #666;
}

.testimonial-card .author {
  margin-top: 15px;
  font-size: 16px;
  font-weight: bold;
  color: #333;
}

/* Enhanced CSS for better look */
.container {
  padding: 20px;
}

.row {
  display: flex;
  justify-content: center;
}

.col-md-6 {
  margin-bottom: 20px;
}

h2 {
  font-size: 28px;
  margin-bottom: 20px;
}

@media (max-width: 768px) {
  .gold-navbar {
    flex-direction: column;
  }

  .gold-navbar a {
    margin: 10px 0;
  }

  .col-md-6 {
    width: 100%;
  }
}
</style>
</head>
<body>

  <div class="gold-navbar">
    <a href="login.jsp">LOGIN</a>
    <a href="AboutUs.jsp">ABOUT US</a>
    <a href="contactus.jsp">CONTACT US</a>
  </div>

  <br/>
  <br/>
  <br/>

  <h1>Welcome to Event University Management</h1>
  <p>Event University Management provides a platform for managing and organizing events efficiently.</p>
  <p>Here how you can get started:</p>

  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="card-container">
          <h2>Login</h2>
          <p>If you already have an account, click the login button below to access your dashboard and manage your events.</p>
          <a href="login.jsp" class="gold-button">Login</a>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card-container">
          <h2>Register</h2>
          <p>If you are new, click the register button below to create an account and start managing your events with us.</p>
          <a href="login-register.jsp" class="gold-button">Register</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Carousel Section -->
  <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="2000">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/pic1.png" class="d-block w-100" alt="Event Image 1">
      </div>
      <div class="carousel-item">
        <img src="images/pic2.jpeg" class="d-block w-100" alt="Event Image 2">
      </div>
      <div class="carousel-item">
        <img src="images/pic3.png" class="d-block w-100" alt="Event Image 3">
      </div>
    </div>
  </div>

  <!-- Testimonials Section -->
  <section class="testimonials">
    <div class="container">
      <h2>What Our Users Say</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="testimonial-card">
            <p class="quote">"This platform has transformed how we manage our events. Highly recommended!"</p>
            <p class="author">- Alex Johnson</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="testimonial-card">
            <p class="quote">"User-friendly and efficient. The best event management tool we've used."</p>
            <p class="author">- Maria Garcia</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="testimonial-card">
            <p class="quote">"Excellent customer support and powerful features. We love it!"</p>
            <p class="author">- David Lee</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer>
    <div class="footer-content">
      <div>
        <h5>Event University Management</h5>
        <p>&copy; 2024. All Rights Reserved.</p>
      </div>
      <div>
        <h5>Quick Links</h5>
        <a href="contactus.jsp">Contact</a>
        <a href="aboutus.jsp">About</a>
      </div>
    </div>
  </footer>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
