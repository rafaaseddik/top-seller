package topseller.DAO;

import topseller.models.Category;
import topseller.models.Product;
import topseller.models.ProductReport;
import topseller.models.ProductStatus;

import java.util.ArrayList;

public interface ProductDAO {
    public Product getProductByID(int id);
    public void reportProduct(ProductReport productReport);
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void deleteProduct(Product product);
    public void blockProduct(Product product);
    public ArrayList<ProductReport> getProductReportsList();
    public ArrayList<Product> getLatestProductsList(int number);
    public ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page);

    ArrayList<Product> searchProductsNoCategory(String name, double max_price, double min_price, ProductStatus status, int limit, int page);

    ArrayList<String> getProductImages(Product product);
}
