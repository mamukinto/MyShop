<%@ page import="service.helpers.UserHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="model.User" %>
<%@ page import="service.dao.UserDAO" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String number = request.getParameter("number");
    String oldPassword = request.getParameter("oldPassword");
    String newPasword = request.getParameter("newPassword");
    String password = null;
    String redirectPage = "";

    try {
        User user = UserHelper.getUserByEmail(email);
        if (user.getPassword().equals(oldPassword) && !oldPassword.equals("")) {
            password = newPasword;
        }
        UserDAO userDAO = new UserDAO();
        userDAO.updateUser(name, number, password, email);
        if (password == null) {
            redirectPage = "/changeUserDetails.jsp?msg=wrongPass";
        } else {
            redirectPage = "/changeUserDetails.jsp?msg=success";
        }
        response.sendRedirect(redirectPage);

    } catch (ShopException e) {
        e.printStackTrace();
    }
%>