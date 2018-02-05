package topseller.models;


public class ShopReport extends Report {
    public ShopReport() {
    }

    public ShopReport(String description, Subject subject, User user) {
        super(description, subject, user);
    }

    public Shop getSubject() {
        return (Shop) super.getSubject();
    }
}
