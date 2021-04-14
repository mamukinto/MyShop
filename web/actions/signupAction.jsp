<%@page import="service.dao.UserDAO" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobileNumber = request.getParameter("number");
    String password = request.getParameter("password");

    try {
        UserDAO userDAO = new UserDAO();
        userDAO.addUser(name, email, mobileNumber, password);
        response.sendRedirect("/signup.jsp?msg=valid");
    } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
        response.sendRedirect("/signup.jsp?msg=invalid");
    }

%>