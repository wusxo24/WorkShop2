<%-- 
    Document   : Add.jsp
    Created on : Jun 9, 2024, 1:45:50 PM
    Author     : Acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Device</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 50%;
                margin: auto;
                overflow: hidden;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-top: 50px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            label {
                font-weight: bold;
                margin-bottom: 5px;
            }
            input[type="text"], input[type="number"], select {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
            }
            .field-container {
                display: flex;
                flex-direction: column;
                gap: 5px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #5cb85c;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Add New Mobile Device</h1>
            <form action="StaffMainServlet" method="post">
                <div class="field-container">
                    <label for="txtMobileId">Mobile ID</label>
                    <input type="text" id="txtMobileId" name="txtMobileId" required>
                </div>
                <div class="field-container">
                    <label for="txtDescription">Description</label>
                    <input type="text" id="txtDescription" name="txtDescription" required>
                </div>
                <div class="field-container">
                    <label for="txtPrice">Price</label>
                    <input type="number" id="txtPrice" name="txtPrice" step="0.01" required>
                </div>
                <div class="field-container">
                    <label for="txtMobileName">Mobile Name</label>
                    <input type="text" id="txtMobileName" name="txtMobileName" required>
                </div>
                <div class="field-container">
                    <label for="txtYearOfProduction">Year of Production</label>
                    <input type="number" id="txtYearOfProduction" name="txtYearOfProduction" required>
                </div>
                <div class="field-container">
                    <label for="txtQuantity">Quantity</label>
                    <input type="number" id="txtQuantity" name="txtQuantity" required>
                </div>
                <div class="field-container">
                    <label for="notSale">Not for Sale</label>
                    <select id="notSale" name="notSale">
                        <option value="false">False</option>
                        <option value="true">True</option>
                    </select>
                </div>
                <input type="submit" value="Add" name="action">
            </form>
        </div>
    </body>
</html>
