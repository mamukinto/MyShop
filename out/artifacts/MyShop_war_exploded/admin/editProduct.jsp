<%@ page import="model.Product" %>
<%@ page import="service.ProductHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="java.util.concurrent.atomic.AtomicReference" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="service.ConnectionProvider" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
 <link rel="stylesheet" href="/resources/css/mainPage-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>

<%
 int id = Integer.parseInt(request.getParameter("id"));

 try {
   Connection connection = ConnectionProvider.getConnection();
   Statement statement = connection.createStatement();
  ResultSet resultSet = statement.executeQuery("select * from products where id = " + id + "");
  while (resultSet.next()) {
%>

 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

 <form action="${pageContext.request.contextPath}/actions/editProductAction.jsp" method="post" id="editForm">
  <h2>Product ID: <%out.print(request.getParameter("id"));%></h2>
  <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" name="name" value="<%out.print(resultSet.getString(2));%>">
<hr>
</div>

<div class="right-div">
<h3>Enter Description</h3>
 <textarea name="description" form="editForm" placeholder="<%out.print(resultSet.getString(3));%>"></textarea>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input type="number" name="price" value="<%out.print(resultSet.getDouble(4));%>">
<hr>
</div>
  <button>Edit<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
</div>


<%
 }
  connection.close();
} catch (Exception e) {
  System.out.println(e.getMessage());
 }

%>

</body>
<br><br><br>
</body>
</html>