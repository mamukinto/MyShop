package model;

public class Message {
    private String subject;
    private String message;
    private String formattedDate;
    private String userEmail;

    public Message() {

    }

    public Message(String subject, String message, String formattedDate, String userEmail) {
        this.subject = subject;
        this.message = message;
        this.formattedDate = formattedDate;
        this.userEmail = userEmail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
