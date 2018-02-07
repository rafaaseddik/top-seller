package topseller.models;

import java.util.Date;

public class Message {
    private int id;
    private String fullname;
    private String subject;
    private String email;
    private String message;
    private Date date;
    private boolean read;

    public Message() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", subject='" + subject + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", date=" + date +
                ", read=" + read +
                '}';
    }
}
