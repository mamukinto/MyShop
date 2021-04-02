<%@ page import="model.Product" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="service.ProductHelper" %>
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
    Product thisProduct = ProductHelper.getProductById(Integer.parseInt(request.getParameter("productId")));
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
        <button>Order now <i class="fas fa-file-contract"></i></button>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>