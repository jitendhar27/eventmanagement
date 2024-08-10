<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Certificates</title>
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
    h1 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #5a2d6d; /* Darker purple */
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    .download-btn {
        display: inline-block;
        background-color: #5a2d6d; /* Darker purple */
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }
    .download-btn:hover {
        background-color: #4a1e5a; /* Slightly darker purple on hover */
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="welcome.jsp">Home</a>
        <a href="myevents.jsp">My Events</a>
        <a href="eventRegistration.jsp">Event Registration</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="contactus.jsp">Contact Us</a>
    </div>
    <div class="container">
        <h1>My Certificates</h1>
        <%
            // Database connection details
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUsername = "SYSTEM";
            String dbPassword = "Nav@0801";
            String username = (String) session.getAttribute("username"); // Assume username is stored in session
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Load the database driver
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                
                // SQL query to fetch certificates based on username
                String sql = "SELECT username, event_name, certificate_date FROM student_certificates WHERE username = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Event Type</th>
                    <th>Certificate Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        String Cusername = rs.getString("username");
                        String eventType = rs.getString("event_name");
                        String certificateDate = rs.getString("certificate_date"); // Assuming this is a date or path
                %>
                <tr>
                    <td><%= Cusername %></td>
                    <td><%= eventType %></td>
                    <td><%= certificateDate %></td>
                    <td><a href="downloadCertificate?username=<%= Cusername %>&event=<%= eventType %>" class="download-btn">Download Certificate</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
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
