<%@ page import="service.ProductDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.PreparedStatement" %><%
 int id = Integer.parseInt(request.getParameter("id"));
 String name = request.getParameter("name");
 String description = request.getParameter("description");
 double price = Double.parseDouble(request.getParameter("price"));

 try {
//  [TODO] THIS SHOULD BE ProductDAO.addProduct();
  Connection c = ConnectionProvider.getConnection();
  PreparedStatement ps = c.prepareStatement("insert into products values(?,?,?,?)");
  ps.setInt(1,id);
  ps.setString(2,name);
  ps.setString(3,description);
  ps.setDouble(4,price);
  ps.executeUpdate();

  response.sendRedirect("/admin/addNewProduct.jsp?msg=done");
 } catch (Exception e) {
  response.sendRedirect("/admin/addNewProduct.jsp?msg=wrong");
  System.out.println(e.getMessage());
 }
%>
