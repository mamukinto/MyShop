<%@page import="service.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="service.ProductHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="model.Product" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
 <link rel="stylesheet" href="/resources/css/mainPage-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
 if (msg == null) {
 } else if (msg.equals("done")) {

%>
<h3 class="alert">Product Added Successfully!</h3>
<%
 } else if (msg.equals("wrong")) {

%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
 }
 int id = 1;
 try {
   id = ProductHelper.getMaxId() + 1;
   session.setAttribute("id",id);
 } catch (ShopException e) {
  e.printStackTrace();
 }
%>


<form action="${pageContext.request.contextPath}/actions/addNewProductAction.jsp" method="post" id="addForm">
<h3>Product ID: <% out.print(id); %></h3>
 <input type="hidden" name="id" value="<% out.print(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" name="name" placeholder="Enter name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Description:</h3>
 <textarea name="description" form="addForm" placeholder="Description here..."></textarea>
<hr>
</div>

<div class="left-div">
<h3>Enter Price ($)</h3>
 <input type="number" name="price">
<hr>
</div>
 <button><i class='far fa-arrow-alt-circle-right'>Save</i></button>
</form>

<form action="${pageContext.request.contextPath}/UploadServlet" method="post" enctype="multipart/form-data">

 <input type="file" name="image"/>
 <button>Submit image</button>
 <%
  if ("added".equals(request.getParameter("img"))) {
 %>
 <i class="fas fa-check"></i>
 <%
  }
 %>

</form>

<%@include file="/footer.jsp" %>
</body>
<br><br><br>
</html>