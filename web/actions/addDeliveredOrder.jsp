<%@ page import="model.exceptions.ShopException" %>
<%@ page import="service.dao.OrderDAO" %>
<%
    OrderDAO orderDAO = new OrderDAO();
    try {
        orderDAO.changeOrderStatus("delivered", request.getParameter("orderId"));
    } catch (ShopException e) {
        response.sendRedirect("/admin/ordersReceived.jsp?msg=deliveredFail");
        e.printStackTrace();
    }
    response.sendRedirect("/admin/ordersReceived.jsp?msg=deliveredSuccess");
%>