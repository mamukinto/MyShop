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
        <a href="orders.jsp">My Orders <i class='fab fa-elementor'></i></a>
        <a href="changeUserDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
        <a href="sendMessage.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
        <a href="about.jsp">About <i class="fa fa-address-book"></i></a>
        <a href="login.jsp">Logout <i class='fas fa-share-square'></i></a>
        <form action="home.jsp" method="post">
            <i class="fas fa-search"></i>
            <input class="srch" type="text" name="keyword" placeholder="Search..">
        </form>
    </div>
</div>
<style>
    .srch {
        width: 0;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        background-color: white;
        background-position: 10px 10px;
        background-repeat: no-repeat;
        padding: 12px 20px 12px 40px;
        -webkit-transition: width 0.4s ease-in-out;
        transition: width 0.4s ease-in-out;
    }

    .srch:focus {
        width: 100%;
    }
</style>
