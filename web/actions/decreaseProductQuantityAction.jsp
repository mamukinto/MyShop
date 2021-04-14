<%@ page import="model.Cart" %>
<%@ page import="model.exceptions.ShopException" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    int productId = Integer.parseInt(request.getParameter("productId"));
    try {
        cart.decrementQuantity(productId);
        response.sendRedirect("/cart.jsp");
    } catch (ShopException e) {
        System.out.println(e.getMessage());
    }

%>