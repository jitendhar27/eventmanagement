package com.klef;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("resource")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");

        // Simple validation
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("login-register.jsp?error=Passwords do not match");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the database
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Nav@0801");

            // Check if username already exists
            String checkUsernameQuery = "SELECT * FROM student WHERE username = ?";
            ps = con.prepareStatement(checkUsernameQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Username already exists, set error message and forward back to register page
                request.setAttribute("errorMessage", "Username already exists");
                RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
                rd.forward(request, response);
            } else {
                // Username does not exist, proceed with insertion
                String insertQuery = "INSERT INTO student (username, password, email) VALUES (?, ?, ?)";
                ps = con.prepareStatement(insertQuery);
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);

                // Execute the query
                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    // Registration successful, redirect to login page
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                    // Registration failed for some reason
                    response.sendRedirect("login-register.jsp?error=Registration failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login-register.jsp?error=Registration failed");
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
