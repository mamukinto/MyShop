<%@ page import="service.ProductHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Cart" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    int productId = Integer.parseInt(request.getParameter("productId"));
    try {
        Product product = ProductHelper.getProductById(productId);
        String result = cart.addProduct(product);
        session.setAttribute("cart",cart);
        if (result.equals("success")) {
            response.sendRedirect("/home.jsp?msg=success");
        } else if (result.equals("already")) {
            response.sendRedirect("/home.jsp?msg=alreadyExists");
        }
    } catch (ShopException e) {
        e.printStackTrace();
    }

%>