package com.klef;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class registerEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle DB URL
    private static final String DB_USERNAME = "SYSTEM"; // Your DB username
    private static final String DB_PASSWORD = "Nav@0801"; // Your DB password

    public registerEvent() {
        super();
    }
    
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }

    // Handle POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve eventId and eventType from request
        String eventId = request.getParameter("eventId");
        String eventType = request.getParameter("eventType");

        // Retrieve the username from the session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        // Insert data into the booking table
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // SQL statement for inserting into booking table
            String sql = "INSERT INTO booking (username, event_id, event_type) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, eventId);
            stmt.setString(3, eventType);

            // Execute the update
            int rowsInserted = stmt.executeUpdate();

            // Check if insertion was successful
            if (rowsInserted > 0) {
                response.sendRedirect("register-success.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("registration-failed.jsp"); // Redirect to failure page
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("registration-failed.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registration-failed.jsp");
        } finally {
            // Close resources
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
            try { if (conn != null) conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
}
