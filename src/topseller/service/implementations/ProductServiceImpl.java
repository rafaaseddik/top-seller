package topseller.service.implementations;

import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.DAO.ProductDAO;
import topseller.models.*;
import topseller.service.ProductService;

import java.util.ArrayList;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDAO productDAO;

    @Override
    public Product getProductByID(int id) {
        return this.productDAO.getProductByID(id);
    }
    @Override
    public ArrayList<Product> getAllProducts(){return this.productDAO.getAllProducts();}
    @Override
    public void reportProduct(ProductReport productReport) {
        this.productDAO.reportProduct(productReport);

    }
    @Override
    public void addProduct(Product product){
        this.productDAO.addProduct(product);
    }
    @Override
    public void updateProduct(Product product) {
        this.productDAO.updateProduct(product);
    }
    @Override
    public void deleteProduct(Product product) {
        this.productDAO.deleteProduct(product);
    }
    @Override
    public void blockProduct(Product product) {
        this.productDAO.blockProduct(product);
    }
    //TODO
    @Override
    public ArrayList<ProductReport> getProductReportsList() {
        return this.productDAO.getProductReportsList();
    }
    @Override
    public ArrayList<Product> getLatestProductsList(int number){
        return this.productDAO.getLatestProductsList(number);
    }
    @Override
    public ArrayList<Product> getProductsByShop(Shop shop){
        return this.productDAO.getProductsByShop(shop);
    }
    @Override
    public ArrayList<Product> searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit, int page){
        if(category.equals(Category.ANY_CATEGORY()))
            return this.productDAO.searchProductsNoCategory(name,max_price,min_price,status,limit,page);
        return this.productDAO.searchProducts(name,category,max_price,min_price,status,limit,page);
    }

    @Override
    public int nb_searchProducts(String name, Category category, double max_price, double min_price, ProductStatus status, int limit) {
        if(category.equals(Category.ANY_CATEGORY()))
            return this.productDAO.nb_searchProductsNoCategory(name,max_price,min_price,status,limit);
        return this.productDAO.nb_searchProducts(name,category,max_price,min_price,status,limit);
    }

    @Override
    public ArrayList<Pair<Category,ArrayList<Product>>> getRecommendedProducts(){
        return this.productDAO.getRecommendedProducts();
    }
    @Override
    public ArrayList<Product> getSuggestedProducts(Product product, int number){
        return this.productDAO.getSuggestedProducts(product,number);
    }
    @Override
    public void addPictureToProduct(Product product, String pictureName){
        this.productDAO.addPictureToProduct(product,pictureName);
    }
    @Override
    public void deletePictureFromProduct(Product product, String pictureName){
        this.productDAO.deletePictureFromProduct(product,pictureName);
    }
}
