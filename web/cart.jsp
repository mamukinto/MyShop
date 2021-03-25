<%@ page import="model.Cart" %>
<%@ page import="model.CartProduct" %>
<%@ page import="service.CartHelper" %>
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
        <h2 class="cardInfo">Product ID: <%out.print(product.getProduct().getId());%></h2>
        <h2 class="cardInfo">Product Name: <%out.print(product.getProduct().getName());%></h2>
        <h2 class="cardInfo">Product Quantity: <%out.print(product.getCount());%></h2>
    </div>
<%
    }
%>
    <h1>Summary price: <%out.print(summaryPrice);%></h1>
    <button>Make order <i class='fab fa-elementor'></i></button>

<%@include file="footer.jsp" %>
</body>
</html>