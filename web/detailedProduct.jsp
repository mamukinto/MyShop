<%@ page import="model.Product" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="service.ProductHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <title>Document</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
    Product thisProduct = null;
    try {
        thisProduct = ProductHelper.getProductById(Integer.parseInt(request.getParameter("productId")));
    } catch (ShopException e) {
        e.printStackTrace();
    }
%>
<div class="detailedProductContainer">
    <div class="imageAndPrice">
        <img src="data:image/jpeg;base64,<%out.print(thisProduct.getImage().getBase64());%>" alt="product image">
        <h2><%out.print(thisProduct.getPrice());%>$</h2>
    </div>
    <div class="nameAndDescription">
        <h1><%out.print(thisProduct.getName());%></h1>
        <p><%out.print(thisProduct.getDescription());%></p>
        <a href="${pageContext.request.contextPath}/actions/addProductToCartAction.jsp?productId=<%out.print(thisProduct.getId());%>"><button>Add to cart <i class="fa fa-cart-plus" aria-hidden="true"></i></button></a>
        <a href="actions/makeOrderFromDetailed.jsp?productId=<%out.print(thisProduct.getId());%>"><button>Order now <i class="fas fa-file-contract"></i></button></a>
        <%
        String msg = request.getParameter("msg");
        if ("fail".equals(msg)) {
        %>
        <h1 class="fail">Couldn't order this product :(( </h1>
        <%
            } else if ("success".equals(msg)) {
        %>
        <h1 class="success">Product Succesfully ordered. See your <a href="orders.jsp">orders</a></h1>
        <%
            }
        %>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>