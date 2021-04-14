<%@ page import="service.utils.ShopUtils" %>
<%@ page import="service.dao.MessageDAO" %>
<%
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");
    String formattedDate = ShopUtils.getFormattedDate();
    String userEmail = (String) session.getAttribute("email");


    try {
        MessageDAO messageDAO = new MessageDAO();
        messageDAO.addMessage(subject, message, formattedDate, userEmail);
        response.sendRedirect("/sendMessage.jsp?msg=success");
    } catch (Exception e) {
        System.out.println(e.getMessage());
        response.sendRedirect("/sendMessage.jsp?msg=fail");
    }


%>