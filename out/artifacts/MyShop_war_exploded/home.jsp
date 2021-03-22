<%@ page import="model.Product" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
<title>Home</title>
</head>
<body>
<%@include file="header.jsp" %>
<h2>Home <i class="fa fa-institution"></i></h2>

<%
String msg = request.getParameter("msg");
if (msg != null) {
    if (msg.equals("success")) {
%>
<h3 class="alert">Product added successfully!</h3>
<%
    } else if (msg.equals("alreadyExists")) {
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%
    }
    }
%>



<table style="width: 100%; border: 2px solid #2b2b2b;">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price  <i class="fas fa-dollar-sign"></i> </th>
            <th scope="col">Add to cart<i class='fas fa-cart-plus'></i></th>
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
              <td><%out.print(product.getDescription());%></td>
            <td><%out.print(product.getPrice());%><i class="fas fa-dollar-sign"></i></td>
            <td><a href="">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>

        <%
                }
            } catch (Exception e) {
                    System.out.println(e);
                }
        %>

        </tbody>
      </table>
<%@include file="footer.jsp" %>
</body>
</html>