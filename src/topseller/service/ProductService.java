package topseller.service;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ProductService {
    Product getProductByID(int id);

    Product getAdminProductByID(int id);

    ArrayList<Product> getAllProducts();


    void reportProduct(ProductReport productReport);

    void addProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(Product product);

    void blockProduct(Product product);

    void unblockProduct(Product product);

    ArrayList<ProductReport> getProductReportsList();

    ArrayList<Product> getLatestProductsList(int number);

    ArrayList<Product> getProductsByShop(Shop shop);

    ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page);

    int nb_searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit);


    ArrayList<Pair<Category, ArrayList<Product>>> getRecommendedProducts();

    ArrayList<Product> getSuggestedProducts(Product product, int number);

    void addPictureToProduct(Product product, String pictureName);

    void deletePictureFromProduct(Product product, String pictureName);
}
