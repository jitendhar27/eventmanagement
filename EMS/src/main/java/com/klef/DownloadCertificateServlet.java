package com.klef;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class DownloadCertificateServlet
 */
@WebServlet("/downloadCertificate")
public class DownloadCertificateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String event = request.getParameter("event");

        if (username == null || username.isEmpty() || event == null || event.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing username or event.");
            return;
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Nav@0801");

            String sql = "SELECT CERTIFICATE, USERNAME FROM student_certificates WHERE USERNAME = ? AND EVENT_NAME = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, event);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                byte[] certificateBytes = rs.getBytes("CERTIFICATE");

                // Set the response headers for file download
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + username + "_Certificate.pdf\"");

                // Write the certificate to the response output stream
                OutputStream out = response.getOutputStream();
                out.write(certificateBytes);
                out.flush();
                out.close();
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Certificate not found.");
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving certificate.");
        }
	}

	

}
