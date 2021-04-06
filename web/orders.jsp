<%@ page import="service.OrderDAO" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartProduct" %>
<%@ page import="service.CartHelper" %>
<%@ page import="service.OrderHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <title>Orders</title>
</head>
<body>
<%@include file="header.jsp" %>
<h1>Orders <i class="fas fa-file-contract"></i></h1>
<hr>
<%
    List<Order> orders = null;
    try {
        orders = OrderHelper.getOrdersByEmail((String) session.getAttribute("email"));
    } catch (ShopException e) {
        e.printStackTrace();
    }
    for (Order order : orders) {
%>
    <div class="orderContainer">
        <div class="mainInfo">
        <h1>ID : <%out.print(order.getId());%></h1>

            <table class="productContainerTable">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Quantity</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (CartProduct product : order.getProducts().getProducts()) {
                %>
                <tr>
                    <td><%out.print(product.getProduct().getId());%></td>
                    <td><%out.print(product.getProduct().getName());%></td>
                    <td><%out.print(product.getCount());%></td>
                </tr>
                <%
                        }
                %>

                </tbody>
            </table>
            <h1>Date : <%out.print(order.getFormattedDate());%></h1>
            <h1>Summary price: <%out.print(CartHelper.calculateSummaryPriceInCart(order.getProducts()));%></h1>
        </div>

        <div class="orderStatus">
            <h1>Status:</h1>
            <h1><%out.print(order.getStatus());%></h1>
        </div>
    </div>
<hr>
<%
    }
%>

<%@include file="footer.jsp" %>
</body>
</html>