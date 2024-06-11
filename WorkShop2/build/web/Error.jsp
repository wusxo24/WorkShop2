<%-- 
    Document   : error.jsp
    Created on : Jun 6, 2024, 10:00:00 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .error-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                width: 100%;
                text-align: center;
            }
            h1 {
                color: #e74c3c;
                margin-bottom: 20px;
            }
            p {
                color: #333;
                margin-bottom: 10px;
            }
            a {
                color: #3498db;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h1>Oops! Something went wrong.</h1>
            <p>We're sorry, but an unexpected error has occurred.</p>
            <p>Please try again later or go back to the <a href="Login.jsp">Login Page</a>.</p>
        </div>
    </body>
</html>
