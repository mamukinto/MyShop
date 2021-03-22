<%@page import="service.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="service.UserDAO" %>
<%@ page import="model.User" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("number");
String password = request.getParameter("password");

    try {
        UserDAO userDAO = new UserDAO();
        userDAO.addUser(name,email,mobileNumber,password);
        response.sendRedirect("/signup.jsp?msg=valid");
    }
    catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
        response.sendRedirect("/signup.jsp?msg=invalid");
    }

%>