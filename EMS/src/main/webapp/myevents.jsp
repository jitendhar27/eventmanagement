<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Events</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('images/pic14.jpg'); /* Update this path to your background image */
        background-size: cover;
        color: #FFFFFF;
        margin: 0;
        padding: 0;
    }
    .navbar {
        overflow: hidden;
        background-color: #800080; /* Purple color */
        position: fixed; /* Fixed to the top */
        top: 0;
        width: 100%;
    }
    .navbar a {
        float: right; /* Align links to the right */
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
        width: 80%;
        margin: 100px auto 0; /* Add top margin to avoid overlap with navbar */
        background-color: rgba(128, 0, 128, 0.8); /* Purple with opacity */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1, h2 {
        text-align: center;
    }
    .event-card {
        background-color: #4B0082; /* Indigo color for event cards */
        margin: 20px 0;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .event-title {
        font-size: 1.5em;
        margin-bottom: 10px;
    }
    .event-description {
        font-size: 1em;
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="welcome.jsp">Home</a>
        <a href="myevents.jsp">MY Events</a>
        <a href="eventRegistration.jsp">Event Registration</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="contactus.jsp">Contact Us</a>
    </div>
    <div class="container">
        <h1>My Events</h1>
        <%
            // Replace with your Oracle database connection details
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUsername = "SYSTEM";
            String dbPassword = "Nav@0801";
            String username = (String) session.getAttribute("username"); // Assume username is stored in session
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                
                String sql = "SELECT event_id, event_type FROM booking WHERE username = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int eventId = rs.getInt("event_id");
                    String eventType = rs.getString("event_type");
        %>
                    <div class="event-card">
                        <div class="event-title">Event ID: <%= eventId %></div>
                        <div class="event-description">Event Type: <%= eventType %></div>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>
