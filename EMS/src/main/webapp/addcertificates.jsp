<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Certificate</title>
<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    body {
        background-image: url('images/cer-img.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    .navbar {
        width: 100%;
        background-color: #4a148c;
        overflow: hidden;
        display: flex;
        justify-content: space-between; /* Space between items */
        align-items: center;
        padding: 14px 20px;
        position: fixed;
        top: 0;
        z-index: 1000;
        animation: fadeIn 1s ease-in-out;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    }

    .navbar .logo {
        font-size: 24px;
        font-weight: bold;
        color: #fff;
    }

    .navbar a {
        float: left;
        display: block;
        color: #fff;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
        font-size: 17px;
        transition: background-color 0.3s, color 0.3s;
    }

    .navbar a:hover {
        background-color: #6a1b9a;
        color: #ffeb3b; /* Yellow color for hover effect */
    }

    .navbar-right {
        display: flex;
        align-items: center;
    }

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        padding-top: 80px; /* Add padding to account for the fixed navbar */
        animation: fadeIn 1s ease-in-out;
    }

    .card {
        background-color: rgba(74, 20, 140, 0.9); /* Semi-transparent purple */
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
        padding: 20px;
        text-align: center;
        transition: transform 0.3s ease-in-out;
    }

    .card:hover {
        transform: translateY(-10px);
    }

    h1 {
        color: #fff; /* White text */
        font-size: 24px;
        margin-bottom: 20px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .form-group label {
        color: #fff; /* White text */
        font-weight: bold;
        margin-right: 10px;
        width: 120px; /* Set a fixed width for labels */
        text-align: left;
    }

    .form-group input[type="text"] {
        width: calc(100% - 130px); /* Adjust width based on label width */
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        transition: border-color 0.3s ease;
    }

    .form-group input[type="text"]:focus {
        border-color: #6a1b9a;
        outline: none;
    }

    input[type="submit"] {
        background-color: #fff; /* White background */
        color: #6a1b9a; /* Purple text */
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #4a148c;
        color: #fff; /* White text */
    }
</style>
</head>
<body>
    <div class="navbar">
        
        <div class="navbar-right">
            <a href="admin.jsp">Home</a>
           
        </div>
    </div>

    <div class="content">
        <div class="card">
            <h1>Generate Certificate</h1>
            <form action="CertificateServlet" method="post">
                <div class="form-group">
                    <label for="name">Student Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="event">Event Name:</label>
                    <input type="text" id="event" name="event" required>
                </div>
                <div class="form-group">
                    <label for="completion_date">Completion Date:</label>
                    <input type="text" id="completion_date" name="completion_date" required>
                </div>
                <input type="submit" value="Generate Certificate">
            </form>
        </div>
    </div>
</body>
</html>
