package com.klef;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/CertificateServlet")
public class CertificateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("name");
        String event = request.getParameter("event");
        String completionDate = request.getParameter("completion_date");

        try (PDDocument document = new PDDocument()) {
            PDPage page = new PDPage();
            document.addPage(page);

            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
                // Set the font to Times-Roman Bold
            	contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 750);
                contentStream.showText("Certificate of Completion");
                contentStream.endText();

                // Set the font to Times-Roman
                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 700);
                contentStream.showText("This is to certify that");
                contentStream.endText();

                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 660);
                contentStream.showText(studentName);
                contentStream.endText();

                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 620);
                contentStream.showText("has successfully completed the event");
                contentStream.endText();

                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 580);
                contentStream.showText(event);
                contentStream.endText();

                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(200, 540);
                contentStream.showText("on " + completionDate);
                contentStream.endText();

                contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 14);
                contentStream.beginText();
                contentStream.newLineAtOffset(100, 500);
                contentStream.showText("Signature: __________________________");
                contentStream.endText();

                contentStream.beginText();
                contentStream.newLineAtOffset(100, 480);
                contentStream.showText("Date: __________________________");
                contentStream.endText();
            }

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            document.save(baos);
            byte[] pdfBytes = baos.toByteArray();

            // Store the PDF in the Oracle database
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Nav@0801");
                String sql = "INSERT INTO student_certificates (USERNAME, EVENT_NAME, CERTIFICATE_DATE, certificate) VALUES (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, studentName);
                pstmt.setString(2, event);
                pstmt.setString(3, completionDate);
                pstmt.setBytes(4, pdfBytes);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    response.setContentType("text/html");
                    response.getWriter().write("<p>Certificate generated and stored in the database successfully.</p>");
                } else {
                    response.setContentType("text/html");
                    response.getWriter().write("<p>Failed to store the certificate in the database.</p>");
                }

                pstmt.close();
                conn.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.setContentType("text/html");
                response.getWriter().write("<p>Error: " + e.getMessage() + "</p>");
            }
        }
    }
}
