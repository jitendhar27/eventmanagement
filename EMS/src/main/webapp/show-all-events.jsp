<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show All Events - Admin - Event University Management</title>
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
            background-color: #5a2d6d; /* Darker purple */
            padding: 15px;
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
            margin-bottom: 10px; /* Space between nav items */
        }

        .sidebar {
            background-color: #7d3f8c; /* Purple background for sidebar */
            height: 100%;
            width: 250px;
            padding: 20px;
            position: fixed;
            top: 0;
            left: -250px;
            transition: left 0.3s ease;
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
            transition: margin-left 0.3s ease;
        }

        .container.shifted {
            margin-left: 270px; /* Adjusted margin when sidebar is shown */
        }

        h2 {
            color: #7d3f8c; /* Purple color for the header */
            margin-bottom: 20px;
            text-align: center;
            font-size: 28px;
        }

        .toggle-btn {
            font-size: 24px;
            cursor: pointer;
            color: #fff; /* White color for toggle button */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #5a2d6d; /* Darker purple for table header */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .alert {
            margin-top: 20px;
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
                <a class="nav-link" href="delete-event.jsp">Delete Event</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Logout</a>
            </li>
        </ul>
    </nav>

    <!-- Main content -->
    <div class="container" id="main-content">
        <h2>All Events</h2>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Event ID</th>
                    <th>Event Type</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Database connection details
                    String url = "jdbc:oracle:thin:@localhost:1521:xe";
                    String user = "SYSTEM";
                    String password = "Nav@0801";
                    
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load and register the JDBC driver (MySQL example)
                        Class.forName("oracle.jdbc.driver.OracleDriver");

                        // Establish the connection
                        conn = DriverManager.getConnection(url, user, password);

                        // Create a statement
                        stmt = conn.createStatement();

                        // Execute a query
                        String sql = "SELECT username, event_id, event_type FROM booking";
                        rs = stmt.executeQuery(sql);

                        // Iterate through the result set
                        while (rs.next()) {
                            String username = rs.getString("username");
                            int eventId = rs.getInt("event_id");
                            String eventType = rs.getString("event_type");
                %>
                            <tr>
                                <td><%= username %></td>
                                <td><%= eventId %></td>
                                <td><%= eventType %></td>
                            </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
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
