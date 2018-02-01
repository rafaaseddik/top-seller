package topseller.models;

public abstract class Report {
    private int id;
    private String description;
    private boolean validated;
    private Subject subject;
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isValidated() {
        return validated;
    }

    public void setValidated(boolean validated) {
        this.validated = validated;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Report{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", validated=" + validated +
                ", subject=" + subject +
                ", user=" + user +
                '}';
    }
}
