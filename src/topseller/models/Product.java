package topseller.models;

public class Product extends Subject{
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String description;
    private boolean closed;
    private Category category;
    private Shop shop;
}
