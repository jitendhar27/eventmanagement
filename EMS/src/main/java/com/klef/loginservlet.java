package com.klef;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class loginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve form parameters
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Debug: print received credentials
        System.out.println("Received Username: " + username);
        System.out.println("Received Password: " + password);

        // Check if the user is admin
        if ("admin".equals(username) && "admin".equals(password)) {
            // Debug: admin credentials detected
            System.out.println("Admin credentials detected, redirecting to admin.jsp");
            
            // Redirect to admin page
            res.sendRedirect("admin.jsp");
            return;
        }

        // Database connection parameters
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String jdbcUser = "SYSTEM";
        String jdbcPassword = "Nav@0801";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load Oracle JDBC Driver
            con = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
            String sql = "SELECT * FROM student WHERE username = ? AND password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query
            rs = ps.executeQuery();

            // Check if user exists
            if (rs.next()) {
                // Authentication successful, create a session
                HttpSession session = req.getSession();
                session.setAttribute("username", username);

                // Redirect to welcome page
                res.sendRedirect("welcome.jsp");
            } else {
                // Authentication failed, redirect back to login page with error message
                res.sendRedirect("login.jsp?error=InvalidCredentials");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                throw new ServletException(ex);
            }
        }
    }
}
