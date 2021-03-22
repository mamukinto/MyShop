
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="actions/loginAction.jsp" method="post">
          <h5>Log in to enter store</h5>
          <input type="email" name="email" placeholder="Enter email" required>
          <input type="password" name="password" placeholder="Enter password" required>
          <input type="submit" value="Log in">
      </form>
  </div>
  <div class='result'>
    <p><b>My shop</b></p>
      <p>Its online store, product management system for my programming school final project.</p>
      <%
          String msg = request.getParameter("msg");
              if (msg == null) {
              } else if (msg.equals("invalid")) {
      %>
      <h1 class="fail">Incorrect Username or Password</h1>
      <%
          }
      %>
      <form action="signup.jsp">
          <input type="submit" value="Sign up">
      </form>
  </div>
</div>

</body>
</html>