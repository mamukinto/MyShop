<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/mainPage-style.css">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="message-container">
    <div class="info">
        <h2>Send message to administration</h2>
        <%
            String message = request.getParameter("msg");
            if (message != null) {
                if (message.equals("success")) {
        %>
        <h2 class="success">Message sent. Thank you for feedback</h2>
        <%
        } else if (message.equals("fail")) {
        %>
        <h2 class="fail">Couldn't send message, Try again</h2>
        <%
                }
            }
        %>
    </div>

    <form action="actions/sendMessageAction.jsp" method="post" id="messageForm">
        <h3>Enter subject</h3>
        <input type="text" name="subject">
        <hr>
        <h3>Enter message</h3>
        <textarea form="messageForm" name="message"></textarea>
        <hr>
        <input type="submit" value="Send">
        <hr>
    </form>
</div>

<%@include file="footer.jsp" %>
</body>
</html>