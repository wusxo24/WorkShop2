<%@page import="java.util.List"%>
<%@page import="DTO.Mobile"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
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

            /* Add custom styles for inputs */
            td input[type="text"],
            td input[type="number"],
            td select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }

            td input[name="txtMobileName"]{
                width: 200px; 
            }
            td input[name="txtDescription"] {
                width: 300px; 
            }

            td input[name="txtMobileId"],
            td input[name="txtPrice"],
            td input[name="txtYearOfProduction"],
            td input[name="txtQuantity"] {
                width: 100px; 
            }

        </style>
    </head>
    <body>
        <div class="container">
            <%
                String fullName = (String) session.getAttribute("Name");
            %>
            <h1>Welcome Staff <%= fullName != null ? fullName : ""%>!</h1>
            <form action="SearchServlet" method="get">
                Search: <input type="search" name="SearchValue">
                <input type="submit" value="Search">
            </form>
            <a href="LogoutServlet">Logout</a>
            <a href="Add.jsp">Add device</a><br>
            <%
                List<Mobile> SearchList = (List<Mobile>) session.getAttribute("SearchList");
                String message = (String) session.getAttribute("message");
            %>
            <h3 style='color:green'><%= message != null ? message : ""%></h3>
            <%
                if (SearchList != null && !SearchList.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Mobile ID</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Mobile Name</th>
                        <th>Year of Production</th>
                        <th>Quantity</th>
                        <th>Not Sale</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Mobile mobile : SearchList) {
                    %>
                    <tr>
                <form action="StaffMainServlet" method="post">
                    <td><input type="text" id="txtMobileId" name="txtMobileId" value="<%= mobile.getMobileId()%>"></td>
                    <td><input type="text" id="txtDescription" name="txtDescription" value="<%= mobile.getDescription()%>"></td>
                    <td><input type="number" id="txtPrice" name="txtPrice" value="<%= mobile.getPrice()%>"></td>
                    <td><input type="text" id="txtMobileName" name="txtMobileName" value="<%= mobile.getMobileName()%>"></td>
                    <td><input type="number" id="txtYearOfProduction" name="txtYearOfProduction" value="<%= mobile.getYearOfProduction()%>"></td>
                    <td><input type="number" id="txtQuantity" name="txtQuantity" value="<%= mobile.getQuantity()%>"></td>
                    <td>
                        <select id="notSale" name="notSale">
                            <option value="true" <%= mobile.getNotSale() ? "selected" : ""%>>True</option>
                            <option value="false" <%= !mobile.getNotSale() ? "selected" : ""%>>False</option>
                        </select>
                    </td>
                    <td><input type="submit" value="Delete" name="action"></td>
                    <td><input type="submit" value="Update" name="action"></td>
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
