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


public class deleteEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USERNAME = "SYSTEM";
    private static final String JDBC_PASSWORD = "Nav@0801";

    public deleteEvent() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String eventId = request.getParameter("eventId");

        // Validate form data
        if (eventId == null || eventId.trim().isEmpty()) {
            request.setAttribute("message", "Event ID is required.");
            request.getRequestDispatcher("delete-event.jsp").forward(request, response);
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Prepare SQL query to delete event
            String sql = "DELETE FROM events WHERE event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, eventId);

            // Execute delete
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Event deleted successfully.");
            } else {
                request.setAttribute("message", "Event ID not found.");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward to JSP page to display the result
        request.getRequestDispatcher("delete-event.jsp").forward(request, response);
    }
}
