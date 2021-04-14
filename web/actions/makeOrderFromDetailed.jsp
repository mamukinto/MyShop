<%@ page import="model.CartProduct" %>
<%@ page import="model.Product" %>
<%@ page import="model.SingleOrder" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="service.dao.OrderDAO" %>
<%@ page import="service.helpers.OrderHelper" %>
<%@ page import="service.helpers.ProductHelper" %>
<%@ page import="service.utils.ShopUtils" %>
<%
    SingleOrder order = null;
    try {
        Product thisProduct = ProductHelper.getProductById(Integer.parseInt(request.getParameter("productId")));
        order = new SingleOrder(OrderHelper.getMaxId() + 1, session.getAttribute("email").toString(), ShopUtils.getFormattedDate(), new CartProduct(thisProduct));
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