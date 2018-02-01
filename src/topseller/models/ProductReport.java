package topseller.models;

public class ProductReport extends Report {

    public Product getSubject() {
        return (Product) super.getSubject();
    }
}
