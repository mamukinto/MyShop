<%@ page import="java.util.ArrayList" %>
<%@ page import="service.MessageDAO" %>
<%@ page import="model.Message" %>
<%@ page import="model.exceptions.ShopException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.org.apache.bcel.internal.generic.LDIV" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/resources/css/messages.css">
    <title>Document</title>
</head>
<body>
<%@include file="adminHeader.jsp"%>
<%
    try {
        MessageDAO messageDAO = new MessageDAO();
        List<Message> messages = messageDAO.getMessages();
        for (Message message : messages) {
%>
    <div class="message">
        <h2>Subject: <%out.print(message.getSubject());%></h2>
        <h2>Message: <%out.print(message.getMessage());%></h2>
        <h2>Date: <%out.print(message.getFormattedDate());%></h2>
        <h2>Sender: <%out.print(message.getUserEmail());%></h2>

    </div>
<%
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>
<%@include file="/footer.jsp"%>
</body>
</html>