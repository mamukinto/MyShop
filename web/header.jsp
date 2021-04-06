<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/admin-header.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<div class="container">
    <%
        if (session.getAttribute("email") == null) {
            response.sendRedirect("/error.jsp");
        }
    %>
    <div class="navbar">
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="cart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
            <a href="orders.jsp">My Orders  <i class='fab fa-elementor'></i></a>
            <a href="">Change Details <i class="fa fa-edit"></i></a>
            <a href="sendMessage.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
            <a href="">About <i class="fa fa-address-book"></i></a>
            <a href="login.jsp">Logout <i class='fas fa-share-square'></i></a>
            <i class="fas fa-search"></i>
          </div>
</div>
