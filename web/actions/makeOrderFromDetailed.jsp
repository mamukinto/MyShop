<%@ page import="service.OrderDAO" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="service.ShopUtils" %>
<%@ page import="service.OrderHelper" %>
<%@ page import="service.ProductHelper" %>
<%@ page import="model.*" %><%
    SingleOrder order = null;
    try {
        Product thisProduct = ProductHelper.getProductById(Integer.parseInt(request.getParameter("productId")));
        order = new SingleOrder(OrderHelper.getMaxId() + 1,session.getAttribute("email").toString(), ShopUtils.getFormattedDate(), new CartProduct(thisProduct));
        order.setStatus("processing..");
    } catch (ShopException e) {
        e.printStackTrace();
    }
    OrderDAO orderDAO = new OrderDAO();
    try {
        orderDAO.addOrder(order);
    } catch (ShopException e) {
        response.sendRedirect("/detailedProduct.jsp?msg=fail&productId=" + request.getParameter("productId"));
        e.printStackTrace();
    }
    response.sendRedirect("/detailedProduct.jsp?msg=success&productId=" + request.getParameter("productId"));
%>