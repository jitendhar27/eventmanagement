package com.klef;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class addEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "SYSTEM";
    private static final String DB_PASSWORD = "Nav@0801";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String eventId = request.getParameter("eventId");
        String eventName = request.getParameter("eventName");
        String eventPlace = request.getParameter("eventPlace");
        String eventTimeStr = request.getParameter("eventTime");
        String eventType = request.getParameter("eventType"); // New field
        Part filePart = request.getPart("eventImage");

        // Convert eventTime from 'YYYY-MM-DDTHH:MM' format to Timestamp
        Timestamp eventTime = null;
        if (eventTimeStr != null && !eventTimeStr.isEmpty()) {
            try {
                // Create a SimpleDateFormat object with the correct format
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                Date parsedDate = sdf.parse(eventTimeStr);
                eventTime = new Timestamp(parsedDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error parsing date. Please try again.");
                request.getRequestDispatcher("add-event.jsp").forward(request, response);
                return;
            }
        }

        // SQL query to insert data
        String sql = "INSERT INTO events (event_id, event_name, event_place, event_time, event_type, event_image) VALUES (?, ?, ?, ?, ?, ?)";

        // Load database driver and establish connection
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Set parameters
            pstmt.setString(1, eventId);
            pstmt.setString(2, eventName);
            pstmt.setString(3, eventPlace);
            pstmt.setTimestamp(4, eventTime);
            pstmt.setString(5, eventType); // New field

            // Handle file upload and set it as a BLOB in the database
            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream()) {
                    pstmt.setBlob(6, inputStream);
                }
            } else {
                pstmt.setNull(6, java.sql.Types.BLOB); // Handle case where no file is uploaded
            }

            // Execute update
            int rowsInserted = pstmt.executeUpdate();

            // Forward to add-event.jsp with appropriate message
            if (rowsInserted > 0) {
                request.setAttribute("message", "Event added successfully!");
            } else {
                request.setAttribute("message", "Error adding event. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL error
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        // Forward to add-event.jsp
        request.getRequestDispatcher("add-event.jsp").forward(request, response);
    }
}
