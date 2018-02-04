package topseller.service;

import topseller.models.*;

import java.util.ArrayList;

public interface ProductService {
    public Product getProductByID(int id);
    public void reportProduct(ProductReport productReport);
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void deleteProduct(Product product);
    public void blockProduct(Product product);
    public ArrayList<ProductReport> getProductReportsList();
    public ArrayList<Product> getLatestProductsList(int number);

    ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page);
}
