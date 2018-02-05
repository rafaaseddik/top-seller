package topseller.models;

public class ProductReport extends Report {
    public ProductReport() {
    }

    public ProductReport(String description, Subject subject, User user) {
        super(description, subject, user);
    }

    public Product getSubject() {
        return (Product) super.getSubject();
    }
}
