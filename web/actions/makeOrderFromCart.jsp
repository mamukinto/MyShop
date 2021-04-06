<%@ page import="model.Cart" %>
<%@ page import="model.Order" %>
<%@ page import="model.MultipleOrder" %>
<%@ page import="service.OrderDAO" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="service.ShopUtils" %>
<%@ page import="service.OrderHelper" %><%
    Cart cart = (Cart) session.getAttribute("cart");
    MultipleOrder order = null;
    try {
        order = new MultipleOrder(OrderHelper.getMaxId() + 1,session.getAttribute("email").toString(), ShopUtils.getFormattedDate());
        order.setStatus("processing..");
    } catch (ShopException e) {
        e.printStackTrace();
    }
    order.setProducts(cart.getProducts());
    OrderDAO orderDAO = new OrderDAO();
    try {
        orderDAO.addOrder(order);
    } catch (ShopException e) {
        response.sendRedirect("/cart.jsp?msg=fail");
        e.printStackTrace();
    }
    response.sendRedirect("/cart.jsp?msg=success");
%>