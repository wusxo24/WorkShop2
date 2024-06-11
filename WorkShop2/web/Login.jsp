<%-- 
    Document   : Login.jsp
    Created on : Jun 6, 2024, 9:53:49 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
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
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #333;
        }
        h3 {
            color: red; /* Change the text color to red */
            font-size: 18px; /* Adjust the font size */
            margin-top: 10px; /* Add some top margin for spacing */
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<%String message = (String) session.getAttribute("message");%>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="LoginServlet" method = "POST">
            <div class="form-group">
                <label for="userId">User ID:</label>
                <input type="text" id="userId" name="txtuserId">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="txtpassword">
            </div>
            <div class="form-group">
                <input type="submit" value="Login">
            </div>
        </form>
        <h3><%= message != null ? message : ""%></h3> 
    </div>

</body>

