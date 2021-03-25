
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="/resources/css/admin-header.css">
    <title>admin page</title>
</head>
<div class="container">
<h2>MySHOP</h2>
    <div class="navbar">
    <%  if (session.getAttribute("email") == null) {
        response.sendRedirect("/error.jsp");
    }
//        String email = session.getAttribute("email").toString();

    %>
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">View or edit products <i class='fab fa-elementor'></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class='fas fa-comment-alt'></i></a>
            <a href="">Orders Received <i class="fas fa-archive"></i></a>
            <a href="">Canceled Orders <i class='fas fa-window-close'></i></a>
            <a href="">Delivered Orders <i class='fas fa-dolly'></i></a>
            <a href="${pageContext.request.contextPath}/login.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
</div>
