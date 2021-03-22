<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        Connection connection = ConnectionProvider.getConnection();
        Statement statement = connection.createStatement();
        statement.executeUpdate("update products set name = '" + name + "', description = '" + description +"', price = '" + price + "' where id='" + id + "'");
        response.sendRedirect("/admin/allProductEditProduct.jsp?msg=done");
    } catch (Exception e){
        response.sendRedirect("/admin/allProductEditProduct.jsp?msg=wrong");
        System.out.println(e);
    }


%>