package topseller.models;

public class FormComment {
    public int rate;
    public String comment;

    public FormComment(int rate, String comment) {
        this.rate = rate;
        this.comment = comment;
    }

    public FormComment() {
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
