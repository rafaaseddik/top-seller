package topseller.models;

import java.util.ArrayList;

public class Product extends Subject{
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String description;
    private boolean closed;
    private Category category;
    private Shop shop;
    private ProductStatus Status;
    private ArrayList<String> images = new ArrayList<String>();
    public static double MAX_PRICE = 100000;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isClosed() {
        return closed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public ProductStatus getStatus() {
        return Status;
    }

    public void setStatus(ProductStatus Status) {
        this.Status = Status;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public void addImage(String img){
        this.images.add(img);
    }
    public void deleteImageByName(String img){
        this.images.remove(img);
    }
    public void deleteImageByIndex(int index){
        this.images.remove(index);
    }
    public ArrayList<String> getImages(){
        return this.images;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", closed=" + closed +
                ", category=" + category +
                ", shop=" + shop +
                ", Status=" + Status +
                ((images.size()>0)?(", images=" + images ):"")+
                '}';
    }

    public static Product getMockProduct(){
        Product product = new Product();
        product.setName("iPhone X");
        product.setDescription("The most expensive phone ever");
        product.setQuantity(50);
        product.setPrice(26.36);
        product.setStatus(ProductStatus.BARELY_USED);
        product.setCategory(Category.getMockCategory());
        product.setShop(Shop.getMockShop());
        return product;
    }
}
