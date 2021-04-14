<%@ page import="service.dao.ProductDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        ProductDAO productDAO = new ProductDAO();
        productDAO.updateProduct(id,name,description,price);
        response.sendRedirect("/admin/allProductEditProduct.jsp?msg=done");
    } catch (Exception e){
        response.sendRedirect("/admin/allProductEditProduct.jsp?msg=wrong");
        System.out.println(e);
    }


%>