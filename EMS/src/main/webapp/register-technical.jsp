<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.InputStream, java.io.ByteArrayOutputStream, java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register for Technical Events</title>
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
.container {
  background-color: rgba(255, 255, 255, 0.9);
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 1200px;
  margin: 20px auto;
}
h2 {
  color: #7d3f8c;
  text-align: center;
  margin-bottom: 30px;
}
.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border: none;
  margin-bottom: 30px;
}
.card-img-top {
  height: 200px;
  object-fit: cover;
}
.card-body {
  text-align: center;
}
.card-title {
  font-size: 1.5rem;
  color: #7d3f8c;
}
.btn-primary {
  background-color: #7d3f8c;
  border: none;
}
.btn-primary:hover {
  background-color: #5a2e6f;
}
.navbar {
  margin-bottom: 30px;
  background-color: #7d3f8c;
}
.navbar-brand,
.nav-link {
  color: white !important;
}
.nav-link:hover {
  color: #ddd !important;
}
</style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="welcome.jsp">Event Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item"><a class="nav-link" href="welcome.jsp">Home</a></li>
      <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
      <li class="nav-item"><a class="nav-link" href="event-registration.jsp">Event Registration</a></li>
      <li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About Us</a></li>
      <li class="nav-item"><a class="nav-link" href="contactus.jsp">Contact Us</a></li>
      <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
    </ul>
  </div>
</nav>

<div class="container">
  <h2>Register for Technical Events</h2>

  <!-- Technical Events Gallery -->
  <div class="row">
    <% 
      // Database connection setup
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;

      String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle DB URL
      String dbUsername = "SYSTEM"; // Your DB username
      String dbPassword = "Nav@0801"; // Your DB password

      try {
        // Load Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish connection
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        String sql = "SELECT * FROM events WHERE event_type = 'Technical'";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        
        while (rs.next()) {
          String eventId = rs.getString("event_id");
          String eventName = rs.getString("event_name");
          String eventPlace = rs.getString("event_place");
          String eventTime = rs.getString("event_time");

          // Handling BLOB data
          Blob blob = rs.getBlob("event_image");
          String eventImage = "";
          if (blob != null) {
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            
            while ((bytesRead = inputStream.read(buffer)) != -1) {
              outputStream.write(buffer, 0, bytesRead);
            }
            
            byte[] imageBytes = outputStream.toByteArray();
            eventImage = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imageBytes);
          }
    %>
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="<%= eventImage %>" class="card-img-top" alt="<%= eventName %>">
        <div class="card-body">
          <h5 class="card-title"><%= eventName %></h5>
          <p class="card-text">Details about <%= eventName %>.</p>
          <p><strong>Date:</strong> <%= eventTime %></p>
          <p><strong>Venue:</strong> <%= eventPlace %></p>
          <a href="registerevent?eventId=<%= eventId %>&eventType='Technical'" class="btn btn-primary">Register</a>

        </div>
      </div>
    </div>
    <% 
        }
      } catch (ClassNotFoundException e) {
        out.println("<div class='alert alert-danger'>ClassNotFoundException: " + e.getMessage() + "</div>");
      } catch (SQLException e) {
        out.println("<div class='alert alert-danger'>SQLException: " + e.getMessage() + "</div>");
      } catch (IOException e) {
        out.println("<div class='alert alert-danger'>IOException: " + e.getMessage() + "</div>");
      } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
        try { if (conn != null) conn.close(); } catch (SQLException e) { /* ignored */ }
      }
    %>
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
