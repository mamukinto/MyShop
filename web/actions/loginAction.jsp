<%@ page import="model.Admin" %>
<%@ page import="service.LoginHelper" %>
<%@ page import="model.exceptions.ShopException" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email.equals(Admin.getID()) && password.equals(Admin.getPASSWORD())) {
        session.setAttribute("email",email);
        response.sendRedirect("/admin/adminHome.jsp");
    } else {
        try {
            if (LoginHelper.isValid(email,password)){
                session.setAttribute("email",email);
                response.sendRedirect("/home.jsp");
            } else {
                response.sendRedirect("/login.jsp?msg=invalid");
            }
        } catch (ShopException e) {
            response.sendRedirect("/login.jsp?msg=invalid");
            e.printStackTrace();
        }
    }
%>