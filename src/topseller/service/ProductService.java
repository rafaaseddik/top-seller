package topseller.service;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ProductService {
    public Product getProductByID(int id);
    public void reportProduct(ProductReport productReport);
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void deleteProduct(Product product);
    public void blockProduct(Product product);
    ArrayList<ProductReport> getProductReportsList();
    ArrayList<Product> getLatestProductsList(int number);

    ArrayList<Product> getProductsByShop(Shop shop);

    ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page);
    int nb_searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status , int limit);


    ArrayList<Pair<Category,ArrayList<Product>>> getRecommendedProducts();

    ArrayList<Product> getSuggestedProducts(Product product, int number);
}
