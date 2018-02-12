package topseller.DAO;

import javafx.util.Pair;
import topseller.models.*;

import java.util.ArrayList;

public interface ProductDAO {
    Product getProductByID(int id, boolean isAdmin);

    ArrayList<Product> getAllProducts();

    public void reportProduct(ProductReport productReport);
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void deleteProduct(Product product);
    void blockProduct(Product product);

    void unblockProduct(Product product);

    ArrayList<ProductReport> getProductReportsList();
    ArrayList<Product> getLatestProductsList(int number);
    ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page);

    ArrayList<Product> searchProductsNoCategory(String name, double max_price, double min_price, ProductStatus status, int limit, int page);

    int nb_searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status , int limit);

    int nb_searchProductsNoCategory(String name, double max_price, double min_price, ProductStatus status , int limit);

    ArrayList<String> getProductImages(Product product);

    ArrayList<Product> getProductsByShop(Shop shop);

    ArrayList<Product> getSuggestedProducts(Product product, int number);

    void addPictureToProduct(Product product, String pictureName);

    void deletePictureFromProduct(Product product, String pictureName);

    ArrayList<Pair<Category,ArrayList<Product>>> getRecommendedProducts();
}
