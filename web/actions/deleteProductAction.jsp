<%@ page import="service.ProductHelper" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="java.sql.SQLException" %><%
int id = Integer.parseInt(request.getParameter("id"));
// [TODO] SHOULD LOOK LIKE THESE:
//    ProductDAO productDAO = new ProductDAO();
//    productDAO.removeProductById(id);
    try {
        Connection c = ConnectionProvider.getConnection();
        Statement statement = c.createStatement();
        statement.executeUpdate("DELETE FROM products WHERE id = " + id);
    } catch (ShopException | SQLException e) {
        e.printStackTrace();
    }
    response.sendRedirect("/admin/allProductEditProduct.jsp");
%>