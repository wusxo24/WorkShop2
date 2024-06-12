<%-- 
    Document   : User.jsp
    Created on : Jun 6, 2024, 10:35:00 AM
    Author     : Acer
--%>
<%@page import="java.util.Map"%>
<%@page import="DTO.Mobile"%>
<%@page import="java.util.List"%>
<%@page import="DAO.MobileDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .container {
                width: 80%;
                margin: auto;
                overflow: hidden;
            }
            form {
                text-align: center;
                margin-bottom: 20px;
            }
            input[type="search"] {
                padding: 10px;
                width: 300px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #5cb85c;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
                color: #333;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #0275d8;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                margin-bottom: 20px;
                text-align: center;
            }
            a:hover {
                background-color: #025aa5;
            }
            .search-form {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
            }
            .search-form .form-group {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                width: 100%;
                max-width: 300px;
            }
            .search-form label {
                font-weight: bold;
                margin-bottom: 5px;
            }
            .search-form input[type="number"] {
                padding: 10px;
                width: 100%;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .search-form .btn {
                padding: 10px 20px;
                background-color: #5cb85c;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            .search-form .btn:hover {
                background-color: #4cae4c;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                String fullName = (String) session.getAttribute("Name");
            %>
            <h1>Welcome User <%= fullName != null ? fullName : ""%>!</h1>
            <form action="SearchPriceServlet" method="get" class="search-form">
                <div class="form-group">
                    <label for="min">Search with price in range:</label>
                    <input type="number" id="min" name="min" placeholder="Minimum Price" required>
                </div>
                <div class="form-group">
                    <input type="number" id="max" name="max" placeholder="Maximum Price" required>
                </div>
                <input type="submit" value="Search" class="btn">
            </form>
            <a href="LogoutServlet">Logout</a>
            <a href="Cart.jsp">View Cart</a>
            <%
                List<Mobile> SearchPriceList = (List<Mobile>) session.getAttribute("SearchPriceList");
                String message = (String) session.getAttribute("message");
            %>
            <h3 style='color:green'><%= message != null ? message : ""%></h3>
            <%
                if (SearchPriceList != null && !SearchPriceList.isEmpty()) {
            %>
            <table>
                <thead>

                    <tr>
                        <th>Mobile ID</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Mobile Name</th>
                        <th>Year of Production</th>
                        <th>Number of devices left</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Mobile mobile : SearchPriceList) {
                    %>
                    <tr>
                <form action="CartMainServlet" method="post">
                    <td><%= mobile.getMobileId()%>  </td>
                    <input type="hidden" name="MobileId" value="<%=mobile.getMobileId()%>">
                    <td><%= mobile.getDescription()%></td>
                    <input type="hidden" name="MobileDescription" value="<%=mobile.getDescription()%>">
                    <td><%= mobile.getPrice()%></td>
                    <input type="hidden" name="MobilePrice" value="<%=mobile.getPrice()%>">
                    <td><%= mobile.getMobileName()%></td>
                    <input type="hidden" name="MobileName" value="<%=mobile.getMobileName()%>">
                    <td><%= mobile.getYearOfProduction()%></td>
                    <input type="hidden" name="MobileYearOfProduction" value="<%=mobile.getYearOfProduction()%>">
                    <td><%= mobile.getQuantity()%></td>
                    <input type="hidden" name="MobileQuantity" value="<%=mobile.getQuantity()%>">
                    <td><input type="number" name="CartAmount" value="<%=1%>" min="1" max="<%= mobile.getQuantity()%>"></td>
                    <td><input type="submit" value="Add to Cart" name="action"></td>
                </form>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
