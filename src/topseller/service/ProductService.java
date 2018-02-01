package topseller.service;

import topseller.models.Product;
import topseller.models.Shop;
import topseller.models.ProductReport;

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

}
