<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Event University Management</title>
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
        form {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        form input[type="text"], form input[type="email"], form textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        form button[type="submit"] {
            background-color: #7d3f8c;
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        form button[type="submit"]:hover {
            background-color: #8a3c9e;
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
    </style>
</head>
<body>
    <div class="gold-navbar">
        <a href="login.jsp">LOGIN</a>
        <a href="Gallery.jsp">EVENTS</a>
        <a href="AboutUs.jsp">ABOUT US</a>
        <a href="contactus.jsp">CONTACT US</a>
    </div>

    <h1>Contact Us</h1>
    <form action="contactus.jsp" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
        <button type="submit">Submit</button>
    </form>

    <% 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (name != null && email != null && message != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Database connection details
                String url = "jdbc:oracle:thin:@localhost:1521:xe";
                String user = "SYSTEM";
                String password = "Nav@0801";

                // Load and register the JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish the connection
                conn = DriverManager.getConnection(url, user, password);

                // Prepare the SQL statement
                String sql = "INSERT INTO feedback (username, email, feedback) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, message);

                // Execute the insert
                int rowsInserted = pstmt.executeUpdate();

                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    response.sendRedirect("contactus-submission.jsp");
                } else {
                    out.println("Error: Unable to submit feedback.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            } finally {
                // Close resources
                try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
