<%@ page import="model.exceptions.ShopException" %>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
    <link rel="stylesheet" href="resources/css/signup-style.css">
</head>
<body>
<div id='container'>

  <div class='signup'>

      <form action="actions/signupAction.jsp" method="post">
          <h5>Sign up to enter store</h5>
          <input type="text" name="name" placeholder="Enter name" required>
          <input type="email" name="email" placeholder="Enter email" required>
          <input type="number" name="number" placeholder="Enter phone number" required>
          <input type="password" name="password" placeholder="Enter password" required>
          <input type="submit" value="Sign up">
      </form>
  </div>

  <div class="result">
      <p><b>My shop</b></p>
      <p>Its online store, product management system for my programming school final project.</p>
      <form action="login.jsp">
          <input type="submit" value="Log in">
      </form>
<%
    try {
        String msg = request.getParameter("msg");
        if (msg.equals("valid")){
%>
<h1 class="success">succesfuly registered</h1>
<%
    } else if (msg.equals("invalid")){
%>
<h1 class="fail">Something Went Wrong! Try Again !</h1>
<%
    }}
    catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>
  </div>
</div>


</body>
</html>