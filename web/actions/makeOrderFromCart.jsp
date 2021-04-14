<%@ page import="model.Cart" %>
<%@ page import="model.MultipleOrder" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="service.dao.OrderDAO" %>
<%@ page import="service.helpers.OrderHelper" %>
<%@ page import="service.utils.ShopUtils" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    MultipleOrder order = null;
    try {
        order = new MultipleOrder(OrderHelper.getMaxId() + 1, session.getAttribute("email").toString(), ShopUtils.getFormattedDate());
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