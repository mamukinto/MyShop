<%@ page import="model.Product" %>
<%@ page import="service.dao.ProductDAO" %>
<%@ page import="java.util.List" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/mainPage-style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div>All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
    String msg = request.getParameter("msg");
    if (msg != null) {
        if (msg.equals("done")) {
%>
<h3 class="success">Product Successfully Updated!</h3>
<%
        } else if (msg.equals("wrong")) {
%>
<h3 class="fail">Some thing went wrong! Try again!</h3>
<%
        }
    }
%>

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col"><i class="fas fa-dollar-sign"></i> Price</th>
            <th>Description</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">   <i class="fas fa-trash-alt"></i></th>
          </tr>
        </thead>
        <tbody>
       <%
           try {
               ProductDAO productDAO = new ProductDAO();
               List<Product> products = productDAO.getProducts();
               for (Product product : products) {
       %>
          <tr>
            <td><%out.print(product.getId());%></td>
            <td><%out.print(product.getName());%></td>
            <td><%out.print(product.getPrice());%><i class="fas fa-dollar-sign"></i></td>
            <td><%out.print(product.getDescription());%></td>
            <td><a href="editProduct.jsp?id=<%out.print(product.getId());%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a href="${pageContext.request.contextPath}/actions/deleteProductAction.jsp?id=<%out.print(product.getId());%>">   <i class="fas fa-trash-alt"></i></a></td>

          </tr>
        <%
                }
            } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
        %>
         
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@include file="/footer.jsp" %>
</body>
</html>