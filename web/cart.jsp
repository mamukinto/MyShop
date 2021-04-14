<%@ page import="model.Cart" %>
<%@ page import="model.CartProduct" %>
<%@ page import="service.helpers.CartHelper" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%@include file="header.jsp" %>

<h2>Your cart <i class="fas fa-shopping-cart"></i></h2>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    double summaryPrice = CartHelper.calculateSummaryPriceInCart(cart);
    for (CartProduct product : cart.getProducts()) {
%>
<div class="cartProductContainer">
    <img src="data:image/jpeg;base64,<%out.print(product.getProduct().getImage().getBase64());%>" alt="">
    <h2 class="cardInfo">Product ID: <%out.print(product.getProduct().getId());%></h2>
    <h2 class="cardInfo">Product Name: <%out.print(product.getProduct().getName());%></h2>
    <h2 class="cardInfo">Product Quantity: <%out.print(product.getCount());%></h2>
    <div class="quantityButtons">
        <a href="actions/increaseProductQuantityAction.jsp?productId=<%out.print(product.getProduct().getId());%>">
            <button class="add"><i class="fas fa-plus"></i></button>
        </a>
        <a href="actions/decreaseProductQuantityAction.jsp?productId=<%out.print(product.getProduct().getId());%>">
            <button><i class="fas fa-minus"></i></button>
        </a>
    </div>
</div>
<%
    }
%>
<h1>Summary price: <%out.print(summaryPrice);%></h1>
<a href="actions/makeOrderFromCart.jsp">
    <button>Make order<i class='fab fa-elementor'></i></button>
</a>

<%
    String msg = request.getParameter("msg");
    if (msg != null) {
        if (msg.equals("success")) {
%>
<h1 class="success">Order successfully added! check <a href="orders.jsp">Orders</a> to view your orders</h1>
<%
} else if (msg.equals("fail")) {
%>
<h1 class="fail">Something went wrong. couldn't add order, Try again</h1>
<%
        }
    }
%>
<%@include file="footer.jsp" %>
</body>
</html>