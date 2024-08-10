package com.klef;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/updateevent")
@MultipartConfig
public class updateEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USERNAME = "SYSTEM";
    private static final String JDBC_PASSWORD = "Nav@0801";

    public updateEvent() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String eventId = request.getParameter("eventId");
        String eventName = request.getParameter("eventName");
        String eventPlace = request.getParameter("eventPlace");
        String eventTime = request.getParameter("eventTime"); // format: yyyy-MM-ddTHH:mm
        String eventType = request.getParameter("eventType");

        // Handle file upload
        Part filePart = request.getPart("eventImage"); // Retrieve the uploaded file part
        InputStream imageInputStream = null;
        
        if (filePart != null && filePart.getSize() > 0) {
            imageInputStream = filePart.getInputStream(); // Get InputStream of the uploaded file
        }

        // Validate form data
        if (eventId == null || eventName == null || eventPlace == null || eventTime == null || eventType == null ||
            eventId.trim().isEmpty() || eventName.trim().isEmpty() || eventPlace.trim().isEmpty() || eventTime.trim().isEmpty() || eventType.trim().isEmpty()) {
            request.setAttribute("message", "All fields are required.");
            request.getRequestDispatcher("update-event.jsp").forward(request, response);
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Convert eventTime from string to Timestamp
            Timestamp timestamp = null;
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                java.util.Date parsedDate = dateFormat.parse(eventTime);
                timestamp = new Timestamp(parsedDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
                request.setAttribute("message", "Invalid date format.");
                request.getRequestDispatcher("update-event.jsp").forward(request, response);
                return;
            }

            // Prepare SQL query to update event
            String sql = "UPDATE events SET event_name = ?, event_place = ?, event_time = ?, event_type = ?, event_image = ? WHERE event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, eventName);
            statement.setString(2, eventPlace);
            statement.setTimestamp(3, timestamp); // Use Timestamp for TIMESTAMP columns
            statement.setString(4, eventType);

            if (imageInputStream != null) {
                statement.setBlob(5, imageInputStream); // Update BLOB column with the image InputStream
            } else {
                statement.setNull(5, java.sql.Types.BLOB); // Set to NULL if no image is provided
            }
            statement.setString(6, eventId);

            // Execute update
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Event updated successfully.");
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
                if (imageInputStream != null) imageInputStream.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward to JSP page to display the result
        request.getRequestDispatcher("update-event.jsp").forward(request, response);
    }
}
