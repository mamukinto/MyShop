<%@ page import="service.ProductDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.PreparedStatement" %><%
 int id = Integer.parseInt(request.getParameter("id"));
 String name = request.getParameter("name");
 String description = request.getParameter("description");
 double price = Double.parseDouble(request.getParameter("price"));

 try {
  ProductDAO  productDAO = new ProductDAO();
  productDAO.addProduct(id,name,description,price);
  productDAO.addImage(session.getAttribute("image64").toString(),id + "");

  response.sendRedirect("/admin/addNewProduct.jsp?msg=done");
 } catch (Exception e) {
  response.sendRedirect("/admin/addNewProduct.jsp?msg=wrong");
  System.out.println(e.getMessage());
 }
%>
