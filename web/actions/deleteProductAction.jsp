<%@ page import="service.ProductHelper" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="java.sql.SQLException" %><%
int id = Integer.parseInt(request.getParameter("id"));

    ProductDAO productDAO = new ProductDAO();
    productDAO.removeProductById(id);
    response.sendRedirect("/admin/allProductEditProduct.jsp");
%>