<%@ page import="model.Product" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="service.ShopUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <title>Home</title>
</head>
<body>
<%@include file="header.jsp" %>
<h2>Home <i class="fa fa-institution"></i></h2>


<%
    String msg = request.getParameter("msg");
    String keyword = request.getParameter("keyword");
    if (msg != null) {
        if (msg.equals("success")) {
%>
<h3 class="alert">Product added successfully!</h3>
<%
} else if (msg.equals("alreadyExists")) {
%>
<h3 class="alert">Product already exist in you cart! Quantity increased!</h3>
<%
        }
    }
%>

<div class="mainContainer">
    <%
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = new ArrayList<>();
            if (keyword == null) {
                products = productDAO.getProducts();
            } else {
                products = productDAO.getProductsByKeyword(keyword);
            }
            for (Product product : products) {
    %>
    <div class="productContainer">
        <img class="productImage" src="data:image/jpeg;base64,<%out.print(product.getImage().getBase64());%>"
             alt="product ID: <%out.print(product.getId());%>">
        <h3 class="productInfo"><%out.print(product.getName());%></h3>
        <h3 class="productInfo"><%out.print(ShopUtils.getShortDescription(product.getDescription()));%></h3>
        <h3 class="productInfo"><%out.print(product.getPrice());%>$</h3>
        <a href="${pageContext.request.contextPath}/actions/addProductToCartAction.jsp?productId=<%out.print(product.getId());%>">
            <button>Add to cart<i class='fas fa-cart-arrow-down'></i></button>
        </a>
        <a href="${pageContext.request.contextPath}/detailedProduct.jsp?productId=<%out.print(product.getId());%>">
            <button>More information<i class="far fa-clone"></i></button>
        </a>
    </div>

    <%
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    %>
</div>
<%@include file="footer.jsp" %>
</body>
</html>