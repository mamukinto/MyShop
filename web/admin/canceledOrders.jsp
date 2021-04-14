<%@ page import="model.CartProduct" %>
<%@ page import="model.Order" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="service.helpers.CartHelper" %>
<%@ page import="service.helpers.OrderHelper" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainPage-style.css">
    <title>Orders</title>
</head>
<body>
<%@include file="adminHeader.jsp" %>
<h1>Orders <i class="fas fa-file-contract"></i></h1>
<%
    String msg = request.getParameter("msg");
    if ("deliveredSuccess".equals(msg)) {
%>
<h1 class="success">Successfully marked as delivered</h1>
<%
} else if ("deliveredFail".equals(msg)) {
%>
<h1 class="fail">Couldn't mark order as delivered</h1>
<%
} else if ("canceledSuccess".equals(msg)) {
%>
<h1 class="success">Succesfully canceled order.</h1>
<%
} else if ("canceledFail".equals(msg)) {
%>
<h1 class="fail">Couldn't cancel order</h1>
<%
    }
%>
<hr>
<%
    List<Order> orders = null;
    try {
        orders = OrderHelper.getCanceledOrders();
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

<%@include file="/footer.jsp" %>
</body>
</html>