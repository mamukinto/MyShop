<%@ page import="service.MessageHelper" %><%
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");
    String formattedDate = MessageHelper.getFormattedDate();
    String userEmail = (String) session.getAttribute("email");


// ეს უნდა მუშაობდეს
    // DAO კლასში გექნება sql exception ეგ დაიჭირე catch  და ჩვენი ექსეპშენი გაისროლე throw new ShopException(e.getmessage); :))
    try {
        MessageDAO messageDAO = new MessageDAO();
        messageDAO.addMessage(subject, message, formattedDate, userEmail);
        response.sendRedirect("/sendMessage.jps?msg=success");
    } catch (Exception e) {
        System.out.println(e.getMessage());
        response.sendRedirect("/sendMessage.jsp?msg=fail");
    }



%>