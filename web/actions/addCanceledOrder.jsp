<%@ page import="model.Order" %>
<%@ page import="service.OrderHelper" %>
<%@ page import="service.OrderDAO" %>
<%@ page import="model.exceptions.ShopException" %><%
    OrderDAO orderDAO = new OrderDAO();
    try {
        orderDAO.changeOrderStatus("canceled",request.getParameter("orderId"));
    } catch (ShopException e) {
        response.sendRedirect("/admin/ordersReceived.jsp?msg=canceledFail");
        e.printStackTrace();
    }
    response.sendRedirect("/admin/ordersReceived.jsp?msg=canceledSuccess");
%>