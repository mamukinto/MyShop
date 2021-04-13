<%@ page import="model.Product" %>
<%@ page import="service.ProductDAO" %>
<%@ page import="service.ShopUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.UserDAO" %>
<%@ page import="service.UserHelper" %>
<%@ page import="model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <title>Home</title>
</head>
<body>
<%@include file="header.jsp" %>
<h2>Change your details <i class="fa fa-edit"></i></h2>
<%
String msg = request.getParameter("msg");
if ("success".equals(msg)) {
%>
<h1 class="success">Information succesfully updated</h1>
<%
    } else if ("wrongPass".equals(msg)) {
%>
<h1 class="fail">Wrong password. Try again.</h1>
<%
    }
  String email = (String) session.getAttribute("email");
  User thisUser = UserHelper.getUserByEmail(email);

%>

<form action="actions/updateUserAction.jsp" method="post">
    <input type="hidden" name="email" value="<%out.print(email);%>">
    Name:
    <input type="text" name="name" value="<%out.print(thisUser.getName());%>">
    <hr>
    Number:
    <input type="text" name="number" value="<%out.print(thisUser.getNumber());%>">
    <hr>
    If u dont want to change password leave this fields blank.
    <hr>
    old password:
    <input type="password" name="oldPassword">
    <hr>
    new password:
    <input type="password" name="newPassword">
    <hr>
    <input type="submit" value="Submit">
</form>

<%@include file="footer.jsp"%>
</body>
</html>