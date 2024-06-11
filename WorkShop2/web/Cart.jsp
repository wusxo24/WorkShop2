<%-- 
    Document   : viewCart
    Created on : Jun 3, 2024, 4:35:08 PM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Cart"%>
<%@page import="DTO.Mobile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }
            h1 {
                color: green;
            }
            table {
                border-collapse: collapse;
                width: 80%;
                margin-bottom: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .total {
                color: blue;
            }
            
            td input[name="Description"] {
                width: 300px;
            }

            td input[name="MobileId"],
            td input[name="Price"],
            td input[name="MobileName"],
            td input[name="YearOfProduction"],
            td input[name="Quantity"] {
                width: 100px;
            }
        </style>
    </head>
    <body>
        <h1>Your Cart</h1>
        <%
            List<Mobile> UpdatedSearchList = (List<Mobile>) session.getAttribute("SearchPriceList");
            String message = (String) session.getAttribute("Cartmessage");
            Cart cart = (Cart) session.getAttribute("Cart");
            if (cart != null) {
        %>          
        <h3 style='color:green'><%= message != null ? message : ""%></h3>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Mobile ID</th>
                    <th>Mobile Name</th>
                    <th>Quantity</th>
                    <th>Price per Unit</th>
                    <th>Total price</th>
                    <th colspan="2">Edit Cart</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (Mobile p : cart.getCart().values()) {
                        total = total + (p.getPrice() * p.getCartAmount());
                %>

                <tr>
            <form action="CartMainServlet" method="POST" style="display:inline;">
                <td><%= count++%></td>
                <td><%= p.getMobileId()%></td>
                <input type = "hidden" name = "MobileId" value = "<%= p.getMobileId()%>">
                <td><%= p.getMobileName()%></td>
                <input type = "hidden" name = "MobileName" value = "<%= p.getMobileName()%>">
                <td class = 's'><input type = "number" name = "CartAmount" value ="<%= p.getCartAmount()%>" min="1" max="<%=p.getQuantity()%>"> </td>
                <td><%= p.getPrice()%></td>
                <input type = "hidden" name = "Price" value = "<%= p.getPrice()%>">
                <input type = "hidden" name = "Quantity" value = "<%= p.getQuantity()%>">
                <td><%= p.getPrice() * p.getCartAmount()%>$</td>
                <td><input type="submit" name="action" value="Change"></td>
                <td><input type="submit" name="action" value="Remove"></td>
            </form>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<h2 class="total">Total: <%= total%>$</h2>
<% } else { %>
<h2>Your cart is empty.</h2>
<% }%>
<form action="User.jsp" method="POST">
    <input type="hidden" name="SearchPriceList" value="<%=UpdatedSearchList%>">
    <input type="submit" value="Continued Shopping">
</form>
</body>
</html>
